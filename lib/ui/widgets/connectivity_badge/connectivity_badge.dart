import 'package:climbers/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:climbers/consts/k_colors.dart';
import 'package:climbers/extensions/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConnectivityBadge extends StatefulWidget {
  final Widget? child;
  const ConnectivityBadge({Key? key, this.child}) : super(key: key);

  @override
  State<ConnectivityBadge> createState() => _ConnectivityBadgeState();
}

class _ConnectivityBadgeState extends State<ConnectivityBadge> {
  final Duration _animationDuration = const Duration(seconds: 1);
  final Duration _staticDuration = const Duration(seconds: 4);
  bool _animationOver = false;
  double _opacity = 0;
  final double _containerHeight = 35;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child ?? SizedBox.shrink(),
        IgnorePointer(
          child: SafeArea(
            child: BlocConsumer<ConnectivityBloc, ConnectivityState>(
              listener: (context,state){
                state.maybeMap(
                    lostConnectivity: (_) {
                      setState((){
                      _opacity = 1;
                      _animationOver = false;
                    });
                    },
                    active: (_) => Future.delayed(_staticDuration, (){
                      if(!mounted){
                        return;
                      }
                      setState((){
                        _opacity = 0;
                        _animationOver = false;
                      });
                    }),
                    orElse: (){});
              },
              builder: (context, state) => state.maybeMap(
                  lostConnectivity: (_) => Container(
                    height: _containerHeight,
                    width: double.infinity,
                    color: context.colors.error,
                    child: Center(
                      child: Text(AppLocalizations.of(context)!.internet_not_connected,
                        style: TextStyle(color: context.colors.mainPrimaryText),),
                    ),
                  ),
                  active: (_) => AnimatedOpacity(
                      opacity: _opacity,
                      onEnd: (){
                        setState(() {
                          _animationOver = true;
                        });
                      },
                      duration: _animationDuration,
                      child: _animationOver ? SizedBox.shrink() : Container(
                        height: _containerHeight,
                        width: double.infinity,
                        color: context.colors.success,
                        child: Center(
                          child: Text(AppLocalizations.of(context)!.internet_connected,
                            style: TextStyle(color: context.colors.mainPrimaryText),),
                        ),
                      ),),
                  orElse: (){
                return SizedBox.shrink();
              })
            ),
          ),
        ),
      ],
    );
  }
}
