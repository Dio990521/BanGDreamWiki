import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bangdream_wiki/PageContent/songDetailedPage.dart';
import '../ClassFiles/Song.dart';
import '../SongFilterDialog.dart';

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
      case "ppp ":
        filterOn("Poppin'Party","");
        break;
      case "afg ":
        filterOn("Afterglow","");
        break;
      case "hhw ":
        filterOn("Hello, Happy World!","");
        break;
      case "rsl ":
        filterOn("Roselia","");
        break;
      case "pp ":
        filterOn("Pastel Palettes","");
        break;
      case " original":
        filterOn("","原创曲");
        break;
      case " cover":
        filterOn("", "翻唱曲");
        break;
      case "ppp original":
        filterOn("Poppin'Party","原创曲");
        break;
      case "afg original":
        filterOn("Afterglow","原创曲");
        break;
      case "hhw original":
        filterOn("Hello, Happy World!","原创曲");
        break;
      case "rsl original":
        filterOn("Roselia","原创曲");
        break;
      case "pp original":
        filterOn("Pastel Palettes","原创曲");
        break;
      case "ppp cover":
        filterOn("Poppin'Party","翻唱曲");
        break;
      case "afg cover":
        filterOn("Afterglow","翻唱曲");
        break;
      case "hhw cover":
        filterOn("Hello, Happy World!","翻唱曲");
        break;
      case "rsl cover":
        filterOn("Roselia","翻唱曲");
        break;
      case "pp cover":
        filterOn("Pastel Palettes","翻唱曲");
        break;
      case "reset":
        filterClicked = false;
        setState(() {});
        break;
      case "":
        break;
    }
  }

  void filterOn(String band, String type) {
    filteredSongs.clear();
    filterClicked = true;
    searchFilter = false;
    for (Song song in songs) {
      if (type == "") {
        if (song.band == band) {
          filteredSongs.add(song);
        }
      } else if (band == "") {
        if (song.type == type) {
          filteredSongs.add(song);
        }
      } else if (song.band == band && song.type == type){
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
                        songWidgets.clear();
                      if (filterClicked) {
                        for (Song song in filteredSongs) {
                          songWidgets.add(SongGrid(song));
                        }
                      } else if (searchFilter){
                        for (Song song in searchedListData) {
                          songWidgets.add(SongGrid(song));
                        }
                      } else {
                        for (Song song in songs) {
                          songWidgets.add(SongGrid(song));
                        }
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
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SongDetailedPage(song: song),
          ),
        );
      },
      child: Card(
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
      ),
    );
  }

}