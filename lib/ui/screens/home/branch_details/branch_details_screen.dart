import 'package:climbers/extensions/colors.dart';
import 'package:climbers/ui/widgets/nav/app_navbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../consts/k_colors.dart';

class BranchDetailsScreen extends StatelessWidget {
  const BranchDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavbar(title: 'Branch',
        onPrefixWidgetTap: (){
          context.pop();
        },
        prefixWidget: Container(
          color: KColors.transparent,
          child: Icon(FontAwesomeIcons.chevronLeft, color: context.colors!.mainPrimaryText, size: 24,),
        ),
      ),
      body: const Center(
        child: Text('Branch'),
      ),
    );
  }
}
