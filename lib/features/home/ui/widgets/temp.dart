import 'package:flutter/material.dart';
import 'package:openweather/core/utils/utils.dart';

class TempWidget extends StatelessWidget {
  final ValueNotifier<bool> isMetric;
  final double temp;

  const TempWidget({
    super.key,
    required this.isMetric,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isMetric,
      builder: (context, isMetric, child) {
        final value = isMetric ? temp : temp * 1.8 + 32;
        return Text(
          '${value.round()}\u{00B0}',
          style: AppTextStyle.black80,
        );
      },
    );
  }
}
