import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/home/home_service.dart';
import 'package:netflix/domain/home/models/home/home_repo.dart';

@LazySingleton(as: HomeService)
class HomeImplimentation implements HomeService {
  @override
  Future<Either<MainFailure, HomeRepo>> getRelesedYr() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.relesedPastYear,
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HomeRepo.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HomeRepo>> getTopTEN() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.topTenRatedMovie,
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HomeRepo.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HomeRepo>> getTreadingNow() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.treandingNow,
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HomeRepo.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
