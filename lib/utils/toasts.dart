import 'dart:async';
import 'dart:developer';

import 'package:climbers/consts/k_colors.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oktoast/oktoast.dart';

import '../blocs/app_cubit/app_cubit.dart';

class AppToast{
  final Duration _duration = const Duration(seconds: 3);

  static final AppToast _instance = AppToast._internal();
  static AppToast get instance => _instance;
  AppToast._internal();

  Future<void> showError(BuildContext context,String message) async{
    final toast = _Toast(msg: message, duration: _duration,  icon: FontAwesomeIcons.exclamationCircle, backgroundColor: context.readColors!.errorBack, iconColor: context.readColors!.error,);
    final oneWayAnimationCubit = _OneWayAnimationCubit();
    final f = showToastWidget(toast, position: ToastPosition.top,
        duration: _duration, handleTouch: true, dismissOtherToast: true, animationBuilder: (context,w,c,b) {
          return _OneWayOffsetAnimationBuilder(maxOffsetX: 0, maxOffsetY: -100, oneWayAnimationCubit: oneWayAnimationCubit).call(context, w, c, b);
        });
    toast.onDismiss = () {f.dismiss.call();};
  }

  Future<void> showInfo(BuildContext context,String message) async{
    final toast = _Toast(msg: message, duration: _duration, icon: FontAwesomeIcons.infoCircle, backgroundColor: context.readColors!.infoBack, iconColor: context.readColors!.info);
    final oneWayAnimationCubit = _OneWayAnimationCubit();
    final f = showToastWidget(toast, animationBuilder: (context,w,c,b) {
      return _OneWayOffsetAnimationBuilder(maxOffsetX: 0, maxOffsetY: -100, oneWayAnimationCubit: oneWayAnimationCubit).call(context, w, c, b);
    }, position: ToastPosition.top, duration: _duration, handleTouch: true, dismissOtherToast: true);
    toast.onDismiss = () {f.dismiss.call();};
  }

  Future<void> showSuccess(BuildContext context,String message) async{
    final toast = _Toast(msg: message, duration: _duration, icon: FontAwesomeIcons.checkCircle, backgroundColor: context.readColors!.successBack, iconColor: context.readColors!.success,);
    final oneWayAnimationCubit = _OneWayAnimationCubit();
    final f = showToastWidget(toast, position: ToastPosition.top, duration: _duration, handleTouch: true, dismissOtherToast: true, animationBuilder: (context,w,c,b) {
      return _OneWayOffsetAnimationBuilder(maxOffsetX: 0, maxOffsetY: -100, oneWayAnimationCubit: oneWayAnimationCubit).call(context, w, c, b);
    });
    toast.onDismiss = () {f.dismiss.call();};
  }

}

class _Toast extends StatefulWidget {
  final String msg;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Duration duration;

  VoidCallback? onDismiss;

  void setOnDismiss(VoidCallback onDismiss){
    this.onDismiss = onDismiss;
  }

  _Toast({Key? key, required this.msg, required this.duration, required this.icon, required this.iconColor, required this.backgroundColor}) : super(key: key);

  @override
  State<_Toast> createState() => _ToastState();
}

class _ToastState extends State<_Toast> {

  late double _indicatorLength = MediaQuery.of(context).size.width * 0.9;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState((){
        _indicatorLength = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: widget.backgroundColor,
      ),
      child: Column(
        children: [
          Container(
            height: 48,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 5,),
                Icon(widget.icon, color: widget.iconColor,),
                SizedBox(width: 15,),
                Expanded(child: Text(widget.msg, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: context.readColors!.errorText, fontSize: 14),)),
                // If you need cross button, uncomment
                /*Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    color: KColors.transparent,
                    child: IconButton(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.zero,
                        onPressed: widget.onDismiss,
                        icon: Icon(FontAwesomeIcons.times, size: 26, color: context.read<AppCubit>().state.settings?.colors.fieldValue ?? Color(0xFF4A4A4A),)),
                  ),
                )*/
              ],
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: AnimatedContainer(
                duration: widget.duration,
                width: _indicatorLength,
                height: 2,
                color: widget.iconColor,),
          )
        ],
      ),
    );
  }
}

class _OneWayAnimationCubit extends Cubit<_OneWayAnimationState>{
  _OneWayAnimationCubit() : super(_OneWayAnimationState(animatesBack: false,idle: false));

  void changeToIdle(){
    emit(state.copyWith(idle: true));
  }
  void changeToAnimatesBack(){
    emit(state.copyWith(animatesBack: true));
  }
}
class _OneWayAnimationState{
  final bool idle;
  final bool animatesBack;

  const _OneWayAnimationState({
    required this.idle,
    required this.animatesBack,
  });

  _OneWayAnimationState copyWith({
    bool? idle,
    bool? animatesBack,
  }) {
    return _OneWayAnimationState(
      idle: idle ?? this.idle,
      animatesBack: animatesBack ?? this.animatesBack,
    );
  }
}

class _OneWayOffsetAnimationBuilder extends BaseAnimationBuilder {
  _OneWayOffsetAnimationBuilder({
    this.maxOffsetX = 0,
    this.maxOffsetY = 100,
    required this.oneWayAnimationCubit
  });

  final double maxOffsetX;
  final double maxOffsetY;
  final _OneWayAnimationCubit oneWayAnimationCubit;

  @override
  Widget buildWidget(
      BuildContext context,
      Widget child,
      AnimationController controller,
      double percent,
      ) {
    return
      ((){
        final state = oneWayAnimationCubit.state;

        if(percent == 1){
          oneWayAnimationCubit.changeToAnimatesBack();
        }
        if(!state.animatesBack){
          return Transform.translate(
            offset: Offset.zero,
            child: child,
          );
        }else{
          return Transform.translate(
            offset: Offset(maxOffsetX * percent, maxOffsetY * (1 - percent)),
            child: child,
          );
        }
      }());
  }
}
