import 'package:freeclimbers_employee/consts/k_colors.dart';
import 'package:freeclimbers_employee/oss_licenses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

Widget getLicenseContent({required TextStyle textStyle}) => SingleChildScrollView(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [SizedBox(height: 30,),...ossLicenses.map<Widget>((e) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Text(e.name ?? '', style: textStyle.copyWith(fontSize: 16)),
        SizedBox(height: 20,),
        Text(e.license ?? '', style: textStyle,),
        SizedBox(height: 15,)
      ],
    )).toList(),SizedBox(height: 80,)]
  ),
);

//Column(
//       children: [
//         Text(e.key, style: TextStyle(fontSize: 16, color: KColors.black, fontWeight: FontWeight.bold),),
//         SizedBox(height: 20,),
//         Text(e.value, style: TextStyle(color: KColors.black),)
//       ],
//     )