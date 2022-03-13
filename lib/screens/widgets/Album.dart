import 'package:flutter/material.dart';
import 'package:visong/Api/Networkutils.dart';
import 'package:visong/appconfi.dart';
import 'package:visong/customRoute.dart';
import 'package:visong/screens/viewAlbum.dart';
import 'package:visong/screens/viewAllAlbum.dart';
import 'package:visong/staticData.dart';

// ignore: must_be_immutable
class Album extends StatelessWidget {
  final List album;
  Album(this.album, {Key? key}) : super(key: key);
  late AppConfig _appConfig;

  @override
  Widget build(BuildContext context) {
    _appConfig = AppConfig(context);

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      // height: _appConfig.rH(32),
      child: Column(
        children: <Widget>[
          Container(
            height: _appConfig.rH(7),
            margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
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
                  child: Image.asset(
                    StaticData.imagepath + 'album.png',
                    // scale: 2,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                  child: Text(
                    "Popular Albums",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => ViewAllAlbumSceen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        color: Color.fromRGBO(153, 92, 228, 1),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height > 840
                ? _appConfig.rH(25)
                : _appConfig.rH(27),
            margin: const EdgeInsets.symmetric(vertical: 0.0),
            child: album.isEmpty
                ? Container()
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: album.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CustomRoute(
                              builder: (ctx) => ViewAlbumScreen(
                                album[index].albumid,
                                album[index].albumname,
                                album[index].albumimage,
                                album[index].viewCount,
                                album[index].isliked,
                                'Album',
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 0.0,
                          ),
                          width: _appConfig.rHP(19.5),
                          height: _appConfig.rHP(23),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: _appConfig.rHP(17),
                                height: _appConfig.rHP(17),
                                child: Stack(
                                  children: <Widget>[
                                    Hero(
                                      tag: album[index].albumimage,
                                      child: Container(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            Networkutils.Baserl1 +
                                                album[index].albumimage,
                                            height: _appConfig.rH(18),
                                            width: _appConfig.rH(18),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 5, 0),
                                        width: _appConfig.rWP(20),
                                        height: _appConfig.rHP(3),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(16.0),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            album[index].musiccount.toString() +
                                                " Songs",
                                            overflow: TextOverflow.ellipsis,
                                            textWidthBasis:
                                                TextWidthBasis.longestLine,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 5, 5, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      album[index].albumname,
                                      // style: regular2textstyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textWidthBasis:
                                          TextWidthBasis.longestLine,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        const Icon(
                                          Icons.perm_identity,
                                          color: Color(0xffAEAEAE),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Text(
                                            album[index].viewCount,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textWidthBasis:
                                                TextWidthBasis.longestLine,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
