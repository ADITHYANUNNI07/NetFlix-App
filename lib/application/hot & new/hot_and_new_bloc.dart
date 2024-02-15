import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/new%20&%20hot/hot_and_service.dart';
import 'package:netflix/domain/new%20&%20hot/models/discovery_repo.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    //get hot and new Movie data
    on<LoadDataInComingSoon>((event, emit) async {
      //send Loading to UI
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));
      //get data from remote
      final _result = await _hotAndNewService.getHotandNewMovieData();
      //data to state
      final newState = _result.fold((MainFailure failure) {
        return const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: false,
          hasError: true,
        );
      }, (DiscoveryRepo repo) {
        return HotAndNewState(
          comingSoonList: repo.results,
          everyOneIsWatchingList: state.everyOneIsWatchingList,
          isLoading: false,
          hasError: false,
        );
      });
      emit(newState);
    });
    //get hot and new Tv data

    on<LoadDataInEveryoneWatching>((event, emit) async {
      // send hot and new everyone watching
      emit(const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false));
      //get data from remote
      final _result = await _hotAndNewService.getHotandNewTvData();
      final newState = _result.fold((MainFailure failure) {
        return const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: false,
          hasError: true,
        );
      }, (DiscoveryRepo repo) {
        return HotAndNewState(
          comingSoonList: state.comingSoonList,
          everyOneIsWatchingList: repo.results,
          isLoading: false,
          hasError: false,
        );
      });
      emit(newState);
    });
  }
}
