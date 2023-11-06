import 'package:dio/dio.dart' show Dio;
import 'package:injectable/injectable.dart' show lazySingleton, module;

import 'package:openweather/core/api/api_provider.dart';
import 'package:openweather/core/api/dio_config.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => DioConfig.instance();

  @lazySingleton
  ApiProvider get apiProvider => ApiProvider(dio);
}
