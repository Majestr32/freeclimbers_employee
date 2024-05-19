import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/utils/action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../blocs/app_cubit/app_cubit.dart';
import '../../../blocs/member_cubit/member_cubit.dart';
import '../../../consts/k_colors.dart';
import '../profile_image/profile_image.dart';

class ProfileTopBar extends StatefulWidget {
  const ProfileTopBar({Key? key}) : super(key: key);

  @override
  State<ProfileTopBar> createState() => _ProfileTopBarState();
}

class _ProfileTopBarState extends State<ProfileTopBar> {

  late final appState = context.read<AppCubit>().state;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberCubit,MemberState>(
      builder: (context,state) => Container(
        height: 72,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
            color: context.colors!.baseSecondaryBack
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              GestureDetector(
                  onTap: (){
                    showPhotoActionSheet(context);
                  },
                  child: ProfileImage(profileImage: state.profileImage, circular: true, size: 48,)),
              SizedBox(width: 12,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(state.memberData!.fullName!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: context.colors!.fieldNormalText),)),
                    FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(state.memberData!.nickname, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: context.colors!.fieldNormalText),)),
                  ],),
              ),
              SizedBox(width: 20,),
              /*Container(
                  color: KColors.transparent,
                  child: GestureDetector(
                      onTap: (){

                      },
                      child: Icon(FontAwesomeIcons.camera, color: KColors.white, size: 20,)))*/
            ],
          ),
        ),
      ),
    );
  }
}
