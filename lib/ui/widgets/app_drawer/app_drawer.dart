import 'dart:developer';
import 'dart:ui';

import 'package:climbers/blocs/member_cubit/member_cubit.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:climbers/router.dart';
import 'package:climbers/ui/widgets/app_drawer/app_drawer_header.dart';
import 'package:climbers/ui/widgets/app_drawer/app_drawer_tab.dart';
import 'package:climbers/ui/widgets/app_drawer/branch_header.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:overlay_tutorial/overlay_tutorial.dart';

import '../../../blocs/app_cubit/app_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../blocs/tutorial_bloc/tutorial_bloc.dart';
import '../../../consts/k_colors.dart';
import '../tutorial_window/tutorial_window.dart';

enum DrawerPages{
  branches,
  home,
  card,
  profile,
  settings,
  help
}

class AppDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final DrawerPages currentPage;
  final VoidCallback? onTransitionStart;
  const AppDrawer({Key? key, required this.currentPage, required this.scaffoldKey, this.onTransitionStart}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late final appState = context.read<AppCubit>().state;
  bool _showRegistrationCodeTutorial = false;
  bool _showAddBranchTutorial = false;
  bool get _hasTutorial => _showAddBranchTutorial || _showRegistrationCodeTutorial;

  GlobalKey _addBranchKey = GlobalKey();
  GlobalKey _registrationCodeKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    if(context.read<TutorialBloc>().state.isMenuTutorialEnded){
      return;
    }
    Future.delayed(Duration(milliseconds: 400), (){
      setState(() {
        _showAddBranchTutorial = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OverlayTutorialScope(
          enabled: _hasTutorial,
          overlayColor: KColors.black.withOpacity(0.8),
          child: AbsorbPointer(
            absorbing: _hasTutorial,
            child: BlocBuilder<MemberCubit,MemberState>(
              builder: (context,state) => Drawer(
                backgroundColor: context.colors!.basePrimaryBack,
                child: Column(
                  children: [
                    AppDrawerHeader(onTap: () async{
                      _closeAndPush(RouteNames.profile);
                    },),
                    Container(height: 1, width: double.infinity, color: context.colors!.mainPrimaryText,),
                    OverlayTutorialHole(
                      enabled: _showAddBranchTutorial,
                      overlayTutorialEntry: OverlayTutorialCustomShapeEntry(
                        shapeBuilder: (rect,path){
                          path = Path.combine(
                            PathOperation.difference,
                            path,
                            Path()
                              ..addRRect(
                                  RRect.fromRectAndRadius(Rect.fromLTWH(
                                    rect.left + 6,
                                    rect.top + 6,
                                    rect.width - 12,
                                    rect.height - 12,
                                  ), Radius.circular(12)),),
                          );
                          return path;
                        },
                        overlayTutorialHints: [
                          OverlayTutorialWidgetHint(builder: (context,_){
                            return TutorialWindow(
                                title: AppLocalizations.of(context)!.tutorial_add_branch_title,
                                subtitle: AppLocalizations.of(context)!.tutorial_add_branch_message,
                                onTap: (){
                                  setState(() {
                                    _showAddBranchTutorial = false;
                                    _showRegistrationCodeTutorial = true;
                                  });
                                }
                            );
                          })
                        ]
                      ),
                      child: GestureDetector(
                          onTap: (){
                            if(widget.currentPage == DrawerPages.branches){
                              widget.scaffoldKey.currentState!.closeDrawer();
                              return;
                            }
                          },
                          child: BranchHeader(
                            key: _addBranchKey,
                            scaffoldKey: widget.scaffoldKey,)),
                    ),
                    AppDrawerTab(drawerIcon: FontAwesomeIcons.home, title: AppLocalizations.of(context)!.home, onPressed: (){
                      if(widget.currentPage == DrawerPages.home){
                        widget.scaffoldKey.currentState!.closeDrawer();
                        return;
                      }
                      widget.onTransitionStart?.call();
                      context.go(RouteNames.home);
                    }),
                    AppDrawerTab(drawerIcon: FontAwesomeIcons.solidNewspaper,
                        number: 1,
                        title: AppLocalizations.of(context)!.news, onPressed: (){
                      _closeAndPush(RouteNames.news);
                    }),
                    AppDrawerTab(drawerIcon: FontAwesomeIcons.solidBuilding, title: AppLocalizations.of(context)!.branch, onPressed: (){
                      _closeAndPush(RouteNames.branchDetails);
                    }),
                    AppDrawerTab(drawerIcon: FontAwesomeIcons.solidIdCard, title: AppLocalizations.of(context)!.card, onPressed: (){
                      _closeAndPush(RouteNames.card);
                    }),
                    AppDrawerTab(drawerIcon: FontAwesomeIcons.cog, title: AppLocalizations.of(context)!.settings, onPressed: (){
                      _closeAndPush(RouteNames.settings);
                    }),
                    AppDrawerTab(drawerIcon: FontAwesomeIcons.solidQuestionCircle, title: AppLocalizations.of(context)!.help, onPressed: (){
                      _closeAndPush(RouteNames.help);
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
        _rectangularHighlight(_showAddBranchTutorial, (_addBranchKey.currentContext?.findRenderObject() as RenderBox?)?.localToGlobal(Offset.zero), (_addBranchKey.currentContext?.findRenderObject() as RenderBox?)?.size),
        _rectangularHighlight(_showRegistrationCodeTutorial, (_registrationCodeKey.currentContext?.findRenderObject() as RenderBox?)?.localToGlobal(Offset.zero), (_registrationCodeKey.currentContext?.findRenderObject() as RenderBox?)?.size)
      ],
    );
  }

  Widget _rectangularHighlight(bool show, Offset? offset, Size? size){
    if(offset == null || size == null || !show){
      return SizedBox.shrink();
    }
    return Container(
      margin: EdgeInsets.only(left: offset.dx + 4, top: offset.dy + 4),
      width: size.width - 8,
      height: size.height - 8,
      child: DottedBorder(
        strokeWidth: 2,
        color: context.colors!.mainPrimaryBack,
        borderType: BorderType.RRect,
        dashPattern: [8,8],
        radius: Radius.circular(12),
        child: Container(),
      ),
    );
  }

  Future<void> _closeAndPush(String route) async{
    widget.scaffoldKey.currentState!.closeDrawer();
    await Future.delayed(Duration(milliseconds: 100));
    if(!mounted){
      return;
    }
    context.push(route);
  }
}
