import 'package:intl/intl.dart' show DateFormat;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:openweather/core/utils/utils.dart';
import 'package:openweather/features/home/models/forecast_item.dart';

class ItemWidgetWeb extends StatelessWidget {
  final _datePattern = DateFormat('E');
  final ValueNotifier<bool> isMetric;
  final VoidCallback? onTap;
  final ForecastItem item;

  ItemWidgetWeb({
    super.key,
    required this.isMetric,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final icon = item.weather.first.icon ?? '';
    final tempMin = item.main?.tempMin;
    final tempMax = item.main?.tempMax;

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: item.dt != null
                ? Text(
                    _datePattern.format(
                      DateTime.fromMillisecondsSinceEpoch(
                        item.dt! * 1000,
                        isUtc: true,
                      ),
                    ),
                    style: AppTextStyle.white18,
                  )
                : const SizedBox(),
          ),
          Lottie.asset(
            'assets/animation/$icon.json',
            height: 50,
            width: 50,
            errorBuilder: (context, e, s) =>
                const SizedBox.square(dimension: 50),
          ),
          if (tempMin != null && tempMax != null)
            ValueListenableBuilder<bool>(
              valueListenable: isMetric,
              builder: (context, isMetric, child) {
                final tMin = isMetric ? tempMin : tempMin * 1.8 + 32;
                final tMax = isMetric ? tempMax : tempMax * 1.8 + 32;
                return Text(
                  '${tMin.round()}\u{00B0}/${tMax.round()}\u{00B0}',
                  style: AppTextStyle.white16,
                );
              },
            ),
        ],
      ),
    );
  }
}
