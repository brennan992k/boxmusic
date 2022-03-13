class PlayMusic {
  late String status;
  late String message;
  late String response;

  static late List<PlayMusicItem> playMusic;

  PlayMusic.getuserid(dynamic obj) {
    playMusic = obj
        .map<PlayMusicItem>((json) => new PlayMusicItem.fromJson(json))
        .toList();
  }
}

class PlayMusicItem {
  final String musictitle;
  final String musicid;
  final String musicfile;
  final String musicimage;
  final String musicduration;
  final String moviename;
  int? isliked;
  final int likecount;
  final String albumname;
  final List<Artists> artistlist;
  final String movieid;

  PlayMusicItem({
    required this.musicid,
    required this.musictitle,
    required this.musicimage,
    required this.musicduration,
    required this.moviename,
    required this.movieid,
    required this.musicfile,
    required this.likecount,
    required this.albumname,
    required this.artistlist,
    this.isliked,
  });

  factory PlayMusicItem.fromJson(Map<String, dynamic> jsonMap) {
    var list = jsonMap['artists'] as List;
    // print(list.runtimeType);
    List<Artists> imagesList = list.map((i) => Artists.fromJson(i)).toList();

    return PlayMusicItem(
        musicduration: jsonMap['music_duration'],
        isliked: jsonMap['is_liked'],
        musicfile: jsonMap['music_file'],
        musicimage: jsonMap['music_image'],
        likecount: jsonMap['like_count'],
        musicid: jsonMap['music_id'],
        movieid: jsonMap['movie_id'],
        moviename: jsonMap['movie_name'],
        albumname: jsonMap['album_name'],
        artistlist: imagesList,
        musictitle: jsonMap['music_title']);
  }
}

class Artists {
  final String artistname;

  Artists({
    required this.artistname,
  });

  factory Artists.fromJson(Map<String, dynamic> jsonMap) {
    return Artists(
      artistname: jsonMap['artist_name'],
    );
  }
}
