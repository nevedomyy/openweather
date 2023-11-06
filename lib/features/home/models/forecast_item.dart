import 'package:freezed_annotation/freezed_annotation.dart';

import 'clouds.dart';
import 'main.dart';
import 'rain.dart';
import 'sys.dart';
import 'weather.dart';
import 'wind.dart';

part 'forecast_item.freezed.dart';
part 'forecast_item.g.dart';

@freezed
class ForecastItem with _$ForecastItem {
  factory ForecastItem({
    int? dt,
    Main? main,
    @Default([]) List<Weather> weather,
    Clouds? clouds,
    Wind? wind,
    int? visibility,
    double? pop,
    Sys? sys,
    @Default('') @JsonKey(name: 'dt_txt') String dtTxt,
    Rain? rain,
  }) = _ForecastItem;

  factory ForecastItem.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemFromJson(json);
}
