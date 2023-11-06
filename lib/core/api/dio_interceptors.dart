import 'package:dio/dio.dart';
import 'package:openweather/core/api/apiKey.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    options.queryParameters.addAll({'appid': apiKey});
  }
}
