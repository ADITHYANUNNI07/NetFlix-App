import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/i_download_repo.dart';
import 'package:netflix/domain/downloads/models/model_download.dart';
import 'package:netflix/domain/search/models/search_repo/search_repo.dart';
import 'package:netflix/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IdownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    //idle state
    on<Initialize>((event, emit) async {
      if (state.idelList.isNotEmpty) {
        emit(SearchState(
            searchResultList: [],
            idelList: state.idelList,
            isLoading: false,
            isError: false));
        return;
      }
      emit(const SearchState(
          searchResultList: [], idelList: [], isLoading: true, isError: false));
      //get trending
      final _result = await _downloadsService.getDownloadsImages();
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idelList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idelList: list,
            isLoading: false,
            isError: false);
      });
      //show to ui
      emit(_state);
    });
    //search result state
    on<SearchMovie>((event, emit) async {
      //call search movie api
      log('search for ${event.movieQuery}');
      emit(const SearchState(
          searchResultList: [],
          idelList: [],
          isLoading: false,
          isError: false));
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold((MainFailure f) {
        emit(const SearchState(
            searchResultList: [],
            idelList: [],
            isLoading: false,
            isError: false));
      }, (SearchRepo r) {
        emit(SearchState(
            searchResultList: r.results,
            idelList: [],
            isLoading: false,
            isError: false));
      });
      print(_result);
      //show to ui
      emit(state);
    });
  }
}
