import 'dart:typed_data';

import 'package:climbers/blocs/servers_bloc/servers_bloc.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:climbers/router.dart';
import 'package:climbers/ui/sheets/scan_branch/scan_branch.dart';
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
import 'package:flutter/services.dart' show rootBundle;

Future<void> openBranchesSheet(BuildContext context) {
  final branches = context.watch<BranchesCubit>().state.branches;
  return showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: context.readColors.basePrimaryBack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      context: context,
      builder: (context) {
        return Theme(
            data: ThemeData(fontFamily: 'OpenSans'),
            child: _BranchesSheet(
              titleText: AppLocalizations.of(context)!.branches,
              newLocationText: AppLocalizations.of(context)!.add_branch,
              onNewLocationTap: () async {
                Navigator.of(context).pop();
                await openScanBranch(context);
              },
              leftWidget: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    context.push(RouteNames.branch);
                  },
                  child: Icon(
                    FontAwesomeIcons.solidEdit,
                    size: 20,
                    color: context.readColors.basePrimaryText,
                  )),
              rightWidget: GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                    await openScanBranch(context);
                  },
                  child: Icon(
                    FontAwesomeIcons.plus,
                    size: 24,
                    color: context.readColors.basePrimaryText,
                  )),
              itemCount: branches.length,
              itemBuilder: (context, i) {
                return _branchTile(
                    branchId: branches[i].details.no,
                    onClicked: () {
                      if (context
                              .read<AppCubit>()
                              .state
                              .selectedBranchId
                              .toString() ==
                          branches[i].details.no) {
                        return;
                      }
                      context.read<AppCubit>().changeDefaultBranch(
                          int.parse(branches[i].details.no));
                    },
                    branchIcon: branches[i].details.branchImage,
                    context: context,
                    name: branches[i].branchSettings!.name1,
                    isSelected: context
                            .watch<AppCubit>()
                            .state
                            .selectedBranchId
                            .toString() ==
                        branches[i].details.no);
              },
            ));
      });
}

Future<void> openBranchSheetInitial(BuildContext context) async {
  final branchIconData = await rootBundle.load('assets/images/logo.png');
  final branchIcon = branchIconData.buffer.asUint8List();
  if (!context.mounted) return;
  return showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: context.readColors.basePrimaryBack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      context: context,
      builder: (context) {
        final serverState = context.watch<ServersBloc>().state;
        return Theme(
          data: ThemeData(fontFamily: 'OpenSans'),
          child: _BranchesSheet(
              titleText: AppLocalizations.of(context)!.servers,
              newLocationText: AppLocalizations.of(context)!.add_server,
              itemCount: serverState.servers.length,
              itemBuilder: (context, i) {
                final server = serverState.servers[i];
                return _branchTile(
                    branchIcon: branchIcon,
                    isSelected: server.id == serverState.selectedServerId,
                    context: context,
                    name: server.displayName,
                    branchId: server.id,
                    onClicked: () {
                      context
                          .read<ServersBloc>()
                          .add(ServersEvent.selectServer(serverId: server.id));
                    });
              },
              onNewLocationTap: () {
                Navigator.of(context).pop();
                context.push(RouteNames.createServer);
              },
              rightWidget: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    context.push(RouteNames.createServer);
                  },
                  child: Icon(
                    FontAwesomeIcons.plus,
                    size: 24,
                    color: context.readColors.basePrimaryText,
                  ))),
        );
      });
}

class _BranchesSheet extends StatelessWidget {
  final Widget? leftWidget;
  final VoidCallback onNewLocationTap;
  final String newLocationText;
  final String titleText;
  final Widget? rightWidget;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  const _BranchesSheet(
      {Key? key,
      this.leftWidget,
      this.rightWidget,
      required this.onNewLocationTap,
      required this.itemCount,
      required this.itemBuilder, required this.newLocationText, required this.titleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<AppCubit, AppState>(
        listener: (context, state) {
          if (state.status == AppStateStatus.changingBranch) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
        },
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 5,
              ),
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
                    leftWidget == null
                        ? SizedBox.shrink()
                        : Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 12),
                              child: leftWidget,
                            ),
                          ),
                    rightWidget == null
                        ? SizedBox.shrink()
                        : Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, top: 12),
                              child: rightWidget,
                            ),
                          ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            titleText,
                            style: TextStyle(
                                fontSize: 18,
                                color: context.readColors.basePrimaryText,
                                fontWeight: FontWeight.w700),
                          )),
                    ),
                  ],
                ),
              ),
              itemCount == 0
                  ? _emptyBranches(context)
                  : _filledBranches(context, itemCount, itemBuilder, onNewLocationTap, newLocationText)
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyBranches(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 78,
            ),
            Text(
              AppLocalizations.of(context)!.branch_sheet_empty_title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: context.readColors.basePrimaryText,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
                onTap: onNewLocationTap,
                child: Text(
                  AppLocalizations.of(context)!.branch_sheet_empty_action,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: context.colors.link,
                      fontWeight: FontWeight.w600),
                )),
            SizedBox(
              height: 78,
            ),
          ],
        ),
      ),
    );
  }

  Widget _filledBranches(BuildContext context, int itemCount,
      Widget? Function(BuildContext, int) itemBuilder, VoidCallback onNewLocationTap, String newLocationText) {
    return Column(
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: itemBuilder),
        const SizedBox(
          height: 88,
        ),
        Center(
          child: GestureDetector(
              onTap: onNewLocationTap,
              child: Text(
                newLocationText,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: KColors.link),
              )),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

Widget _branchTile(
    {required Uint8List? branchIcon,
    required BuildContext context,
    required String name,
    bool isSelected = false,
    required String branchId,
    required VoidCallback onClicked}) {
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
                  border: Border.all(color: const Color(0xFFD9D9D9))),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: BranchImage(branchImage: branchIcon),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              name,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: context.readColors.basePrimaryText),
            )),
            const SizedBox(
              width: 10,
            ),
            !isSelected
                ? const SizedBox.shrink()
                : CircleAvatar(
                    radius: 13,
                    backgroundColor: context.colors.mainPrimaryBack,
                    child: Icon(
                      FontAwesomeIcons.check,
                      color: context.colors.mainPrimaryText,
                      size: 16,
                    ))
          ],
        ),
      ),
    ),
  );
}
