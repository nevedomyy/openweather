import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:openweather/core/models/app_response.dart';
import 'package:openweather/features/home/bloc/home_bloc.dart';
import 'package:openweather/features/home/models/forecast.dart';
import 'package:openweather/features/home/repositories/home_repository.dart';
import 'package:openweather/features/home/ui/widgets/error.dart';
import 'package:openweather/features/home/ui/widgets/mobile/home_page.dart';
import 'package:openweather/features/home/ui/widgets/mobile/item.dart';
import 'package:openweather/features/home/ui/widgets/temp_switch.dart';

import '../../../../../utils/test_data.dart';

import 'home_page_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  group('HomePageMobile', () {
    final forecast = Forecast.fromJson(forecastMock);
    final repository = MockHomeRepository();
    final datePattern = DateFormat('EEEE');
    late HomeBloc bloc;

    Widget homePage(HomeBloc bloc) => MaterialApp(
          home: BlocProvider<HomeBloc>(
            create: (_) => bloc,
            child: const HomePageMobile(),
          ),
        );

    setUp(() {
      bloc = HomeBloc(repository: repository);
    });

    testWidgets('error state', (WidgetTester tester) async {
      when(repository.getForecast(city: 'Berlin')).thenAnswer(
        (_) async => const AppResponse(),
      );
      await tester.pumpWidget(homePage(bloc));
      await tester.pumpAndSettle();

      final errorWidget = find.byType(ErrorWidget);
      final errorText = find.text('Ups! Something goes wrong...');
      final tryButtonText = find.text('try again');

      expect(errorWidget, findsOneWidget);
      expect(errorText, findsOneWidget);
      expect(tryButtonText, findsOneWidget);
    });

    testWidgets('success state', (WidgetTester tester) async {
      when(repository.getForecast(city: 'Berlin')).thenAnswer(
        (_) async => AppResponse(object: forecast),
      );
      await tester.pumpWidget(homePage(bloc));
      await tester.pump(const Duration(seconds: 1));

      final day = find.text(datePattern.format(
        DateTime.fromMillisecondsSinceEpoch(
          forecast.list.first.dt! * 1000,
          isUtc: true,
        ),
      ));
      final temp =
          find.text('${forecast.list.first.main!.temp!.round()}\u{00B0}');
      final humidity =
          find.text('humidity: ${forecast.list.first.main!.humidity} %');
      final pressure =
          find.text('pressure: ${forecast.list.first.main!.pressure} hPa');
      final wind = find.text('wind: ${forecast.list.first.wind!.speed} m/s');

      expect(day, findsOneWidget);
      expect(temp, findsOneWidget);
      expect(humidity, findsOneWidget);
      expect(pressure, findsOneWidget);
      expect(wind, findsOneWidget);
    });

    testWidgets('change item', (WidgetTester tester) async {
      when(repository.getForecast(city: 'Berlin')).thenAnswer(
        (_) async => AppResponse(object: forecast),
      );
      await tester.pumpWidget(homePage(bloc));
      await tester.pump(const Duration(seconds: 1));

      final firstDay = find.text(datePattern.format(
        DateTime.fromMillisecondsSinceEpoch(
          forecast.list.first.dt! * 1000,
          isUtc: true,
        ),
      ));
      expect(firstDay, findsOneWidget);

      final item = find.byType(ItemWidgetMobile).last;
      await tester.tap(item);
      await tester.pump(const Duration(seconds: 1));

      final secondDay = find.text(datePattern.format(
        DateTime.fromMillisecondsSinceEpoch(
          forecast.list.last.dt! * 1000,
          isUtc: true,
        ),
      ));
      expect(secondDay, findsOneWidget);
      expect(firstDay, findsNothing);
    });

    testWidgets('change unit F/C', (WidgetTester tester) async {
      when(repository.getForecast(city: 'Berlin')).thenAnswer(
        (_) async => AppResponse(object: forecast),
      );
      await tester.pumpWidget(homePage(bloc));
      await tester.pump(const Duration(seconds: 1));

      final temp = forecast.list.first.main!.temp!;

      final celsius = find.text('${temp.round()}\u{00B0}');
      expect(celsius, findsOneWidget);

      final item = find.byType(TempSwitch);
      await tester.tap(item);
      await tester.pump(const Duration(seconds: 1));

      final fahrenheit = find.text('${(temp * 1.8 + 32).round()}\u{00B0}');
      expect(fahrenheit, findsOneWidget);
      expect(celsius, findsNothing);
    });
  });
}
