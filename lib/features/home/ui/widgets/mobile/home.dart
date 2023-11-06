import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:intl/intl.dart';
import 'package:openweather/core/utils/utils.dart';
import 'package:openweather/features/home/bloc/home_bloc.dart';
import 'package:openweather/features/home/models/forecast_item.dart';
import 'package:openweather/features/home/ui/widgets/city_menu.dart';
import 'package:openweather/features/home/ui/widgets/error.dart';
import 'package:openweather/features/home/ui/widgets/icon.dart';
import 'package:openweather/features/home/ui/widgets/info.dart';
import 'package:openweather/features/home/ui/widgets/mobile/item.dart';
import 'package:openweather/features/home/ui/widgets/temp.dart';
import 'package:openweather/features/home/ui/widgets/temp_switch.dart';

class HomeWidgetMobile extends StatelessWidget {
  final _datePattern = DateFormat('EEEE');
  final ValueNotifier<bool> isMetric;
  final List<ForecastItem> forecastCustom;
  final int itemIndex;

  HomeWidgetMobile({
    super.key,
    required this.isMetric,
    required this.forecastCustom,
    required this.itemIndex,
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

    final maxHeight = MediaQuery.of(context).size.height;

    return RefreshIndicator(
      onRefresh: () => context.bloc<HomeBloc>().getForecast(withLoading: false),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: maxHeight + 1, // +1 for overscroll
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
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
                    ],
                  ),
                ),
                Expanded(
                  child: OrientationBuilder(
                    builder: (BuildContext context, Orientation orientation) {
                      if (orientation == Orientation.landscape) {
                        return Row(
                          children: [
                            InfoWidget(item: item),
                            const Spacer(),
                            Row(
                              children: [
                                TempWidget(
                                  isMetric: isMetric,
                                  temp: temp,
                                ),
                                IconWidget(
                                  icon: item.weather.first.icon ?? '',
                                  dimension: 120,
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                          ],
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Center(
                            child: Column(
                              children: [
                                IconWidget(icon: item.weather.first.icon ?? ''),
                                TempWidget(
                                  isMetric: isMetric,
                                  temp: temp,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          InfoWidget(item: item),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 110,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    itemCount: forecastCustom.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      return ItemWidgetMobile(
                        onTap: () =>
                            context.bloc<HomeBloc>().changeItem(index: index),
                        item: forecastCustom[index],
                        isMetric: isMetric,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
