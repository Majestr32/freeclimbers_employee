
import 'package:freeclimbers_employee/consts/k_colors.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../blocs/app_cubit/app_cubit.dart';

class OverlayLoadingWidget extends StatelessWidget {
  const OverlayLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: KColors.black.withOpacity(0.1),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: context.colors?.mainPrimaryBack.withOpacity(0.6) ?? const Color(0xFF419DEB)
              ),
              child: Center(
                child: Container(
                  width: 48,
                  height: 48,
                  child: LoadingIndicator(
                      colors: [
                        context.colors?.mainPrimaryText ?? const Color(0xFFFFFFFF)
                      ],
                      indicatorType: Indicator.ballSpinFadeLoader),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}