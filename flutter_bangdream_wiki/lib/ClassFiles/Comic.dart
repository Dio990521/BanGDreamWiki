import 'package:cloud_firestore/cloud_firestore.dart';

/// Comic class
/// Store all data here
class Comic {

  String title;
  int id;
  String imageURL1;
  String imageURL2;

  /// special constructor for firestore only
  Comic.fromMap(DocumentSnapshot map){
    this.imageURL1 =  map["imageURL1"];
    this.imageURL2 =  map["imageURL2"];
    this.id =  int.parse(map["id"]);
    this.title =  map["title"];
  }
}