import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;

import 'package:openweather/core/utils/utils.dart';
import 'package:openweather/features/home/bloc/home_bloc.dart';
import 'package:openweather/features/home/ui/widgets/error.dart';

import 'home.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({super.key});

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  final _isMetric = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    context.bloc<HomeBloc>().getForecast();
  }

  @override
  void dispose() {
    _isMetric.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (forecastCustom, chartData, itemIndex) => HomeWidgetWeb(
              forecastCustom: forecastCustom,
              chartData: chartData,
              itemIndex: itemIndex,
              isMetric: _isMetric,
            ),
            error: (message) => ErrorWidget(message: message),
          );
        },
      ),
    );
  }
}
