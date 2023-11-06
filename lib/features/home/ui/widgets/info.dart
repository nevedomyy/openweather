import 'package:flutter/material.dart';
import 'package:openweather/core/utils/utils.dart';
import 'package:openweather/features/home/models/forecast_item.dart';

import 'properties.dart';

class InfoWidget extends StatelessWidget {
  final ForecastItem item;

  const InfoWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final humidity = item.main?.humidity;
    final pressure = item.main?.pressure;
    final wind = item.wind?.speed;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (humidity != null)
            Properties(
              svgIconPath: AppAssets.humidity,
              text: 'humidity',
              value: '$humidity %',
            ),
          if (pressure != null)
            Properties(
              svgIconPath: AppAssets.pressure,
              text: 'pressure',
              value: '$pressure hPa',
            ),
          if (wind != null)
            Properties(
              svgIconPath: AppAssets.wind,
              text: 'wind',
              value: '$wind m/s',
            ),
        ],
      ),
    );
  }
}
