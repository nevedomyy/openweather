import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;

import 'package:openweather/core/utils/utils.dart';
import 'package:openweather/features/home/bloc/home_bloc.dart';
import 'package:openweather/features/home/ui/widgets/error.dart';

import 'home.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
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
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.grey300, AppColors.grey50],
          ),
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (forecastCustom, _, itemIndex) => HomeWidgetMobile(
                forecastCustom: forecastCustom,
                itemIndex: itemIndex,
                isMetric: _isMetric,
              ),
              error: (message) => ErrorWidget(message: message),
            );
          },
        ),
      ),
    );
  }
}
