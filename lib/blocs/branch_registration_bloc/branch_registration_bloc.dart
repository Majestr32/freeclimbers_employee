import 'package:bloc/bloc.dart';
import 'package:climbers/blocs/branches_cubit/branches_cubit.dart';
import 'package:climbers/custom_error.dart';
import 'package:climbers/models/required_fields/required_fields.dart';
import 'package:climbers/repositories/qr_code/qr_code_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/app_documents/app_documents.dart';
import '../../models/branch_qr_data/branch_qr_data.dart';
import '../../repositories/app/app_repository.dart';

part 'branch_registration_event.dart';
part 'branch_registration_state.dart';
part 'branch_registration_bloc.freezed.dart';

class BranchRegistrationBloc extends Bloc<BranchRegistrationEvent, BranchRegistrationState> {
  final QrCodeRepository _qrCodeRepository;
  final AppRepository _appRepository;
  final BranchesCubit _branchesCubit;

  Future _receivedDataFromScanner(_ReceivedDataFromScannerEvent event, Emitter<BranchRegistrationState> emit) async{
    try{
      final data = await _qrCodeRepository.getDataFromQrCode(code: event.data);
      final documents = await _appRepository.getTermsAndServices(branchId: int.parse(data.no));
      if(_branchesCubit.state.branches.any((b) => b.branchId == data.id)){
        emit(BranchRegistrationState.error(
            branchData: data,
            error: const CustomError(code: 400, message: 'You are already registered to this branch', localizationCode: 'branch-already-registered')));
        emit(const BranchRegistrationState.initial());
        return;
      }
      emit(BranchRegistrationState.foundBranch(branchData: data, documents: documents));
    }on CustomError catch(e){
      emit(BranchRegistrationState.error(error: e, branchData: null));
      emit(const BranchRegistrationState.initial());
    }catch(e){
      rethrow;
    }
  }
  Future _confirmBranchTerms(_ConfirmBranchTermsEvent event, Emitter<BranchRegistrationState> emit) async{
    try{
      final foundBranchState = state as _FoundBranchState;
      final appData = await _appRepository.getBranchSettings(branchId: foundBranchState.branchData?.no == null ? null : int.parse(foundBranchState.branchData!.no));
      emit(BranchRegistrationState.added(branchData: foundBranchState.branchData!, requiredFields: appData.required));
    }on CustomError catch(e){
      emit(BranchRegistrationState.error(error: e, branchData: null));
      emit(const BranchRegistrationState.initial());
    }catch(e){
      rethrow;
    }
  }

  Future _rejectBranchTerms(_RejectBranchTermsEvent event, Emitter<BranchRegistrationState> emit) async{
    emit(const BranchRegistrationState.rejected());
  }

  BranchRegistrationBloc({
    required QrCodeRepository qrCodeRepository,
    required AppRepository appRepository,
    required BranchesCubit branchesCubit
  })  : _qrCodeRepository = qrCodeRepository,
        _appRepository = appRepository,
        _branchesCubit = branchesCubit,
        super(const BranchRegistrationState.initial()){
    on<BranchRegistrationEvent>((event,emit) async{
      await event.map(receivedDataFromScanner: (e) => _receivedDataFromScanner(e,emit),
          confirmBranchTerms: (e) => _confirmBranchTerms(e,emit),
          rejectBranchTerms: (e) => _rejectBranchTerms(e,emit));
    });
  }
}
