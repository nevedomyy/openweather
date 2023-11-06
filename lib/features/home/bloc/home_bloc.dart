import 'package:bloc/bloc.dart' show Cubit;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openweather/core/global/constants.dart';
import 'package:openweather/features/home/models/chart.dart';
import 'package:openweather/features/home/models/forecast.dart';
import 'package:openweather/features/home/models/forecast_item.dart';
import 'package:openweather/features/home/repositories/home_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  final HomeRepository repository;

  String _city = cities.first;

  HomeBloc({required this.repository}) : super(const HomeState.initial());

  Future<void> getForecast({bool withLoading = true}) async {
    if (withLoading) emit(const HomeState.loading());
    final data = await repository.getForecast(city: _city);
    if (data.object != null && data.object is Forecast) {
      final forecastAll = (data.object as Forecast).list;
      List<ForecastItem> forecastCustom = [];
      if (forecastAll.isNotEmpty) {
        final nextDay = DateTime.now()
                .add(const Duration(hours: 12))
                .millisecondsSinceEpoch /
            1000;
        final forecast = forecastAll
            .where((item) =>
                item.dtTxt.contains('12:00') && (item.dt ?? 0) > nextDay)
            .toList();
        forecastCustom.add(forecastAll.first);
        forecastCustom.addAll(forecast);
      }
      emit(HomeState.loaded(
        forecast: forecastCustom,
        chartData: kIsWeb ? _getChartData(forecastCustom) : null,
      ));
      return;
    }
    emit(HomeState.error(message: data.errorMessage));
  }

  ChartData? _getChartData(List<ForecastItem> forecastCustom) {
    if (forecastCustom.length < 3) return null;
    double minTemp = 100;
    double maxTemp = -100;
    List<ChartItem> items = [];
    for (final item in forecastCustom) {
      final dt = item.dt;
      final temp = item.main?.temp;
      if (temp == null || dt == null) continue;
      if (temp > maxTemp) maxTemp = temp;
      if (temp < minTemp) minTemp = temp;
      items.add(ChartItem(temp: temp, dt: dt));
    }
    return ChartData(
      maxTemp: maxTemp,
      minTemp: minTemp,
      items: items,
    );
  }

  void changeItem({required int index}) {
    if (state is HomeLoadedState) {
      emit((state as HomeLoadedState).copyWith(itemIndex: index));
    }
  }

  String get getCity => _city;

  void setCity(String city) {
    _city = city;
    getForecast();
  }
}
