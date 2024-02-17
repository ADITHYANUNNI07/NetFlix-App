import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/home/home_service.dart';
import 'package:netflix/domain/home/models/home/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    on<LoadRelesedPastYr>((event, emit) async {
      //send Loading to UI
      try {
        emit(const HomeState(
            relesedList: [],
            trendingList: [],
            topList: [],
            isLoading: true,
            hasError: false));
        //get data from remote
        final _result = await _homeService.getRelesedYr();
        //data to state
        final newState = _result.fold((MainFailure failure) {
          emit(const HomeState(
              relesedList: [],
              trendingList: [],
              topList: [],
              isLoading: false,
              hasError: true));
        }, (HomeRepo repo) {
          emit(HomeState(
              relesedList: repo.results,
              trendingList: state.trendingList,
              topList: state.topList,
              isLoading: false,
              hasError: false));
        });
        emit(newState);
      } catch (e) {
        log(e.toString());
        // Handle the error
        // emit(const HomeState(
        //   relesedList: [],
        //   trendingList: [],
        //   topList: [],
        //   isLoading: false,
        //   hasError: true,
        // ));
      }
    });
    on<LoadTrending>((event, emit) async {
      try {
        //send Loading to UI
        emit(const HomeState(
            relesedList: [],
            trendingList: [],
            topList: [],
            isLoading: true,
            hasError: false));
        //get data from remote
        final _result = await _homeService.getTreadingNow();
        //data to state
        final newState = _result.fold((MainFailure failure) {
          emit(const HomeState(
              relesedList: [],
              trendingList: [],
              topList: [],
              isLoading: false,
              hasError: true));
        }, (HomeRepo repo) {
          emit(HomeState(
              relesedList: state.relesedList,
              trendingList: repo.results,
              topList: state.topList,
              isLoading: false,
              hasError: false));
        });
        emit(newState);
      } catch (e) {
        log(e.toString());
      }
    });
    on<LoadTopTen>((event, emit) async {
      try {
        //send Loading to UI
        emit(const HomeState(
            relesedList: [],
            trendingList: [],
            topList: [],
            isLoading: true,
            hasError: false));
        //get data from remote
        final _result = await _homeService.getTopTEN();
        //data to state
        final newState = _result.fold((MainFailure failure) {
          emit(const HomeState(
              relesedList: [],
              trendingList: [],
              topList: [],
              isLoading: false,
              hasError: true));
        }, (HomeRepo repo) {
          emit(HomeState(
              relesedList: state.relesedList,
              trendingList: state.trendingList,
              topList: repo.results,
              isLoading: false,
              hasError: false));
        });
        emit(newState);
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
