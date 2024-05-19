
import 'package:freeclimbers_employee/blocs/branches_cubit/branches_cubit.dart';
import 'package:freeclimbers_employee/blocs/member_cubit/member_cubit.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/ui/widgets/branch_image/branch_image.dart';
import 'package:freeclimbers_employee/ui/widgets/profile_image/profile_image.dart';
import 'package:freeclimbers_employee/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/app_cubit/app_cubit.dart';
import '../../../consts/k_colors.dart';
import '../../../utils/qr.dart';

class MemberCard extends StatelessWidget {
  final String title;
  final String number;
  const MemberCard({Key? key, required this.title, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(height: 128,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                colorFilter: ColorFilter.mode(KColors.black.withOpacity(0.65), BlendMode.luminosity),
                image: Image.asset('assets/images/card_bg.jpg').image
              )
            ),
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BranchImage(branchImage: context.watch<AppCubit>().state.branchIcon, width: 48, height: 48,),
                    SizedBox(width: 8,),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(context.watch<AppCubit>().state.settings!.name1, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: context.colors!.mainPrimaryText),)),
                            FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(context.watch<BranchesCubit>().state.branches.firstWhere((b) => b.details.no == context.read<AppCubit>().state.selectedBranchId.toString()).details.city, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: context.colors!.mainPrimaryText),))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: context.colors!.mainPrimaryBack,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))
              ),
              child: Column(
                children: [
                  SizedBox(height: 18,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      children: [
                        ProfileImage(profileImage: context.watch<MemberCubit>().state.profileImage, size: 70,),
                        SizedBox(width: 18,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(context.read<MemberCubit>().state.memberData!.fullName!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: context.colors!.mainPrimaryText),)),
                              FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(context.read<MemberCubit>().state.memberData!.nickname, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: context.colors!.mainPrimaryText),))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 104,
                      height: MediaQuery.of(context).size.width - 104,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: KColors.white
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(32),
                          child: Qr(content: number)),
                    ),
                  ),
                  Text(number.splitEvery(4), style: TextStyle(fontSize: 26, color: context.colors!.mainPrimaryText),),
                  SizedBox(height: 18,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*Positioned(
                    bottom: 0,
                    top: 0,
                    child: ,
                  ),*/
