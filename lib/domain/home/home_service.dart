import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/home/models/home/home_repo.dart';

abstract class HomeService {
  Future<Either<MainFailure, HomeRepo>> getRelesedYr();
  Future<Either<MainFailure, HomeRepo>> getTreadingNow();
  Future<Either<MainFailure, HomeRepo>> getTopTEN();
}
