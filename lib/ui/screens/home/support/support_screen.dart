import 'package:climbers/blocs/app_cubit/app_cubit.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:climbers/router.dart';
import 'package:climbers/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:climbers/ui/widgets/nav/app_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../blocs/locale_cubit/locale_cubit.dart';
import '../../../../consts/k_colors.dart';
import '../../../../consts/web_documents_enums.dart';
import '../../../widgets/app_drawer/app_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: context.colors!.basePrimaryBack,
        drawer: AppDrawer(
          scaffoldKey: _scaffoldKey,
          currentPage: DrawerPages.help,
        ),
        appBar: AppNavbar(
          title: AppLocalizations.of(context)!.help,
          onPrefixWidgetTap: (){
            context.pop();
          },
          prefixWidget: Icon(FontAwesomeIcons.chevronLeft, color: KColors.white, size: 24,),
        ),
        body: ConnectivityBadge(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  _section('Legal'),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                      color: context.colors!.baseSecondaryBack,
                    ),
                    child: Column(children: [
                      _helpTile(AppLocalizations.of(context)!.terms_of_use, () => context.push(RouteNames.webBranchDocument(context.read<LocaleCubit>().state,WebBranchDocumentRoutes.terms), extra: {"content": context.read<AppCubit>().state.documents!.terms})),
                      _helpTile(AppLocalizations.of(context)!.privacy_policy, () => context.push(RouteNames.webBranchDocument(context.read<LocaleCubit>().state,WebBranchDocumentRoutes.privatePolicy), extra: {"content": context.read<AppCubit>().state.documents!.privacy})),
                      _helpTile(AppLocalizations.of(context)!.legal_notice, () => context.push(RouteNames.webDocument(context.read<LocaleCubit>().state,WebDocumentRoutes.legalNotice))),
                      _helpTile(AppLocalizations.of(context)!.imprint, () => context.push(RouteNames.webBranchDocument(context.read<LocaleCubit>().state,WebBranchDocumentRoutes.imprint), extra: {"content": context.read<AppCubit>().state.documents!.imprint})),
                      _helpTile(AppLocalizations.of(context)!.license, () => context.push(RouteNames.license)),
                    ],),
                  ),
                  !context.watch<AppCubit>().state.branchIsSelected ? SizedBox.shrink() : Column(
                    children: [
                      SizedBox(height: 12,),
                      _section('Branch legal'),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                          color: context.colors!.baseSecondaryBack,
                        ),
                        child: Column(children: [
                          _helpTile(AppLocalizations.of(context)!.terms_of_use, () => context.push(RouteNames.webBranchDocument(context.read<LocaleCubit>().state,WebBranchDocumentRoutes.terms), extra: {"content": context.read<AppCubit>().state.documents!.branchTerms!, "overrideIcon": context.read<AppCubit>().state.branchIcon})),
                          _helpTile(AppLocalizations.of(context)!.privacy_policy, () => context.push(RouteNames.webBranchDocument(context.read<LocaleCubit>().state,WebBranchDocumentRoutes.privatePolicy), extra: {"content": context.read<AppCubit>().state.documents!.branchTerms!, "overrideIcon": context.read<AppCubit>().state.branchIcon})),
                        ],),
                      ),
                    ],
                  ),
                  SizedBox(height: 12,),
                  _section('Contact & Help'),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                      color: context.colors!.baseSecondaryBack,
                    ),
                    child: Column(
                      children: [
                        _helpTile('Contact us', () {
                          context.push(RouteNames.contactUs);
                        }, FontAwesomeIcons.solidEnvelope),
                        _helpTile('Help center', () { }, FontAwesomeIcons.question),
                        _helpTile('Report a bug', () { }, FontAwesomeIcons.bug),
                        _helpTile('Rate app', () { }, FontAwesomeIcons.solidStar),
                        _helpTile('Request data', () { }, FontAwesomeIcons.fileExport),
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),
                  Container(
                      decoration: BoxDecoration(
                          color: context.colors!.baseSecondaryBack,
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: _helpTile(AppLocalizations.of(context)!.delete_account, () { }, FontAwesomeIcons.userTimes)),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _section(String title){
    return Container(
      width: double.infinity,
      height: 44,
      decoration: BoxDecoration(
          color: context.colors!.mainSecondaryBack,
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          boxShadow: [
            BoxShadow(color: KColors.black02, blurRadius: 4, offset: Offset(0,4))
          ]
      ),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(title, style: TextStyle(color: context.colors!.mainSecondaryText, fontSize: 16, fontWeight: FontWeight.bold),))),
    );
  }

  Widget _helpTile(String title, VoidCallback onPressed, [IconData? icon]){
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 40,
        color: KColors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon == null ? SizedBox(width: 18,) : SizedBox(
                width: 48,
                height: 48,
                child: Center(child: Icon(icon, size: 20, color: context.colors!.fieldNormalText,))),
            Expanded(child: Text(title,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: context.colors!.fieldNormalText),)),
            SizedBox(
                width: 40,
                height: 40,
                child: Icon(FontAwesomeIcons.angleRight, color: context.colors!.fieldNormalText))
          ],
        ),
      ),
    );
  }
}
