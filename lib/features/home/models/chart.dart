class ChartData {
  final double maxTemp;
  final double minTemp;
  final List<ChartItem> items;

  ChartData({
    required this.maxTemp,
    required this.minTemp,
    required this.items,
  });
}

class ChartItem {
  final double temp;
  final int dt;

  ChartItem({
    required this.temp,
    required this.dt,
  });
}
