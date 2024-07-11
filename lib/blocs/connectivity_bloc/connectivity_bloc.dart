import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';
part 'connectivity_bloc.freezed.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {

  late final StreamSubscription _connectivitySubscription;

  ConnectivityBloc({required Connectivity connectionChecker}) :
        super(const ConnectivityState.initial()) {
    _connectivitySubscription = connectionChecker.onConnectivityChanged.listen((connectivity) async{
      _checkConnectivity(connectivity);
    });
    on<ConnectivityEvent>(_mapConnectivityToState);
    connectionChecker.checkConnectivity().then((connectivity) => _checkConnectivity(connectivity));
  }

  Future<void> _checkConnectivity(List<ConnectivityResult> connectivity) async{
    if(!connectivity.contains(ConnectivityResult.none)){
      add(ConnectivityEvent.connect());
    }else{
      add(ConnectivityEvent.disconnect());
    }
  }

  Future<void> _mapConnectivityToState(ConnectivityEvent event, Emitter<ConnectivityState> emit) => event.map(
      connect: (e) => _connect(e,emit),
      disconnect: (e) => _disconnect(e,emit),
      showTimeout: (e) => _showTimeout(e,emit));

  Future<void> _connect(_ConnectEvent event, Emitter<ConnectivityState> emit) async{
    emit(ConnectivityState.active());
  }

  Future<void> _showTimeout(_ShowTimeoutEvent event, Emitter<ConnectivityState> emit) async{
    state.maybeMap(
        active: (_) async{
          add(ConnectivityEvent.disconnect());
          await Future.delayed(Duration(seconds: 2));
          add(ConnectivityEvent.connect());
        },
        orElse: (){});
  }

  Future<void> _disconnect(_DisconnectEvent event, Emitter<ConnectivityState> emit) async{
    emit(ConnectivityState.lostConnectivity());
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
