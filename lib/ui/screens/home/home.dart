

import 'dart:developer';
import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:freeclimbers_employee/blocs/app_cubit/app_cubit.dart';
import 'package:freeclimbers_employee/blocs/branch_registration_bloc/branch_registration_bloc.dart';
import 'package:freeclimbers_employee/blocs/branches_cubit/branches_cubit.dart';
import 'package:freeclimbers_employee/blocs/member_cubit/member_cubit.dart';
import 'package:freeclimbers_employee/blocs/tutorial_bloc/tutorial_bloc.dart';
import 'package:freeclimbers_employee/consts/k_colors.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/repositories/app/app_repository.dart';
import 'package:freeclimbers_employee/repositories/qr_code/qr_code_repository.dart';
import 'package:freeclimbers_employee/router.dart';
import 'package:freeclimbers_employee/ui/popups/branch_change_success/branch_change_success.dart';
import 'package:freeclimbers_employee/ui/popups/branch_confirmation/branch_confirmation.dart';
import 'package:freeclimbers_employee/ui/popups/branch_confirmation_success/branch_confirmation_success.dart';
import 'package:freeclimbers_employee/ui/widgets/app_drawer/app_drawer.dart';
import 'package:freeclimbers_employee/ui/widgets/branch_image/branch_image.dart';
import 'package:freeclimbers_employee/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:freeclimbers_employee/ui/widgets/nav/app_navbar.dart';
import 'package:freeclimbers_employee/ui/widgets/profile_image/profile_image.dart';
import 'package:freeclimbers_employee/ui/widgets/tutorial_window/tutorial_window.dart';
import 'package:freeclimbers_employee/utils/dates.dart';
import 'package:freeclimbers_employee/utils/permissions.dart';
import 'package:device_display_brightness/device_display_brightness.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:overlay_tutorial/overlay_tutorial.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double _selectedCard = 0;

  bool _showBranchTutorial = false;
  bool _showProfileTutorial = false;
  bool get _hasTutorial => _showBranchTutorial || _showProfileTutorial;

  final GlobalKey _profileKey = GlobalKey();
  final GlobalKey _branchKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    requestStoragePermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocListener<TutorialBloc, TutorialState>(
  listener: (context, state) {
        if(context.read<TutorialBloc>().state.isHomeTutorialEnded){
          return;
        }
        Future.delayed(const Duration(milliseconds: 400), (){
          setState(() {
            _showBranchTutorial = true;
          });
        });
  },
  child: OverlayTutorialScope(
          enabled: _hasTutorial,
          overlayColor: KColors.black.withOpacity(0.8),
          child: AbsorbPointer(
            absorbing: _hasTutorial,
            child: Scaffold(
                backgroundColor: context.colors!.basePrimaryBack,
                key: _scaffoldKey,
                drawer: AppDrawer(
                  currentPage: DrawerPages.home,
                  scaffoldKey: _scaffoldKey,
                ),
                appBar: AppNavbar(
                  title: AppLocalizations.of(context)!.home,
                  prefixWidget: OverlayTutorialHole(
                      enabled: _showProfileTutorial,
                      overlayTutorialEntry: OverlayTutorialCircleEntry(
                        radius: 24,
                        overlayTutorialHints: [
                          OverlayTutorialWidgetHint(builder: (context,_){
                            return TutorialWindow(
                                title: AppLocalizations.of(context)!.tutorial_open_menu_title,
                                subtitle: AppLocalizations.of(context)!.tutorial_open_menu_message,
                                onTap: (){
                                  setState(() {
                                    _showProfileTutorial = false;
                                    context.read<TutorialBloc>().add(const TutorialEvent.endHomeTutorial());
                                  });
                                }
                            );
                          })
                        ]
                      ),
                      child: ProfileImage(
                        key: _profileKey,
                        profileImage: context.watch<MemberCubit>().state.profileImage, size: 40, borderSize: 1,)),
                  onPrefixWidgetTap: () => _scaffoldKey.currentState!.openDrawer(),
                  suffixWidget: OverlayTutorialHole(
                      enabled: _showBranchTutorial,
                      overlayTutorialEntry: OverlayTutorialCircleEntry(
                        radius: 25,
                        overlayTutorialHints: [
                          OverlayTutorialWidgetHint(
                            builder: (context,_) => TutorialWindow(
                                title: AppLocalizations.of(context)!.tutorial_open_membercard_title,
                                subtitle: AppLocalizations.of(context)!.tutorial_open_membercard_message,
                              onTap: (){
                                setState(() {
                                  _showBranchTutorial = false;
                                  _showProfileTutorial = true;
                                });
                              }
                            )
                          )
                        ]
                      ),
                      child: BranchImage(
                        key: _branchKey,
                        branchImage: context.read<AppCubit>().state.branchIconOrDefault, isEmptyBranchIsLogo: false, width: 36, height: 36, )),
                  onSuffixWidgetTap: () {
                    DeviceDisplayBrightness.setBrightness(1);
                    context.push(RouteNames.card);
                  },
                ),
                body: ConnectivityBadge(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(AppLocalizations.of(context)!.welcome_back, style: TextStyle(color: context.colors!.fieldNormalText, fontSize: 16, fontWeight: FontWeight.w400),)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text((context.watch<MemberCubit>().state.memberData?.firstname ?? '')
                          , style: TextStyle(color: context.colors!.fieldNormalText, fontSize: 20, fontWeight: FontWeight.w600),),
                        ),
                        const SizedBox(height: 12,),
                        CarouselSlider(
                            items: [
                          _card(text: 'Jahreskarte', validTo: DateTime(2023,05,12)),
                          _card(text: 'Jahreskarte', validTo: DateTime(2023,05,15)),
                          _card(text: 'Jahreskarte', validTo: DateTime(2023,08,5)),
                        ].asMap().entries.map((e) => AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: clampDouble(_selectedCard - e.key.toDouble(), -1, 1).abs() < 0.4 ? 1 : clampDouble((1.3 - clampDouble(_selectedCard - e.key.toDouble(), -1, 1).abs() * 1).abs(),0,1), child: e.value,)).toList(), options: CarouselOptions(aspectRatio: 1.5,
                            enlargeFactor: 0.1,
                            enableInfiniteScroll: false,
                            onScrolled: (val){
                              setState(() {
                                _selectedCard = val!;
                              });
                            },
                            viewportFraction: 0.87, height: MediaQuery.of(context).size.width * 0.8 / 1.5)),
                        const SizedBox(height: 12,),
                        _carouselIndicators(_selectedCard.round(), 3),
                        const SizedBox(height: 12,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Text(AppLocalizations.of(context)!.recent_activities, style: TextStyle(color: context.colors!.fieldNormalText, fontSize: 20, fontWeight: FontWeight.w600),)),
                                  Text(AppLocalizations.of(context)!.sort_by, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: context.colors!.fieldNormalText,),),
                                  SizedBox(width: 8,),
                                  Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: context.colors!.mainPrimaryBack.withOpacity(0.2)
                                      ),
                                      child: Text(AppLocalizations.of(context)!.recent, style: TextStyle(fontSize: 12, color: context.colors!.mainPrimaryBack, fontWeight: FontWeight.w300),)),
                                ],
                              ),
                              const SizedBox(height: 12,),
                              _paymentGroupDate(date: DateTime.now()),
                              const SizedBox(height: 8,),
                              _paymentTile(
                                card: 'Einlösung',
                                reason: 'Jahreskarte',
                                amount: '2,50 €',
                                time: DateTime(2023, 2, 2, 16, 34, 23)
                              ),
                              const SizedBox(height: 12,),
                              _paymentGroupDate(date: DateTime.now().subtract(const Duration(days: 6))),
                              const SizedBox(height: 8,),
                              _paymentTile(
                                  card: 'Einlösung',
                                  reason: 'Jahreskarte',
                                  amount: '5 €',
                                  time: DateTime(2023, 2, 2, 21, 15, 22)
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ),
          ),
        ),
),
        _profileHighlight(_showProfileTutorial,(_profileKey.currentContext?.findRenderObject() as RenderBox?)?.localToGlobal(Offset.zero), (_profileKey.currentContext?.findRenderObject() as RenderBox?)?.size),
        _branchHighlight(_showBranchTutorial, (_branchKey.currentContext?.findRenderObject() as RenderBox?)?.localToGlobal(Offset.zero), (_branchKey.currentContext?.findRenderObject() as RenderBox?)?.size)
      ],
    );
  }

  Widget _branchHighlight(bool show, Offset? offset, Size? size){
    if(offset == null || size == null || !show){
      return SizedBox.shrink();
    }
    return Container(
      margin: EdgeInsets.only(left: max(offset.dx - 10, 0), top: max(offset.dy - 10, 0)),
      width: size.width + 20,
      height: size.height + 20,
      child: DottedBorder(
        strokeWidth: 2,
        color: context.colors!.mainPrimaryBack,
        borderType: BorderType.Circle,
        dashPattern: [8,8],
        child: Container(),
      ),
    );
  }

  Widget _profileHighlight(bool show, Offset? offset, Size? size){
    if(offset == null || size == null || !show){
      return SizedBox.shrink();
    }
    return Container(
      margin: EdgeInsets.only(left: offset.dx - 6, top: offset.dy - 6),
      width: size.width + 12,
      height: size.height + 12,
      child: DottedBorder(
        strokeWidth: 2,
        color: context.colors!.mainPrimaryBack,
        borderType: BorderType.Circle,
        dashPattern: [8,8],
        child: Container(),
      ),
    );
  }

  Widget _paymentGroupDate({required DateTime date}){
    return Text(formattedPaymentGroup(context, date), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: context.colors!.fieldNormalText,),);
  }

  Widget _paymentTile({required String reason, required String amount, required String card, required DateTime time}){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.colors!.baseSecondaryBack
      ),
      width: double.infinity,
      height: 57,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(card, style: TextStyle(fontSize: 16, color: context.colors!.fieldNormalText, fontWeight: FontWeight.w400),),
                Text(amount, style: TextStyle(fontSize: 16, color: context.colors!.fieldNormalText, fontWeight: FontWeight.w400),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(reason, style: TextStyle(fontSize: 12, color: context.colors!.fieldNormalText, fontWeight: FontWeight.w300),),
                Text(formatTime(time), style: TextStyle(fontSize: 12, color: context.colors!.fieldNormalText, fontWeight: FontWeight.w300),),
              ],
            )
          ],
        ),
      ),
    );
  }
  
  Widget _carouselIndicators(int selectedIndex, int count){
    return SizedBox(
      height: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            child: CircleAvatar(radius: selectedIndex == index ? 4 : 2, backgroundColor: context.colors!.mainPrimaryBack,))),
      ),
    );
  }

  Widget _card({required String text, required DateTime validTo}){
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(width: MediaQuery.of(context).size.width * 0.8,
        child: AspectRatio(
          aspectRatio: 1.5,
          child: Container(
            color: context.colors!.mainPrimaryBack,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  clipBehavior: Clip.none,
                  width: double.infinity, height: double.infinity,
                  child: ColorFiltered(
                      colorFilter: ColorFilter.mode(context.colors!.mainSecondaryBack.withOpacity(0.7), BlendMode.hardLight),
                      child: Image.asset('assets/images/card_logo_white.png', cacheWidth: 450, cacheHeight: 450, alignment: const Alignment(0.5,-0.1), fit: BoxFit.none,)),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: BranchImage(branchImage: context.watch<AppCubit>().state.branchIconOrDefault, isEmptyBranchIsLogo: true, width: 48, height: 48,),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 27),
                      child: Text(text, style: TextStyle(color: context.colors!.mainPrimaryText, fontSize: 20, fontWeight: FontWeight.w600),)),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 72,
                    width: double.infinity,
                    color: context.colors!.mainSecondaryBack,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 8,),
                        Text('Valid to', style: TextStyle(color: context.colors!.mainSecondaryText, fontWeight: FontWeight.w300, fontSize: 12),),
                        SizedBox(height: 6,),
                        Text(formattedDate(validTo), style: TextStyle(color: context.colors!.mainSecondaryText, fontWeight: FontWeight.w400)),
                        Spacer()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
