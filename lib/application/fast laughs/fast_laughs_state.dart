part of 'fast_laughs_bloc.dart';

@freezed
class FastLaughsState with _$FastLaughsState {
  const factory FastLaughsState(
      {required List<Downloads> videoList,
      required bool isloading,
      required bool isError}) = _Initial;
  factory FastLaughsState.initial() =>
      const FastLaughsState(videoList: [], isloading: true, isError: false);
}
