import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/SongFilterDialog.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Song.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/SongGrid.dart';

class SongPageContent extends StatefulWidget {

  final List<dynamic> songs;
  SongPageContent({Key key, @required this.songs}) : super(key: key);


  @override
  _State createState() => new _State();
}

class _State extends State<SongPageContent> {

  List<Widget> songWidgets = List<Widget>();
  List<dynamic> filteredSongs = List<dynamic>();
  List<dynamic> searchedListData = List<dynamic>();

  bool arrowClicked = false;
  bool searchFilter = false;
  bool filterClicked = false;
  int _songsLength = 0;

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
    for (Song song in widget.songs) {
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
    searchList.addAll(widget.songs);
    if(query.isNotEmpty) {
      searchedListData.clear();
      searchList.forEach((item) {
        if(item.toString().contains(query)) {
          searchedListData.add(item);
        }
      });

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
    _songsLength = widget.songs.length;
    if (filterClicked) {
      _songsLength = filteredSongs.length;
    }
    if (searchFilter){
      _songsLength = searchedListData.length;
    }
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
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(10),
                    itemCount: _songsLength,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                        childAspectRatio: 0.67
                    ),
                    itemBuilder: (BuildContext context, int index){
                      if (filterClicked) {
                        Song song = filteredSongs[index];
                        return SongGrid(song);
                      }
                      if (searchFilter){
                        Song song = searchedListData[index];
                        return SongGrid(song);
                      }
                      Song song = widget.songs[index];
                      return SongGrid(song);
                    },
                  )
              )
            ]
        )
    );
  }
}