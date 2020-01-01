import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'Song.dart';
import 'SongFilterDialog.dart';

class SongPageContent extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<SongPageContent> {

  List<dynamic> songs = List<dynamic>();
  List<Widget> songWidgets = List<Widget>();
  List<dynamic> filteredSongs = List<dynamic>();
  List<dynamic> searchedListData = List<dynamic>();

  bool arrowClicked = false;
  bool searchFilter = false;
  bool _reverse = true;
  bool filterClicked = false;

  Future<Null> songFilter() async {
    switch(
    await showGeneralDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 200),
        pageBuilder: (context, animation1, animation2) {return Text("?");},
        barrierDismissible: true,
        barrierLabel: "",
        transitionBuilder: (context,a1,a2,widget) {
          return Transform.scale(
              scale: a1.value,
              child: Opacity(
                  opacity: a1.value,
                  child: SongFilterDialog()
              )
          );
        }
    )
    ) {
      case "ppp":
        filterOn("Poppin'Party");
        break;
      case "afg":
        filterOn("Afterglow");
        break;
      case "hhw":
        filterOn("Hello, Happy World!");
        break;
      case "rsl":
        filterOn("Roselia");
        break;
      case "pp":
        filterOn("Pastel*Palettes");
        break;

    }
  }

  void filterOn(String band) {
    filteredSongs = [];
    filterClicked = true;
    searchFilter = false;
    for (Song song in songs) {
      if (song.band == band) {
          filteredSongs.add(song);
      }
    }
    setState(() {});
  }

  void filterSearchResults(String query) {
    filterClicked = false;
    searchFilter = true;
    List<dynamic> searchList = List<dynamic>();
    searchList.addAll(songs);
    if(query.isNotEmpty) {
      searchedListData.clear();
      searchList.forEach((item) {
        if(item.toString().contains(query)) {
          searchedListData.add(item);
        }
      });
      print(searchedListData);
      setState(() {});
      return;
    } else {
      setState(() {
        searchFilter = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 7.0, right: 7.0),
      child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      onChanged: (value) {
                        filterSearchResults(value);
                      },
                      style: TextStyle(height: 1),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          labelText: "输入歌曲名",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)))
                      ),
                    ),
                  )
                ),
                IconButton(
                  icon: Icon(arrowClicked ? Icons.arrow_downward : Icons.arrow_upward),
                  onPressed: () {
                    setState(() {
                      arrowClicked = !arrowClicked;
                      _reverse = !_reverse;
                    });
                  },
                ),
                IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      songFilter();
                    }
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
                child: StreamBuilder(
                    stream: Firestore.instance.collection("Song").snapshots(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          songs = snapshot.data.documents.map((DocumentSnapshot document) {
                            return new Song.fromMap(document);
                          }).toList();
                        }
                        songWidgets = [];
                        for (Song song in songs) {
                          songWidgets.add(SongGrid(song));
                        }
                       return SingleChildScrollView(
                         child: GridView.count(
                           scrollDirection: Axis.vertical,
                           shrinkWrap: true,
                           crossAxisCount: 3,
                           physics: NeverScrollableScrollPhysics(),
                           reverse: _reverse,
                           padding: EdgeInsets.all(10),
                           childAspectRatio: 6.0 / 9.0,
                           children: songWidgets,
                         ),
                       );
                    })
            )
          ]
      )
    );
  }
}

class SongGrid extends StatelessWidget {

  final Song song;

  SongGrid(this.song);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: song.imageURL,
          ),
          Expanded(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    song.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}