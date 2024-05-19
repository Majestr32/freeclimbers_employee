
import 'dart:developer';
import 'dart:typed_data';

import 'package:freeclimbers_employee/blocs/branches_cubit/branches_cubit.dart';
import 'package:freeclimbers_employee/extensions/colors.dart';
import 'package:freeclimbers_employee/models/branch/branch.dart';
import 'package:freeclimbers_employee/ui/sheets/scan_branch/scan_branch.dart';
import 'package:freeclimbers_employee/ui/widgets/app_drawer/app_drawer.dart';
import 'package:freeclimbers_employee/ui/widgets/branch_image/branch_image.dart';
import 'package:freeclimbers_employee/ui/widgets/connectivity_badge/connectivity_badge.dart';
import 'package:freeclimbers_employee/ui/widgets/nav/app_navbar.dart';
import 'package:freeclimbers_employee/utils/platform/platform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../blocs/app_cubit/app_cubit.dart';
import '../../../../consts/k_colors.dart';

class BranchesScreen extends StatefulWidget {
  const BranchesScreen({Key? key}) : super(key: key);

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen>{

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<Branch> _branches = context.read<BranchesCubit>().state.branches;
  bool _editMode = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
  listener: (context, state) {
    if(state.status == AppStateStatus.changingBranch){
      context.loaderOverlay.show();
    }else{
      context.loaderOverlay.hide();
    }
  },
  child: BlocListener<BranchesCubit, BranchesState>(
  listener: (context, state) {
    _branches = context.read<BranchesCubit>().state.branches;
  },
  child: Scaffold(
    backgroundColor: context.colors.basePrimaryBack,
        key: _scaffoldKey,
        drawer: AppDrawer(
          scaffoldKey: _scaffoldKey,
          currentPage: DrawerPages.branches,
        ),
        appBar: AppNavbar(
          title: AppLocalizations.of(context)!.branches,
          onPrefixWidgetTap: () => context.pop(),
          prefixWidget: Icon(FontAwesomeIcons.chevronLeft, color: KColors.white, size: 24,),
          onSuffixWidgetTap: () => openScanBranch(context),
          suffixWidget: Icon(FontAwesomeIcons.plus, color: KColors.white, size: 24,),
        ),
        body: ConnectivityBadge(
          child: BlocBuilder<BranchesCubit, BranchesState>(
  builder: (context, state) {
    if(state.status == BranchesStateStatus.initial){
      return SizedBox.shrink();
    }else{
      return ReorderableListView(
          buildDefaultDragHandles: false,
          onReorder: (oldIndex,newIndex){
            if (newIndex > _branches.length) newIndex = _branches.length;
            if (oldIndex < newIndex) newIndex -= 1;
            final Branch item = _branches[oldIndex];
            setState(() {
              _branches.removeAt(oldIndex);
              _branches.insert(newIndex, item);
            });
            context.read<BranchesCubit>().changeBranchOrder(branchOrders: _branches.asMap().entries.fold({},(p,v) => p..addAll({'branchId.${v.value.details.no}' : v.key})));
          },
            children: [
              for (int index = 0; index < _branches.length; index++)
                BranchTile(
                  index: index,
                    onDismissed: () async{
                      await context.read<BranchesCubit>().deleteBranch(_branches[index].branchId);
                      _branches = context.read<BranchesCubit>().state.branches;
                    },
                    onClicked: (){
                      if(int.parse(_branches[index].details.no) == context.read<AppCubit>().state.selectedBranchId){
                        return;
                      }
                      context.read<AppCubit>().changeDefaultBranch(int.parse(_branches[index].details.no));
                    },
                    branchIcon: _branches[index].details.branchImage, name: _branches[index].branchSettings!.name1, isSelected: context.watch<AppCubit>().state.selectedBranchId.toString() == _branches[index].details.no, editMode: _editMode, key: UniqueKey())
            ]
);}}
    ),
        )),
),
);
  }
}

class BranchTile extends StatefulWidget {
  final Uint8List? branchIcon;
  final int index;
  final String name;
  final bool isSelected;
  final VoidCallback onClicked;
  final VoidCallback onDismissed;
  final bool editMode;
  const BranchTile({this.branchIcon, required this.index, required this.name, this.isSelected = false, required this.onClicked, required this.onDismissed, this.editMode = false, required Key key}) : super(key: key);

  @override
  State<BranchTile> createState() => _BranchTileState();
}

class _BranchTileState extends State<BranchTile> with SingleTickerProviderStateMixin{
  double _offset = 0;
  late final _slidableController = SlidableController(this);
  bool _dismissCooldownOver = true;

  Future _confirmAndDismiss() async{
    bool confirm = await AppPlatformUtils.instance.showConfirmationWindow(context);
    if(confirm){
      widget.onDismissed.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: widget.key,
      onTap: widget.editMode ? null : widget.onClicked,
      child: Slidable(
        key: widget.key,
        controller: _slidableController,
        onOffsetChanged: (val) async{
          setState(() {
            _offset = val;
          });
          if(val < -MediaQuery.of(context).size.width * 0.6 && _dismissCooldownOver){
            _dismissCooldownOver = false;
            HapticFeedback.lightImpact();
            await _confirmAndDismiss();
            await _slidableController.close();
            Future.delayed(Duration(seconds: 1), (){
              setState((){
                _dismissCooldownOver = true;
              });
            });
          }
        },
        endActionPane: ActionPane(
          motion: StretchMotion(),
          extentRatio: _offset < - MediaQuery.of(context).size.width * 0.28 ? 1 : 0.29,
          children: [
            SlidableAction(
                backgroundColor: KColors.fieldBorderError,
                foregroundColor: KColors.white,
                icon: FontAwesomeIcons.solidTrashAlt,
                onPressed: (_) => _confirmAndDismiss()),
          ],
        ),
        child: Container(
          height: 55,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: context.colors.fieldNormalFrame))
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.editMode ? GestureDetector(
                    onTap: () async => await AppPlatformUtils.instance.showConfirmationWindow(context) ? widget.onDismissed.call() : null,
                    child: Icon(FontAwesomeIcons.minusCircle, size: 22, color: KColors.fieldBorderError,)) : SizedBox.shrink(),
                widget.editMode ? SizedBox(width: 10,) : SizedBox.shrink(),
                DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xFFD9D9D9))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: BranchImage(branchImage: widget.branchIcon),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(child: Text(widget.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: context.colors.basePrimaryText),)),
                SizedBox(width: 10,),
                widget.editMode ? ReorderableDragStartListener(
                    index: widget.index,
                    child: Icon(FontAwesomeIcons.bars, size: 22, color: context.colors.basePrimaryText,)) : !widget.isSelected ? SizedBox.shrink() : CircleAvatar(
                    radius: 13,
                    backgroundColor: context.colors.mainPrimaryBack,
                    child: Icon(FontAwesomeIcons.check, color: context.colors.mainPrimaryText, size: 16,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

