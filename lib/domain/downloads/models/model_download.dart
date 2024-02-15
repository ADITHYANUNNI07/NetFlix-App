// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'model_download.freezed.dart';
part 'model_download.g.dart';

@freezed
class Downloads with _$Downloads {
  const factory Downloads(
      {@JsonKey(name: 'poster_path') required String? posterPath,
      @JsonKey(name: 'backdrop_path') required String? backdropPath,
      @JsonKey(name: 'title') required String? moiveTitle}) = _Downloads;
  factory Downloads.fromJson(Map<String, dynamic> json) =>
      _$DownloadsFromJson(json);
}
