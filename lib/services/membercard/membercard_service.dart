import 'dart:developer';

import 'package:freeclimbers_employee/services/membercard/membercard_service_contract.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wallet/flutter_wallet.dart';

class MemberCardService implements IMemberCardService{

  @override
  Future<bool> openPkPass(Uint8List data) async{
    try {
      return (await FlutterWallet.addPass(pkpass: data)) ?? false;
    } catch (e) {
      log("PKPASS error occured: " + e.toString());
      rethrow;
    }
  }

}