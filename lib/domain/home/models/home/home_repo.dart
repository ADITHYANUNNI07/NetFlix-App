import 'package:json_annotation/json_annotation.dart';
part 'home_repo.g.dart';

@JsonSerializable()
class HomeRepo {
  int? page;
  @JsonKey(name: 'results')
  List<HomeData> results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  HomeRepo(
      {this.page, this.results = const [], this.totalPages, this.totalResults});

  factory HomeRepo.fromJson(Map<String, dynamic> json) =>
      _$HomeRepoFromJson(json);

  Map<String, dynamic> toJson() => _$HomeRepoToJson(this);
}

@JsonSerializable()
class HomeData {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  String? title;
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  HomeData({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return _$HomeDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}
