import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// for developer to update data to firestore
class FBPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('Create Card'),
          onPressed: () {
            createRecord();
          },),
        RaisedButton(
          child: Text("Create Song"),
          onPressed: (){
            createRecord2();
          },
        ),
        RaisedButton(
          child: Text("Create Event"),
          onPressed: () {
            createRecord3();
          },
        )
      ],
    );
  }
}

void createRecord() async {
  final databaseReference = Firestore.instance;

  for (int i = 000287; i <= 00291; ++i){
    await databaseReference.collection("Card")
        .document(i.toString().padLeft(5, '0'))
        .setData({
      'character': '',
      'band': "",
      'title' : '',
      'type' : '',
      'attribute' : '',
      'skill' : '',
      'event' : '00034',
      'imageURL1' : '',
      'imageURL2' : '',
      'rarity' : '',
      'cardImageURL1' : '',
      'cardImageURL2' : '',
      'id' : i.toString(),
    });
  }
}

void createRecord2() async {
  final databaseReference = Firestore.instance;

  for (int i = 00117; i <= 000117; ++i){
    await databaseReference.collection("Song")
        .document(i.toString().padLeft(5, '0'))
        .setData({
      'name': '',
      'band': '',
      'imageURL' : '',
      'type' : '',
      'lyrics' : '',
      'composer' : '',
      'arrangement' : '',
      'length' : '',
      'id' : i.toString(),
      'difficulty1' : '',
      'difficulty2' : '',
      'difficulty3' : '',
      'difficulty4' : '',
      'difficulty5' : '',
    });
  }
}

void createRecord3() async {
  final databaseReference = Firestore.instance;

  for (int i = 000034; i <= 00034; ++i){
    await databaseReference.collection("Event")
        .document(i.toString().padLeft(5, '0'))
        .setData({
      'endDate': '2020年',
      'startDate': '2020年',
      'imageURL' : '',
      'type' : '',
      'id' : i.toString(),
      'characters' : [],
      'attribute' : '',
      'title' : '',
      'gachaURL' : ''
    });
  }
}