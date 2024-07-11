import 'package:climbers/services/qr_code/qr_code_service_contract.dart';

import '../../models/branch_qr_data/branch_qr_data.dart';

class QrCodeRepository{
  final IQrCodeService _qrCodeService;

  ///Throws CustomError(code: 400, message: 'Branch not found', localizationCode: 'branch-not-found'); if branch not found
  Future<BranchQrData> getDataFromQrCode({required String code})
    => _qrCodeService.getDataFromQrCode(code: code);

  const QrCodeRepository({
    required IQrCodeService qrCodeService,
  }) : _qrCodeService = qrCodeService;
}