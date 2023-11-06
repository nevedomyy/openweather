import 'package:freezed_annotation/freezed_annotation.dart';

import 'city.dart';
import 'forecast_item.dart';

part 'forecast.freezed.dart';
part 'forecast.g.dart';

@freezed
class Forecast with _$Forecast {
  factory Forecast({
    String? cod,
    int? message,
    int? cnt,
    @Default([]) List<ForecastItem> list,
    City? city,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}
