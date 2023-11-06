part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loaded({
    required List<ForecastItem> forecast,
    ChartData? chartData,
    @Default(0) int itemIndex,
  }) = HomeLoadedState;

  const factory HomeState.initial() = HomeInitialState;

  const factory HomeState.loading() = HomeLoadingState;

  const factory HomeState.error({required String message}) = HomeErrorState;
}
