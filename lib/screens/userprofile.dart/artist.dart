import 'package:flutter/material.dart';
import 'package:visong/Api/Networkutils.dart';
import 'package:visong/appconfi.dart';
import 'package:visong/screens/viewAlbum.dart';
import 'package:visong/staticData.dart';

// ignore: must_be_immutable
class Artists extends StatelessWidget {
  final List favartist;
  late AppConfig _appConfig;

  Artists(this.favartist, {Key? key}) : super(key: key);

  Widget favlistartist(i, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ViewAlbumScreen(
              favartist[i].artistid,
              favartist[i].artistname,
              favartist[i].artistimage,
              '',
              favartist[i].isliked,
              "Artist",
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10, left: 10),
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                height: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    Networkutils.Baserl1 + favartist[i].artistimage,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      favartist[i].artistname,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _appConfig = AppConfig(context);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color.fromRGBO(0, 239, 215, 1),
                      const Color.fromRGBO(153, 92, 228, 1),
                    ],
                  ),
                ),
                height: _appConfig.rH(3.5),
                width: _appConfig.rH(3.5),
                child: Image.asset(
                  StaticData.imagepath + 'manager.png',
                  scale: 1.9,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  "Favourite Artists",
                  style: TextStyle(
                    fontSize:
                        MediaQuery.of(context).size.height > 850 ? 20 : 18,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Container(
            // height: MediaQuery.of(context).size.height - 115,
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: favartist.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    child: const Text('No Favourites yet!'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: favartist.length,
                    itemBuilder: (context, index) {
                      return favlistartist(index, context);
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
