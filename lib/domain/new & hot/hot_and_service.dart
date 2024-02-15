import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/new%20&%20hot/models/discovery_repo.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, DiscoveryRepo>> getHotandNewMovieData();
  Future<Either<MainFailure, DiscoveryRepo>> getHotandNewTvData();
}
