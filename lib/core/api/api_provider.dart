import 'package:openweather/core/api/end_points.dart';
import 'package:openweather/features/home/models/forecast.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_provider.g.dart';

@RestApi()
abstract class ApiProvider {
  factory ApiProvider(Dio dio) = _ApiProvider;

  @GET(EndPoints.forecast)
  Future<Forecast> getForecast(
    @Query('q') String city,
    @Query('units') String units,
  );
}
