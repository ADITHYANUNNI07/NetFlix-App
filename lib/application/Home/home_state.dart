part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {required List<HomeData> relesedList,
      required List<HomeData> trendingList,
      required List<HomeData> topList,
      required bool isLoading,
      required bool hasError}) = _Initial;
  factory HomeState.initial() => const HomeState(
      relesedList: [],
      trendingList: [],
      topList: [],
      isLoading: false,
      hasError: false);
}
