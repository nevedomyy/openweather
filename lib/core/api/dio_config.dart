import 'package:dio/dio.dart' show BaseOptions, Dio;
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'constants.dart';
import 'dio_interceptors.dart';
import 'end_points.dart';

class DioConfig {
  static Dio? _dio;

  DioConfig._();

  static Dio instance() {
    return _dio ??= Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        connectTimeout: const Duration(seconds: Constants.connectTimeout),
        receiveTimeout: const Duration(seconds: Constants.receiveTimeout),
        followRedirects: false,
      ),
    )..interceptors.addAll([
        ApiKeyInterceptor(),
        if (!kReleaseMode)
          PrettyDioLogger(
            requestBody: true,
            responseBody: true,
          )
      ]);
  }
}
