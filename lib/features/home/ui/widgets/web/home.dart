import 'dart:ui';

import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:intl/intl.dart';
import 'package:openweather/core/utils/utils.dart';
import 'package:openweather/features/home/bloc/home_bloc.dart';
import 'package:openweather/features/home/models/chart.dart';
import 'package:openweather/features/home/models/forecast_item.dart';
import 'package:openweather/features/home/ui/widgets/city_menu.dart';
import 'package:openweather/features/home/ui/widgets/error.dart';
import 'package:openweather/features/home/ui/widgets/icon.dart';
import 'package:openweather/features/home/ui/widgets/info.dart';
import 'package:openweather/features/home/ui/widgets/temp.dart';
import 'package:openweather/features/home/ui/widgets/temp_switch.dart';
import 'package:openweather/features/home/ui/widgets/web/chart.dart';
import 'package:openweather/features/home/ui/widgets/web/item.dart';

class HomeWidgetWeb extends StatelessWidget {
  final _datePattern = DateFormat('EEEE');
  final ValueNotifier<bool> isMetric;
  final List<ForecastItem> forecastCustom;
  final ChartData? chartData;
  final int itemIndex;

  HomeWidgetWeb({
    super.key,
    required this.isMetric,
    required this.forecastCustom,
    required this.itemIndex,
    this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    if (forecastCustom.isEmpty) {
      return const ErrorWidget(message: 'No data found');
    }

    final item = forecastCustom[itemIndex];
    final temp = item.main?.temp;

    if (temp == null) {
      return const ErrorWidget(message: 'Temperature is not defined');
    }

    final description =
        item.weather.isNotEmpty ? item.weather.first.description : '';

    final city = context.bloc<HomeBloc>().getCity;

    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            'images/$city.webp',
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.transparent,
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (item.dt != null)
                    Text(
                      _datePattern.format(
                        DateTime.fromMillisecondsSinceEpoch(
                          item.dt! * 1000,
                          isUtc: true,
                        ),
                      ),
                      style: AppTextStyle.black20Bold,
                    ),
                  const CityMenu(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description ?? '',
                    style: AppTextStyle.black24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TempSwitch(
                      initial: isMetric.value,
                      onCange: (value) => isMetric.value = value,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: TempWidget(
                            isMetric: isMetric,
                            temp: temp,
                          ),
                        ),
                        InfoWidget(item: item),
                      ],
                    ),
                  ),
                  Expanded(
                    child: IconWidget(
                      icon: item.weather.first.icon ?? '',
                      dimension: 200,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(forecastCustom.length, (index) {
                        return ItemWidgetWeb(
                          onTap: () =>
                              context.bloc<HomeBloc>().changeItem(index: index),
                          item: forecastCustom[index],
                          isMetric: isMetric,
                        );
                      }),
                    ),
                  ),
                  const SizedBox(width: 30),
                  if (chartData != null)
                    Expanded(
                      child: SizedBox.square(
                        dimension: 200,
                        child: ValueListenableBuilder<bool>(
                          valueListenable: isMetric,
                          builder: (context, isMetric, child) {
                            return Chart(
                              chartData: chartData!,
                              isMetric: isMetric,
                            );
                          },
                        ),
                      ),
                    ),
                  const SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
