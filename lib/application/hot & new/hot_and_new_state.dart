part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState(
      {required List<HotandNewData> comingSoonList,
      required List<HotandNewData> everyOneIsWatchingList,
      required bool isLoading,
      required bool hasError}) = _Initial;
  factory HotAndNewState.initial() => const HotAndNewState(
      comingSoonList: [],
      everyOneIsWatchingList: [],
      hasError: false,
      isLoading: false);
}
