import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/models/model_download.dart';
import 'package:dartz/dartz.dart';

abstract class IdownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
