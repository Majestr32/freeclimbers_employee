import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:climbers/blocs/member_cubit/member_cubit.dart';
import 'package:climbers/data/shared_prefs/app_shared_prefs_contract.dart';
import 'package:equatable/equatable.dart';

import '../../custom_error.dart';
import '../../models/branch/branch.dart';
import '../../repositories/app/app_repository.dart';
import '../../repositories/branches/branches_repository.dart';

part 'branches_state.dart';

class BranchesCubit extends Cubit<BranchesState> {
  final BranchRepository _branchesRepository;
  final MemberCubit _memberCubit;
  final IAppSharedPrefs _sharedPrefs;
  late final StreamSubscription _memberCubitStreamSubscription;

  Future<void> loadBranches() async{
    try{
      final branches = await _branchesRepository.listBranches(token: _memberCubit.state.accessToken!);
      final branchesOrders = _sharedPrefs.getBranchesOrders();
      Map<Branch,int> prioritizedBranches = {};
      for(var branch in branches){
        prioritizedBranches[branch] = branchesOrders['branchId.${branch.details.no}'] ?? -1;
      }
      final sortedBranches = (prioritizedBranches.entries.toList()..sort((a,b) => a.value == -1 ? -1 : a.value.compareTo(b.value))).map((e) => e.key).toList();
      emit(state.copyWith(branches: sortedBranches, status: BranchesStateStatus.loaded));
    }on CustomError catch(e){
      return;
    }
  }

  Future<void> addBranch(String branchId, String branchNo) async{
      await _branchesRepository.addBranch(branchId: branchId, token: _memberCubit.state.accessToken!);
      await loadBranches();
      emit(state.copyWith(status: BranchesStateStatus.added, lastAddedBranchNo: branchNo));
  }

  Future<void> deleteBranch(String branchId) async{
    try{
      _branchesRepository.removeBranch(branchId: branchId, token: _memberCubit.state.accessToken!);
      emit(state.copyWith(branches: state.branches.where((b) => b.branchId != branchId).toList()));
    }on CustomError catch(e){
      return;
    }
  }

  Future<void> changeBranchOrder({required Map<String,int> branchOrders}) async{
    _sharedPrefs.setBranchOrder(branchOrders);
  }

  void reset(){
    emit(BranchesState.initial());
  }

  BranchesCubit({
    required BranchRepository branchesRepository,
    required AppRepository appRepository,
    required MemberCubit memberCubit,
    required IAppSharedPrefs sharedPrefs
  })  : _branchesRepository = branchesRepository,
        _sharedPrefs = sharedPrefs,
        _memberCubit = memberCubit, super(BranchesState.initial()){
    _memberCubitStreamSubscription = _memberCubit.stream.listen((event) {
      if(event.status == MemberStateStatus.unauthenticated){
        reset();
      }else if (event.status == MemberStateStatus.authenticated){
        if(state.branches.isNotEmpty){
          return;
        }
        loadBranches();
      }
    });
  }

  @override
  Future<void> close() {
    _memberCubitStreamSubscription.cancel();
    return super.close();
  }
}
