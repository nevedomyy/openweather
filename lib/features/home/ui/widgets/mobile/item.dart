import 'package:intl/intl.dart' show DateFormat;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:openweather/core/utils/utils.dart';
import 'package:openweather/features/home/models/forecast_item.dart';

class ItemWidgetMobile extends StatelessWidget {
  final _datePattern = DateFormat('E');
  final ValueNotifier<bool> isMetric;
  final VoidCallback? onTap;
  final ForecastItem item;

  ItemWidgetMobile({
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
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [BoxShadow(blurRadius: 2, color: Colors.black26)],
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(2),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (item.dt != null)
                Text(
                  _datePattern.format(
                    DateTime.fromMillisecondsSinceEpoch(
                      item.dt! * 1000,
                      isUtc: true,
                    ),
                  ),
                  style: AppTextStyle.black18bold,
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
                      style: AppTextStyle.black14,
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
