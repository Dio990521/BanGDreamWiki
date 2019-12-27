import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'Song.dart';

class SongPageContent extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<SongPageContent> {

  List<dynamic> songs = [];
  List<Widget> songWidgets = [];

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
                  child: TextFormField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        labelText: "输入歌曲名"
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      
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
                          for (Song song in songs) {
                            songWidgets.add(SongGrid(song));
                          }
                          return GridView.count(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              padding: EdgeInsets.all(10),
                              childAspectRatio: 6.0 / 9.0,
                              children: songWidgets,
                          );
                      }
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