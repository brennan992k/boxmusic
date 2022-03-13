import 'package:flutter/material.dart';
import 'package:visong/Api/Networkutils.dart';
import 'package:visong/appconfi.dart';
import 'package:visong/model/HomeScreen/components/mostplayed.dart';
import 'package:visong/screens/music/music.dart';

// ignore: must_be_immutable
class Recent extends StatelessWidget {
  final List<MostPlayedItem> recent;
  Recent(this.recent, {Key? key}) : super(key: key);
  late AppConfig _appConfig;
  @override
  Widget build(BuildContext context) {
    _appConfig = AppConfig(context);
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
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
              ),
              // Container(
              //   child: Row(
              //     children: <Widget>[
              //       GestureDetector(
              //         onTap: () {},
              //         child: Container(
              //           padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
              //           child: Text(
              //             "Play all",
              //             style: TextStyle(
              //               color: Color.fromRGBO(153, 92, 228, 1),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
        // SizedBox(
        //   height: _appConfig.rHP(1),
        // ),
        Container(
          // margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: recent.isEmpty
              ? Container()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recent.length,
                  itemBuilder: (BuildContext context, int pos) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Music(
                              recent,
                              pos,
                              1,
                            ),
                          ),
                        );
                      },
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
                                  Networkutils.Baserl1 + recent[pos].musicimage,
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
                                  Container(
                                    width: _appConfig.rW(53),
                                    child: Text(
                                      recent[pos].musictitle,
                                      // style: recnttexttitle,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Container(
                                    width: _appConfig.rW(20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        recent[pos].isliked == 0
                                            ? Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        15, 0, 0, 0),
                                                width: _appConfig.rW(8),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // like(
                                                    //     '1',
                                                    //     'Music',
                                                    //     recent[pos]
                                                    //         .musicid);
                                                    // recent[pos].isliked = 1;
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
                                                    // unlike(
                                                    //     "1",
                                                    //     "Music",
                                                    //     recent[pos]
                                                    //         .musicid);
                                                    // recent[pos].isliked = 0;

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
                                            recent[pos].likecount.toString(),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              recent[pos].albumname == ""
                                  ? Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 5, 0, 15),
                                      width: _appConfig.rW(60),
                                      child: recent[pos].artistlist.length > 0
                                          ? Text(
                                              recent[pos]
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
                                  : recent[pos].artistlist.length == 0
                                      ? Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 15),
                                          width: _appConfig.rW(60),
                                          child: Text(
                                            recent[pos].albumname,
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
                                            recent[pos].albumname +
                                                " - " +
                                                recent[pos]
                                                    .artistlist[0]
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
                    );
                  },
                ),
        ),
      ],
    );
  }
}
