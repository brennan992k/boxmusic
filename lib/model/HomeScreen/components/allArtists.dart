class AllArtist {
  late String status;
  late String message;
  late String response;

  static late List<AllArtistsItem> favList;

  AllArtist.getuserid(dynamic obj) {
    favList = obj
        .map<AllArtistsItem>((json) => AllArtistsItem.fromJson(json))
        .toList();
  }
}

class AllArtistsItem {
  final String artistid;
  final String artistname;
  final String artistimage;
  int likedCount;
  int isliked;

  AllArtistsItem({
    required this.artistid,
    required this.artistname,
    required this.artistimage,
    required this.likedCount,
    required this.isliked,
  });

  factory AllArtistsItem.fromJson(Map<String, dynamic> jsonMap) {
    return AllArtistsItem(
      artistid: jsonMap['artist_id'],
      artistname: jsonMap['artist_name'],
      artistimage: jsonMap['artist_image'],
      isliked: jsonMap['is_liked'],
      likedCount: jsonMap['like_count'],
    );
  }
}
