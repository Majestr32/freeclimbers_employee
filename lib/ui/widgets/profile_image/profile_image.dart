
import 'dart:typed_data';

import 'package:freeclimbers_employee/blocs/app_cubit/app_cubit.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../consts/k_colors.dart';

class ProfileImage extends StatelessWidget {
  final Uint8List? profileImage;
  final bool circular;
  final double size;
  final double borderSize;
  const ProfileImage({Key? key, this.profileImage, this.circular = true, this.size = 52, this.borderSize = 2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderColor = context.colors!.mainPrimaryText;
    return profileImage == null ? _emptyProfile(borderColor) : _filledProfile(borderColor);
  }

  Widget _emptyProfile(Color borderColor){
    return circular ? CircleAvatar(
        radius: size / 2,
        backgroundColor: borderColor,
        child: CircleAvatar(radius: size / 2 - borderSize, backgroundColor: KColors.black02, backgroundImage: Image.asset('assets/images/empty_profile_img.png').image,))
      : Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: borderSize),
          color: KColors.black02,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: Image.asset('assets/images/empty_profile_img.png').image
          )
        ),);
  }
  Widget _filledProfile(Color borderColor){
    return
      circular ?
      CircleAvatar(
        radius: size / 2,
        backgroundColor: borderColor,
        child: CircleAvatar(radius: size / 2 - borderSize, backgroundColor: borderColor, backgroundImage: Image.memory(profileImage!, fit: BoxFit.cover,).image,),
      ) :
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: size,
          height: size,
          color: borderColor,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                  width: size - 2 * borderSize,
                  height: size - 2 * borderSize,
                  color: KColors.black02,
                  child: Image.memory(profileImage!, fit: BoxFit.cover,)),),
          ),
        ),
      );
  }
}
