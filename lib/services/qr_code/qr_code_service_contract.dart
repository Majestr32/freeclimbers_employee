import '../../models/branch_qr_data/branch_qr_data.dart';

abstract class IQrCodeService{
  Future<BranchQrData> getDataFromQrCode({required String code});
}