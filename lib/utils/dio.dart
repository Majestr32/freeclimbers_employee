
import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:climbers/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:climbers/blocs/locale_cubit/locale_cubit.dart';
import 'package:climbers/custom_error.dart';
import 'package:climbers/utils/jwt.dart';
import 'package:dio/dio.dart';
import 'package:http_interceptor/models/interceptor_contract.dart';

String insertLocale(String baseUrl, String locale) => baseUrl.replaceFirst("::language::", locale);

///Doesn't contain locale, use [insertLocale] to insert locale before making API call
String apiHost = "https://api.freeclimber.app/::language::/customer/v1";

dynamic throwCustomErrorOrGetData(Response response){
  int code = response.data["code"];
  String message = response.data["message"];
  if(code >= 200 && code < 300){
    return response.data["data"];
  }else{
    throw CustomError(code: code, message: message);
  }
}

class JwtInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if(!options.headers.containsKey("Authorization")){
      options.headers["Authorization"] = "Bearer ${generateJwt()}";
    }
    return super.onRequest(options, handler);
  }
}

class NoInternetInterceptor extends Interceptor{
  final ConnectivityBloc? connectivityBloc;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if(connectivityBloc == null){
      super.onRequest(options, handler);
    }else{
      final connected = connectivityBloc!.state.maybeMap<bool>(
          active: (_) => true,
          orElse: () => false);
      if(!connected){
        options.connectTimeout = Duration.zero;
        options.receiveTimeout = Duration.zero;
      }
      super.onRequest(options, handler);
    }
  }

  NoInternetInterceptor({
    this.connectivityBloc,
  }): super();
}

class TimeoutInterceptor extends Interceptor{
  final VoidCallback onTimeoutError;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.connectTimeout = Duration(milliseconds: 6000);
    options.receiveTimeout = Duration(milliseconds: 6000);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionTimeout || err.type == DioExceptionType.receiveTimeout || err.type == DioErrorType.sendTimeout || err.type == DioExceptionType.unknown) {
      onTimeoutError.call();
      throw TimeoutException('Timeout');
    }
    super.onError(err, handler);
  }

  TimeoutInterceptor({
    required this.onTimeoutError,
  }) : super();
}

class LanguageInterceptor extends Interceptor {
  final LocaleCubit _localeCubit;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String locale = _localeCubit.state;
    String url = options.path;
    String localizedUrl = insertLocale(url, locale);
    options = options.copyWith(path: localizedUrl);
    return super.onRequest(options, handler);
  }

  LanguageInterceptor({
    required LocaleCubit localeCubit,
  }) : _localeCubit = localeCubit;
}