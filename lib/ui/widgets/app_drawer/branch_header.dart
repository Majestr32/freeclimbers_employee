import 'dart:developer';

import 'package:freeclimbers_employee/blocs/app_cubit/app_cubit.dart';
import 'package:freeclimbers_employee/blocs/member_cubit/member_cubit.dart';
import 'package:freeclimbers_employee/consts/k_colors.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/ui/sheets/branches/branches_sheet.dart';
import 'package:freeclimbers_employee/ui/widgets/branch_image/branch_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BranchHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const BranchHeader({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberCubit,MemberState>(
      builder: (context,state) => RepaintBoundary(
        child: Container(
          height: 55,
          width: double.infinity,
          color: context.colors!.mainSecondaryBack,
          child: Padding(
            padding: EdgeInsets.only(left: 12),
            child: !context.watch<AppCubit>().state.branchIsSelected ? _emptyBranch(context) : _branch(context)
          ),
        ),
      ),
    );
  }

  Widget _branch(BuildContext context){
    return Container(
      color: KColors.transparent,
      child: Row(
        children: [
          BranchImage(width: 32, height: 32, branchImage: context.watch<AppCubit>().state.branchIcon),
          SizedBox(width: 12,),
          Expanded(child: Text(context.watch<AppCubit>().state.settings!.name1, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, color: context.colors!.mainSecondaryText),)),
          SizedBox(width: 5,),
          _optionsIconWidget(context)
        ],
      ),
    );
  }

  Widget _emptyBranch(BuildContext context){
    return Container(
      color: KColors.transparent,
      child: Row(
        children: [
          BranchImage(width: 34, height: 34 , branchImage: null),
          SizedBox(width: 14,),
          Expanded(child: Text(AppLocalizations.of(context)!.no_branch_select, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, color: context.colors!.mainSecondaryText),)),
          SizedBox(width: 5,),
          _optionsIconWidget(context)
        ],
      ),
    );
  }

  Widget _optionsIconWidget(BuildContext context){
    return GestureDetector(
      onTap: (){
        scaffoldKey.currentState!.closeDrawer();
        openBranchesSheet(context);
      },
      child: Container(
        height: double.infinity,
        color: KColors.transparent,
        child: FittedBox(
          fit: BoxFit.none,
          child: SizedBox(
            width: 24,
            height: 24,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: context.colors!.mainPrimaryText),
                    shape: BoxShape.circle
                ),
                child: Icon(FontAwesomeIcons.ellipsisH, color: KColors.white, size: 15)),
          ),
        ),
      ),
    );
  }
}
