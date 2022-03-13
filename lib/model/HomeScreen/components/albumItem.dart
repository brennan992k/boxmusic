class PopularAlbum {
  late String status;
  late String message;
  late String response;

  static late List<PopularAlbumItem> popalbumlist;

  PopularAlbum.getuserid(dynamic obj) {
    popalbumlist = obj
        .map<PopularAlbumItem>((json) => PopularAlbumItem.fromJson(json))
        .toList();
  }
}

class PopularAlbumItem {
  final String albumid;
  final String albumname;
  final String albumimage;
  final String viewCount;
  final int isliked;
  final int likecount;
  final int musiccount;

  PopularAlbumItem({
    required this.albumid,
    required this.albumname,
    required this.albumimage,
    required this.viewCount,
    required this.musiccount,
    required this.isliked,
    required this.likecount,
  });

  factory PopularAlbumItem.fromJson(Map<String, dynamic> jsonMap) {
    return PopularAlbumItem(
      albumid: jsonMap['album_id'],
      albumname: jsonMap['album_name'],
      albumimage: jsonMap['album_image'],
      isliked: jsonMap['is_liked'],
      likecount: jsonMap['like_count'],
      musiccount: jsonMap['music_count'],
      viewCount: jsonMap['viewCount'],
    );
  }
}
