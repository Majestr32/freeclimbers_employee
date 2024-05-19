
import 'package:freeclimbers_employee/utils/dio.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http_interceptor/models/interceptor_contract.dart';

import '../blocs/locale_cubit/locale_cubit.dart';

class LanguageClipInterceptor implements InterceptorContract{
  final LocaleCubit _localeCubit;

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async{
    String path = request.url.toString();
    final localizedPath = insertLocale(path, _localeCubit.state);
    return request.copyWith(url: Uri.parse(localizedPath));
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async{
    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() async{
    return true;
  }

  @override
  Future<bool> shouldInterceptResponse() async{
    return true;
  }

  LanguageClipInterceptor({
    required LocaleCubit localeCubit,
  }) : _localeCubit = localeCubit;

}