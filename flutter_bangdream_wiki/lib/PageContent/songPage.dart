import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'SongPageContent.dart';
import '../ClassFiles/Song.dart';

/// get all songs from firestore
class SongPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection("Song").snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              List<dynamic> songs = snapshot.data.documents.map((DocumentSnapshot document) {
                return new Song.fromMap(document);
              }).toList();
              songs = songs.reversed.toList();
              return SongPageContent(songs: songs);
          }
        });
  }
}


