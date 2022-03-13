class PopularMovie {
  late String status;
  late String message;
  late String response;

  static late List<PopularMovieItem> movie;

  PopularMovie.getuserid(dynamic obj) {
    movie = obj
        .map<PopularMovieItem>((json) => PopularMovieItem.fromJson(json))
        .toList();
  }
}

class PopularMovieItem {
  final String movieid;
  final String moviename;
  final String movieimage;
  final String viewCount;
  int isliked;

  PopularMovieItem(
      {required this.movieid,
      required this.movieimage,
      required this.moviename,
      required this.isliked,
      required this.viewCount});

  factory PopularMovieItem.fromJson(Map<String, dynamic> jsonMap) {
    return PopularMovieItem(
      movieid: jsonMap['movie_id'],
      movieimage: jsonMap['movie_image'] ?? '',
      moviename: jsonMap['movie_name'] ?? '',
      isliked: jsonMap['is_liked'] ?? 0,
      viewCount: jsonMap['viewCount'] ?? '',
    );
  }
}
