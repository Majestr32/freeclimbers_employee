import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:freeclimbers_employee/blocs/connectivity_bloc/connectivity_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:freeclimbers_employee/models/app_documents/app_documents.dart';
import 'package:freeclimbers_employee/models/app_settings/app_settings.dart';
import 'package:freeclimbers_employee/repositories/app/app_repository.dart';
import 'package:equatable/equatable.dart';

import '../../custom_error.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {

  final AppRepository _appRepository;
  final ConnectivityBloc _connectivityBloc;
  final int? defaultBranch;
  StreamSubscription? _branchesCubitStreamSubscription;
  late StreamSubscription _connectivityBlocStreamSubscription;
  late StreamSubscription _memberCubitStreamSubscription;

  Future<void> loadAppSettings() async{
    if(defaultBranch == null){
      _loadAppSettingsWithBranches();
    }else{
      _loadAppSettingsNoBranches();
    }
  }

  Future<void> _loadAppSettingsNoBranches() async{
    final previousState = state;
    try{
      int? selectedBranch = defaultBranch ?? (_appRepository.getSelectedBranchId() == null ? null : int.parse(_appRepository.getSelectedBranchId()!));
      final settings = await _appRepository.getBranchSettings(branchId: selectedBranch);
      final documents = await _appRepository.getTermsAndServices(branchId: selectedBranch);
      final logo = await _appRepository.getBase64Logo(branchId: selectedBranch);
      emit(AppState.initial().copyWith(settings: settings, selectedBranchId: selectedBranch, documents: documents, branchIcon: logo == null ? null : base64Decode(logo), status: AppStateStatus.loaded));
    }on CustomError catch(e){
      emit(state.copyWith(status: AppStateStatus.error, error: e));
      emit(previousState);
    }
  }

  Future<void> _loadAppSettingsWithBranches() async{
    final previousState = state;
    try{
      int? selectedBranchFromShared = _appRepository.getSelectedBranchId() == null ? null : int.parse(_appRepository.getSelectedBranchId()!);

      final settings = await _appRepository.getBranchSettings(branchId: selectedBranchFromShared);
      final documents = await _appRepository.getTermsAndServices(branchId: selectedBranchFromShared);
      final logo = await _appRepository.getBase64Logo(branchId: selectedBranchFromShared);
      emit(AppState.initial().copyWith(settings: settings, selectedBranchId: selectedBranchFromShared, documents: documents, branchIcon: logo == null ? null : base64Decode(logo), status: AppStateStatus.loaded));
    }on CustomError catch(e){
      emit(state.copyWith(status: AppStateStatus.error, error: e));
      emit(previousState);
    }
  }


  Future<void> changeDefaultBranch(int branchId) async{
    try{
      emit(state.copyWith(status: AppStateStatus.changingBranch));
      await _appRepository.setSelectedBranchId(branchId.toString());
      await loadAppSettings();
      emit(state.copyWith(status: AppStateStatus.changedBranch));
    }on CustomError catch(e){
      emit(state.copyWith(status: AppStateStatus.error, error: e));
    }
  }



  AppCubit({
    required AppRepository appRepository,
    required ConnectivityBloc connectivityBloc,
    this.defaultBranch
  })  : _connectivityBloc = connectivityBloc,
        _appRepository = appRepository, super(AppState.initial()){
    _connectivityBlocStreamSubscription = _connectivityBloc.stream.listen((event) {
      event.maybeMap(
          active: (_) async{
            if(state.status == AppStateStatus.initial || state.status == AppStateStatus.error){
              await loadAppSettings();
            }
          },
          orElse: (){});
    });
  }

  @override
  Future<void> close() {
    _branchesCubitStreamSubscription?.cancel();
    _connectivityBlocStreamSubscription.cancel();
    _memberCubitStreamSubscription.cancel();
    return super.close();
  }
}
