import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../consts/k_colors.dart';

class TutorialWindow extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const TutorialWindow({Key? key, required this.title, required this.subtitle, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: KColors.black.withOpacity(0.6),
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(title, style: TextStyle(fontSize: 26, color: KColors.white, fontWeight: FontWeight.w600),),
                  SizedBox(height: 20,),
                  Text(subtitle, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: KColors.white, fontWeight: FontWeight.w400),),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          )
                      ),
                      onPressed: onTap, child: Text('Got it', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
