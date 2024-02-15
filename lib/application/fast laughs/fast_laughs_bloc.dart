import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_download_repo.dart';
import 'package:netflix/domain/downloads/models/model_download.dart';

part 'fast_laughs_event.dart';
part 'fast_laughs_state.dart';
part 'fast_laughs_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];
ValueNotifier<Set<int>> likedVideosIdsNotifier = ValueNotifier({});

@injectable
class FastLaughsBloc extends Bloc<FastLaughsEvent, FastLaughsState> {
  FastLaughsBloc(
    IdownloadsRepo _downloadService,
  ) : super(FastLaughsState.initial()) {
    on<Initialize>((event, emit) async {
      //Send    loading  to UI
      emit(const FastLaughsState(
        videoList: [],
        isloading: true,
        isError: false,
      ));
      //get Trending Movies
      final result = await _downloadService.getDownloadsImages();
      final _state = result.fold((failure) {
        return FastLaughsState(
          videoList: [],
          isloading: false,
          isError: true,
        );
      },
          (response) => FastLaughsState(
                videoList: response,
                isloading: false,
                isError: false,
              ));
      //send to  ui
      emit(_state);
    });
    on<LikedVideo>((event, emit) async {
      likedVideosIdsNotifier.value.add(event.id);
      likedVideosIdsNotifier.notifyListeners();
    });
    on<UnlikedVideo>((event, emit) async {
      likedVideosIdsNotifier.value.remove(event.id);
      likedVideosIdsNotifier.notifyListeners();
    });
  }
}
