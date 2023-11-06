import 'package:injectable/injectable.dart' show LazySingleton;
import 'package:openweather/core/api/api_provider.dart';
import 'package:openweather/core/models/app_response.dart';

abstract class HomeRepository {
  Future<AppResponse> getForecast({required String city});
}

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final ApiProvider apiProvider;

  HomeRepositoryImpl({required this.apiProvider});

  @override
  Future<AppResponse> getForecast({required String city}) async {
    try {
      final data = await apiProvider.getForecast(city, 'metric');
      return AppResponse.success(data);
    } catch (e, s) {
      return AppResponse.withError(e, s);
    }
  }
}
