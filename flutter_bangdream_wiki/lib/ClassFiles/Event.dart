import 'package:cloud_firestore/cloud_firestore.dart';


class Event {

  String title;
  String attribute;
  String type;
  int id;
  List<dynamic> characters;
  String startDate;
  String endDate;
  String imageURL;
  String gachaURL;

  Event.fromMap(DocumentSnapshot map){
    this.title = map["title"];
    this.attribute = map["attribute"];
    this.type = map["type"];
    this.id = int.parse(map["id"]);
    this.characters = map["characters"];
    this.startDate = map["startDate"];
    this.endDate = map["endDate"];
    this.imageURL = map["imageURL"];
    this.gachaURL = map["gachaURL"];
  }

  @override
  String toString() {
    // TODO: implement toString
    return title;
  }

}