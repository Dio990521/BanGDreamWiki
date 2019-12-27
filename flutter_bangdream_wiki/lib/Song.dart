import 'package:cloud_firestore/cloud_firestore.dart';

class Song {

  String name;
  String imageURL;
  String type;
  String lyrics;
  String composer;
  String arrangement;
  String band;
  String length;
  String difficulty1;
  String difficulty2;
  String difficulty3;
  String difficulty4;
  int id;

  Song.fromMap(DocumentSnapshot map){
    this.name = map["name"];
    this.imageURL = map["imageURL"];
    this.type = map["type"];
    this.lyrics = map["lyrics"];
    this.composer = map["composer"];
    this.arrangement = map["arrangement"];
    this.band = map["band"];
    this.length = map["band"];
    this.id = int.parse(map["id"]);
    this.difficulty1 = map["difficulty1"];
    this.difficulty2 = map["difficulty2"];
    this.difficulty3 = map["difficulty3"];
    this.difficulty4 = map["difficulty4"];

  }

}