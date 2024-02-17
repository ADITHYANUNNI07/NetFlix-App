import 'package:netflix/core/string.dart';
import 'package:netflix/infrastrcture/api_key.dart';

class ApiEndPoints {
  static const downloads = '$kBaseUrl/trending/all/day?api_key=$apikey';
  static const search = '$kBaseUrl/search/movie?api_key=$apikey';
  static const hotAndNewMovie = '$kBaseUrl/discover/movie?api_key=$apikey';
  static const hotAndNewTv = '$kBaseUrl/discover/tv?api_key=$apikey';
  static const topTenRatedMovie = '$kBaseUrl/movie/top_rated?api_key=$apikey';
  static const relesedPastYear = '$kBaseUrl/movie/now_playing?api_key=$apikey';
  static const treandingNow = '$kBaseUrl/movie/popular?api_key=$apikey';
}
