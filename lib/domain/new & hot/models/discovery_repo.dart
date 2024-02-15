import 'package:json_annotation/json_annotation.dart';

part 'discovery_repo.g.dart';

@JsonSerializable()
class DiscoveryRepo {
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<HotandNewData> results;

  DiscoveryRepo({
    this.page,
    this.results = const [],
  });

  factory DiscoveryRepo.fromJson(Map<String, dynamic> json) {
    return _$DiscoveryRepoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DiscoveryRepoToJson(this);
}

@JsonSerializable()
class HotandNewData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'name')
  String? everyoneMovieTitle;
  HotandNewData({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  factory HotandNewData.fromJson(Map<String, dynamic> json) {
    return _$HotandNewDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotandNewDataToJson(this);
}
