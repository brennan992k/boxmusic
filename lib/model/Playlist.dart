class Playlist {
  late String status;
  late String message;
  late String response;
  Playlist({
    required this.status,
    required this.message,
    required this.response,
  });

  static late List<PlaylistItem> playlists;
  static late List<Imagess> images;

  Playlist.getuserid(dynamic obj) {
    playlists = obj
        .map<PlaylistItem>((json) => new PlaylistItem.fromJson(json))
        .toList();
  }
}

class PlaylistItem {
  final String userplaylistid;
  final String userplaylistname;
  final int musiccount;
  final List<Imagess> imagesslist;

  PlaylistItem({
    required this.userplaylistid,
    required this.userplaylistname,
    required this.imagesslist,
    required this.musiccount,
  });

  factory PlaylistItem.fromJson(Map<String, dynamic> jsonMap) {
    var list = jsonMap['images'] as List;
    List<Imagess> imagesList = list.map((i) => Imagess.fromJson(i)).toList();

    return PlaylistItem(
      userplaylistid: jsonMap['user_playlist_id'],
      userplaylistname: jsonMap['user_playlist_name'],
      musiccount: jsonMap['music_count'],
      imagesslist: imagesList,
    );
  }
}

class Imagess {
  final String musicimage;

  Imagess({required this.musicimage});

  factory Imagess.fromJson(Map<String, dynamic> jsonMap) {
    return Imagess(musicimage: jsonMap['music_image']);
  }
}
