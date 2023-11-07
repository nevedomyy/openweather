import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:openweather/core/models/app_response.dart';
import 'package:openweather/features/home/bloc/home_bloc.dart';
import 'package:openweather/features/home/models/forecast.dart';
import 'package:openweather/features/home/repositories/home_repository.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  group('HomeBloc', () {
    final repository = MockHomeRepository();
    late HomeBloc bloc;

    setUp(() {
      bloc = HomeBloc(repository: repository);
    });

    blocTest<HomeBloc, HomeState>(
      "fetch data - success",
      build: () {
        when(repository.getForecast(city: 'Berlin')).thenAnswer(
          (_) async => AppResponse(object: Forecast()),
        );
        return bloc;
      },
      act: (bloc) => bloc.getForecast(),
      expect: () => [
        isA<HomeLoadingState>(),
        isA<HomeLoadedState>().having((state) => state.forecast, '', isNotNull),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      "fetch data - failed",
      build: () {
        when(repository.getForecast(city: 'Berlin')).thenAnswer(
          (_) async => const AppResponse(),
        );
        return bloc;
      },
      act: (bloc) => bloc.getForecast(),
      expect: () => [
        isA<HomeLoadingState>(),
        isA<HomeErrorState>(),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      "fetch data - without loader",
      build: () {
        when(repository.getForecast(city: 'Berlin')).thenAnswer(
          (_) async => AppResponse(object: Forecast()),
        );
        return bloc;
      },
      act: (bloc) => bloc.getForecast(withLoading: false),
      expect: () => [
        isA<HomeLoadedState>().having((state) => state.forecast, '', isNotNull),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      "change item",
      build: () =>
          bloc..emit(const HomeLoadedState(forecast: [], itemIndex: 1)),
      act: (bloc) => bloc.changeItem(index: 4),
      expect: () => [
        isA<HomeLoadedState>().having((state) => state.itemIndex, '', 4),
      ],
    );
  });
}
