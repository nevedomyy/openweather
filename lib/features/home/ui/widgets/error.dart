import 'package:flutter/material.dart';
import 'package:openweather/core/utils/utils.dart';
import 'package:openweather/features/home/bloc/home_bloc.dart';

class ErrorWidget extends StatelessWidget {
  final String message;

  const ErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(21),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: AppTextStyle.black24,
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () => context.bloc<HomeBloc>().getForecast(),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text(
                'try again',
                style: AppTextStyle.black20Bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
