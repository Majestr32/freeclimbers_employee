import 'dart:convert';
import 'dart:typed_data';

import 'package:climbers/extensions/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/app_cubit/app_cubit.dart';
import '../../../consts/k_colors.dart';

class BranchImage extends StatelessWidget {
  final double? width;
  final double? height;
  final Uint8List? branchImage;
  final bool isEmptyBranchIsLogo;
  const BranchImage({Key? key, this.width, this.height, required this.branchImage, this.isEmptyBranchIsLogo = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        width: width ?? 36,
        height: height ?? 36,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: KColors.white,
          border: branchImage != null ? null : Border.all(color: context.colors.mainPrimaryText, width: 2),
          image: DecorationImage(
            image: isEmptyBranchIsLogo ? Image.asset('assets/images/logo.png').image : Image.asset('assets/images/empty_profile_img.png').image
          )
        ),
          child: branchImage == null ? SizedBox.shrink() : Image.memory(branchImage!, gaplessPlayback: true),
      ),
    );
  }
}
