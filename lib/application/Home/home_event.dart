part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loadRelesedPastYr() = LoadRelesedPastYr;
  const factory HomeEvent.loadTrending() = LoadTrending;
  const factory HomeEvent.loadTopTen() = LoadTopTen;
}
