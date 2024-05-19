import 'dart:developer';
import 'package:universal_io/io.dart';
import 'dart:typed_data';

import 'package:freeclimbers_employee/consts/k_colors.dart';
import 'package:freeclimbers_employee/models/color_set/color_set.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../ui/widgets/registration_code/registration_code.dart';

class NotificationBar {
  NotificationBar._internal();
  static final NotificationBar _instance = NotificationBar._internal();
  static NotificationBar get instance => _instance;

  Future showBranchRegistrationNotification(BuildContext context,Uint8List branchImage, DateTime time, ColorSet colorSet,Uint8List qr, String code) async{
    return showDialog(context: context,
        builder: (context){
      return Dialog(
        backgroundColor: KColors.transparent,
          insetPadding: EdgeInsets.zero,
          child: RegistrationCodeWidget(code: code, context: context, qr: qr, time: time, branchImage: branchImage, colorSet: colorSet,));
    });
  }

  static Future<String> _downloadFile(Uint8List bytes, [String fileName = "temp.png"]) async{
    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/$fileName";
    final file = File(filePath);
    await file.writeAsBytes(bytes);
    return filePath;
  }
}