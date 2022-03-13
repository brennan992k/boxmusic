import 'package:flutter/material.dart';
import 'package:visong/Api/Networkutils.dart';
import 'package:visong/appconfi.dart';
import 'package:visong/model/HomeScreen/components/mostplayed.dart';
import 'package:visong/screens/music/music.dart';

class RecentPlay extends StatefulWidget {
  final List<MostPlayedItem> recent;
  const RecentPlay(this.recent, {Key? key}) : super(key: key);

  @override
  _RecentPlayState createState() => _RecentPlayState();
}

class _RecentPlayState extends State<RecentPlay> {
  late Networkutils networkutils;

  Future like(String id, liketype, liketypeId) async {
    await networkutils.like(id, liketype, liketypeId);
    setState(() {});
  }

  Future unlike(String id, liketype, liketypeId) async {
    await networkutils.unlike(id, liketype, liketypeId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    networkutils = Networkutils();
  }

  @override
  Widget build(BuildContext context) {
    AppConfig _appConfig;
    _appConfig = AppConfig(context);
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(5, 20, 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(0, 239, 215, 1),
                          Color.fromRGBO(153, 92, 228, 1),
                        ],
                      ),
                    ),
                    height: _appConfig.rH(3.5),
                    width: _appConfig.rH(3.5),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "Recent Played",
                    ),
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Music(
                              widget.recent,
                              0,
                              1,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                        child: const Text(
                          "Play all",
                          style: TextStyle(
                            color: Color.fromRGBO(153, 92, 228, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: _appConfig.rHP(1),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(5, 20, 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: widget.recent.isEmpty
              ? Container()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.recent.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Music(
                              widget.recent,
                              i,
                              1,
                              image: widget.recent[i].musicimage,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 15, 10),
                              child: Container(
                                width: _appConfig.rH(6),
                                height: _appConfig.rH(6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    Networkutils.Baserl1 +
                                        widget.recent[i].musicimage,
                                    height: _appConfig.rH(6),
                                    width: _appConfig.rH(6),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: _appConfig.rW(53),
                                      child: Text(
                                        widget.recent[i].musictitle,
                                        // style: recnttexttitle,
                                        maxLines: 1,
                                      ),
                                    ),
                                    SizedBox(
                                      width: _appConfig.rW(20),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          widget.recent[i].isliked == 0
                                              ? Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          15, 0, 0, 0),
                                                  width: _appConfig.rW(8),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      like(
                                                          '1',
                                                          'Music',
                                                          widget.recent[i]
                                                              .musicid);
                                                      widget.recent[i].isliked =
                                                          1;
                                                      print("jhjdhhdj");
                                                    },
                                                    child: const Icon(
                                                        Icons.favorite_border),
                                                  ),
                                                )
                                              : Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          15, 0, 0, 0),
                                                  width: _appConfig.rW(8),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      unlike(
                                                          "1",
                                                          "Music",
                                                          widget.recent[i]
                                                              .musicid);
                                                      widget.recent[i].isliked =
                                                          0;

                                                      print("jhjdhhdj");
                                                    },
                                                    child: const Icon(
                                                      Icons.favorite,
                                                    ),
                                                  ),
                                                ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                5, 0, 0, 0),
                                            child: Text(
                                              widget.recent[i].likecount
                                                  .toString(),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                widget.recent[i].albumname == ""
                                    ? Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 5, 0, 15),
                                        width: _appConfig.rW(60),
                                        child:
                                            widget.recent[i].artistlist.length >
                                                    0
                                                ? Text(
                                                    widget
                                                        .recent[i]
                                                        .artistlist[0]
                                                        .artistname,
                                                    maxLines: 1,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      // fontSize: 20,
                                                    ),
                                                  )
                                                : const Text(""),
                                      )
                                    : widget.recent[i].artistlist.isEmpty
                                        ? Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 15),
                                            width: _appConfig.rW(60),
                                            child: Text(
                                              widget.recent[i].albumname,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                // fontSize: 20,
                                              ),
                                              maxLines: 1,
                                            ),
                                          )
                                        : Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 15),
                                            width: _appConfig.rW(60),
                                            child: Text(
                                              widget.recent[i].albumname +
                                                  " - " +
                                                  widget.recent[i].artistlist[0]
                                                      .artistname,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                // fontSize: 20,
                                              ),
                                              maxLines: 1,
                                            ),
                                          ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
