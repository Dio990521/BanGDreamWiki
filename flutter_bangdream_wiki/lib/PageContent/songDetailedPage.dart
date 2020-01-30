import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Song.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/BandIcon.dart';

/// if click on SongGrid on SongPage, then detailed page shows up
class SongDetailedPage extends StatefulWidget {

  final Song song;
  SongDetailedPage({Key key, @required this.song}) : super(key: key);

  @override
  _State createState() => new _State();
}

class _State extends State<SongDetailedPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("歌曲详情",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blueAccent,
                      width: 2.0
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(20.0)
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: widget.song.imageURL,
                    height: 250,
                  ),
                )
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("标题",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.song.name, style: TextStyle(fontSize: 15),),
                ),
                Divider(),
                ListTile(
                    title: Text("乐团",style: TextStyle(fontWeight: FontWeight.bold),),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(widget.song.band, style: TextStyle(fontSize: 15),),
                        BandIcon(song: widget.song,)
                      ],
                    )
                ),
                Divider(),
                ListTile(
                  title: Text("类型",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.song.type, style: TextStyle(fontSize: 15),),
                ),
                Divider(),
                ListTile(
                  title: Text("难度",style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text("(Simple-Expert | Special)"),
                  trailing: Text(
                    widget.song.difficulty1 + "   " +
                        widget.song.difficulty2 + "   " +
                        widget.song.difficulty3 + "   " +
                        widget.song.difficulty4 + "  |  " +
                        widget.song.difficulty5,
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text("歌曲长度",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.song.length, style: TextStyle(fontSize: 15),),
                ),
                Divider(),
                ListTile(
                  title: Text("歌词",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.song.lyrics, style: TextStyle(fontSize: 15),),
                ),
                Divider(),
                ListTile(
                  title: Text("作曲",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.song.composer, style: TextStyle(fontSize: 15),),
                ),
                Divider(),
                ListTile(
                  title: Text("编曲",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.song.arrangement, style: TextStyle(fontSize: 15),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
