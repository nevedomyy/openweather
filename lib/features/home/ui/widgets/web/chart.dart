import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:openweather/core/utils/utils.dart';
import 'package:openweather/features/home/models/chart.dart';

class Chart extends StatelessWidget {
  final _datePattern = DateFormat('E');
  final ChartData chartData;
  final bool isMetric;

  Chart({
    super.key,
    required this.chartData,
    required this.isMetric,
  });

  LineChartData mainData() {
    return LineChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 36,
            getTitlesWidget: leftTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      gridData: const FlGridData(show: true),
      minX: 0,
      maxX: chartData.items.length.toDouble() - 1,
      minY: chartData.minTemp,
      maxY: chartData.maxTemp,
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(
            chartData.items.length,
            (i) => FlSpot(
              i.toDouble(),
              chartData.items[i].temp,
            ),
          ),
          barWidth: 3,
          isCurved: true,
          color: Colors.black87,
          dotData: const FlDotData(show: false),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        _datePattern.format(
          DateTime.fromMillisecondsSinceEpoch(
            chartData.items[value.toInt()].dt * 1000,
            isUtc: true,
          ),
        ),
        style: AppTextStyle.black18bold,
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    if (value == chartData.maxTemp || value == chartData.minTemp) {
      final temp = isMetric ? value : value * 1.8 + 32;
      return Text(
        temp.round().toString(),
        style: AppTextStyle.black18bold,
        textAlign: TextAlign.left,
      );
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(mainData());
  }
}
