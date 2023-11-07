import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:openweather/core/api/api_provider.dart';
import 'package:openweather/features/home/models/forecast.dart';
import 'package:openweather/features/home/repositories/home_repository.dart';

import 'home_repository_test.mocks.dart';

@GenerateMocks([ApiProvider])
void main() {
  group('HomeRepository', () {
    final apiProvider = MockApiProvider();
    final repository = HomeRepositoryImpl(apiProvider: apiProvider);

    test('fetch data - success', () async {
      when(apiProvider.getForecast('Berlin', 'metric')).thenAnswer(
        (_) async => Forecast(),
      );
      final result = await repository.getForecast(city: 'Berlin');
      expect(result.object is Forecast, true);
    });

    test('fetch data - failed', () async {
      when(apiProvider.getForecast('Berlin', 'metric')).thenAnswer(
        (_) async => throw Exception(),
      );
      final result = await repository.getForecast(city: 'Berlin');
      expect(result.object == null, true);
    });
  });
}
