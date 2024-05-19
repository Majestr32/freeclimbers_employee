
import 'dart:async';
import 'dart:developer';
import 'package:universal_io/io.dart';

import 'package:freeclimbers_employee/blocs/app_cubit/app_cubit.dart';
import 'package:freeclimbers_employee/blocs/branch_registration_bloc/branch_registration_bloc.dart';
import 'package:freeclimbers_employee/blocs/branches_cubit/branches_cubit.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/repositories/app/app_repository.dart';
import 'package:freeclimbers_employee/repositories/branches/branches_repository.dart';
import 'package:freeclimbers_employee/repositories/qr_code/qr_code_repository.dart';
import 'package:freeclimbers_employee/ui/popups/branch_change_success/branch_change_success.dart';
import 'package:freeclimbers_employee/ui/popups/branch_confirmation/branch_confirmation.dart';
import 'package:freeclimbers_employee/utils/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../blocs/member_cubit/member_cubit.dart';

Future<void> openScanBranch(BuildContext context){
  return showModalBottomSheet(
    useRootNavigator: true,
      backgroundColor: context.readColors!.basePrimaryBack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      isScrollControlled: true,
      context: context, builder: (context){
    return Theme(
        data: ThemeData(
            fontFamily: 'OpenSans'
        ),
        child: _ScanBranch());
  });
}

class _ScanBranch extends StatefulWidget {
  const _ScanBranch({Key? key}) : super(key: key);

  @override
  State<_ScanBranch> createState() => _ScanBranchState();
}

class _ScanBranchState extends State<_ScanBranch> {
  QRViewController? _controller;
  bool _canScan = true;
  late final BranchRegistrationBloc _branchRegistrationBloc = BranchRegistrationBloc(qrCodeRepository: context.read<QrCodeRepository>(), branchesCubit: context.read<BranchesCubit>(), appRepository: context.read<AppRepository>());
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller!.pauseCamera();
    } else if (Platform.isIOS) {
      _controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if(!_canScan){
        return;
      }
      _canScan = false;
      String? code = scanData.code;
      if(code == null){
        return;
      }
      String formattedCode = code.replaceFirst("REGISTRATION;BRANCH;", "");
      _branchRegistrationBloc.add(BranchRegistrationEvent.receivedDataFromScanner(data: formattedCode));
      Future.delayed(Duration(seconds: 2), (){
        if(!mounted){
          return;
        }
        setState(() {
        _canScan = true;
      });});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BranchRegistrationBloc, BranchRegistrationState>(
      bloc: _branchRegistrationBloc,
  listener: (context, state) {
    state.maybeWhen(
        foundBranch: (data,documents) async{
          Navigator.of(context).pop();
          await showBranchConfirmationPopup(context, _branchRegistrationBloc);
        },
        error: (error, branchData){
          if(error.localizationCode == 'branch-already-registered'){
            context.read<AppCubit>().changeDefaultBranch(int.parse(branchData!.no)).then((_){
              Navigator.of(context).pop();
              showBranchChangeSuccessPopup(context);
            });
            //AppToast.instance.showError(context, AppLocalizations.of(context)!.already_registered_to_branch);
          }else{
            AppToast.instance.showError(context, AppLocalizations.of(context)!.no_usable_data_found);
          }
        },
        orElse: (){});
  },
  child: SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.85,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 5,),
              Center(
                child: Container(
                  height: 5,
                  width: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFF787878),
                  ),
                ),
              ),
              SizedBox(height: 70,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 14, top: 17),
                        child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              FontAwesomeIcons.times,
                              color: context.readColors!.basePrimaryText,
                              size: 24,
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 17),
                          child: Text(AppLocalizations.of(context)!.scan_qr_code, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: context.readColors!.basePrimaryText),)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Text(AppLocalizations.of(context)!.scan_qr_code_to_join_branch, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: context.readColors!.basePrimaryText),),
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: QRView(
                  key: _qrKey,
                  overlay: QrScannerOverlayShape(
                    borderLength: 30
                  ),
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
);
  }
}
