class Movie {
  late String status;
  late String message;
  late String response;

  static late List<MoviesItem> movie;

  Movie.getuserid(dynamic obj) {
    movie = obj.map<MoviesItem>((json) => MoviesItem.fromJson(json)).toList();
  }
}

class MoviesItem {
  final String movieid;
  final String moviename;
  final String movieimage;
  final String likedCount;
  final int isliked;

  MoviesItem({
    required this.movieid,
    required this.movieimage,
    required this.moviename,
    required this.isliked,
    required this.likedCount,
  });

  factory MoviesItem.fromJson(Map<String, dynamic> jsonMap) {
    return MoviesItem(
      movieid: jsonMap['movie_id'],
      movieimage: jsonMap['movie_image'] ?? '',
      moviename: jsonMap['movie_name'] ?? '',
      isliked: jsonMap['is_liked'] ?? 0,
      likedCount: jsonMap['likedCount'] ?? '',
    );
  }
}
