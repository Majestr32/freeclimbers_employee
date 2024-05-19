import 'dart:typed_data';

import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/router.dart';
import 'package:freeclimbers_employee/ui/sheets/scan_branch/scan_branch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../blocs/app_cubit/app_cubit.dart';
import '../../../blocs/branches_cubit/branches_cubit.dart';
import '../../../consts/k_colors.dart';
import '../../widgets/branch_image/branch_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> openBranchesSheet(BuildContext context){
  return showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: context.readColors!.basePrimaryBack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      context: context, builder: (context){
    return Theme(
        data: ThemeData(
          fontFamily: 'OpenSans'
        ),
        child: const _BranchesSheet());
  });
}

class _BranchesSheet extends StatelessWidget {
  const _BranchesSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<AppCubit, AppState>(
  listener: (context, state) {
      if(state.status == AppStateStatus.changingBranch){
        context.loaderOverlay.show();
      }else{
        context.loaderOverlay.hide();
      }
  },
  child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 5,),
            Center(
              child: Container(
                height: 5,
                width: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFF787878),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 12),
                      child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                            context.push(RouteNames.branch);
                          },
                          child: Icon(FontAwesomeIcons.solidEdit, size: 20, color: context.readColors!.basePrimaryText,)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, top: 12),
                      child: GestureDetector(
                          onTap: () async{
                            Navigator.of(context).pop();
                            await openScanBranch(context);
                          },
                          child: Icon(FontAwesomeIcons.plus, size: 24, color: context.readColors!.basePrimaryText,)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(AppLocalizations.of(context)!.branches, style: TextStyle(fontSize: 18, color: context.readColors!.basePrimaryText, fontWeight: FontWeight.w700),)),
                  ),
                ],
              ),
            ),
            context.watch<BranchesCubit>().state.branches.isEmpty ? _emptyBranches(context) : _filledBranches(context)
          ],
        ),
      ),
),
    );
  }

  Widget _emptyBranches(BuildContext context){
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 78,),
            Text(AppLocalizations.of(context)!.branch_sheet_empty_title, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: context.readColors!.basePrimaryText,),),
            SizedBox(height: 12,),
            GestureDetector(
                onTap: () async{
                  Navigator.of(context).pop();
                  await openScanBranch(context);
                },
                child: Text(AppLocalizations.of(context)!.branch_sheet_empty_action, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: context.colors!.link, fontWeight: FontWeight.w600),)),
            SizedBox(height: 78,),
          ],
        ),
      ),
    );
  }

  Widget _filledBranches(BuildContext context){
    return Column(
      children: [
        ((){
          final branches = context.watch<BranchesCubit>().state.branches;
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: branches.length,
              itemBuilder: (context, i) {
                return _branchTile(
                    branchId: branches[i].details.no,
                    onClicked: (){
                      if(context.read<AppCubit>().state.selectedBranchId.toString() == branches[i].details.no){
                        return;
                      }
                      context.read<AppCubit>().changeDefaultBranch(int.parse(branches[i].details.no));
                    },
                    branchIcon: branches[i].details.branchImage, context: context, name: branches[i].branchSettings!.name1, isSelected: context.watch<AppCubit>().state.selectedBranchId.toString() == branches[i].details.no);
              });
        }()),
        const SizedBox(height: 88,),
        Center(
          child: GestureDetector(
              onTap: () async{
                Navigator.of(context).pop();
                await openScanBranch(context);
              },
              child: Text(AppLocalizations.of(context)!.add_branch, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: KColors.link),)),
        ),
        const SizedBox(height: 30,),
      ],
    );
  }

  Widget _branchTile({required Uint8List? branchIcon, required BuildContext context, required String name, bool isSelected = false, required String branchId, required VoidCallback onClicked}){
    return GestureDetector(
      onTap: onClicked,
      child: SizedBox(
        height: 55,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFD9D9D9))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: BranchImage(branchImage: branchIcon),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(child: Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: context.readColors!.basePrimaryText),)),
              const SizedBox(width: 10,),
              !isSelected ? const SizedBox.shrink() : CircleAvatar(
                  radius: 13,
                  backgroundColor: context.colors!.mainPrimaryBack,
                  child: Icon(FontAwesomeIcons.check, color: context.colors!.mainPrimaryText, size: 16,))
            ],
          ),
        ),
      ),
    );
  }
}
