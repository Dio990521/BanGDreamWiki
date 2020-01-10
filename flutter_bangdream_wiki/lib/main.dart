import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/PageContent/eventPage.dart';
import 'package:flutter_bangdream_wiki/PageContent/otherPage.dart';
import 'package:flutter_bangdream_wiki/PageContent/songPage.dart';
import 'PageContent/cardPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CardPageContent(),
    SongPageContent(),
    EventPageContent(),
    OtherPageContent(),
    Column(
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
    )

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BanGDreamWiki",
      darkTheme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BanGDreamWiki'),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedFontSize: 16,
          unselectedFontSize: 13,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.face),
                activeIcon: Icon(Icons.face, color: Colors.blueAccent,),
                title: Text("角色")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                activeIcon: Icon(Icons.library_music, color: Colors.blueAccent,),
                title: Text("曲库")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.event),
                activeIcon: Icon(Icons.event, color: Colors.blueAccent,),
                title: Text("活动")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                activeIcon: Icon(Icons.dashboard, color: Colors.blueAccent,),
                title: Text("其他")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                activeIcon: Icon(Icons.person, color: Colors.blueAccent,),
                title: Text("个人")
            ),
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

void createRecord() async {
  final databaseReference = Firestore.instance;

  for (int i = 00051; i <= 00055; ++i){
    await databaseReference.collection("Card")
        .document(i.toString().padLeft(5, '0'))
        .setData({
      'character': '',
      'band': "Poppin'Party",
      'title' : '',
      'type' : '无期限',
      'attribute' : '',
      'skill' : '',
      'event' : null,
      'imageURL1' : '',
      'imageURL2' : '',
      'rarity' : '3',
      'cardImageURL1' : '',
      'cardImageURL2' : '',
      'id' : i.toString(),

    });
  }
  for (int i = 00056; i <= 00060; ++i){
    await databaseReference.collection("Card")
        .document(i.toString().padLeft(5, '0'))
        .setData({
      'character': '',
      'band': "Afterglow",
      'title' : '',
      'type' : '无期限',
      'attribute' : '',
      'skill' : '',
      'event' : null,
      'imageURL1' : '',
      'imageURL2' : '',
      'rarity' : '3',
      'cardImageURL1' : '',
      'cardImageURL2' : '',
      'id' : i.toString(),

    });
  }
  for (int i = 00061; i <= 00065; ++i){
    await databaseReference.collection("Card")
        .document(i.toString().padLeft(5, '0'))
        .setData({
      'character': '',
      'band': "Hello, Happy World!",
      'title' : '',
      'type' : '无期限',
      'attribute' : '',
      'skill' : '',
      'event' : null,
      'imageURL1' : '',
      'imageURL2' : '',
      'rarity' : '3',
      'cardImageURL1' : '',
      'cardImageURL2' : '',
      'id' : i.toString(),

    });
  }
  for (int i = 00066; i <= 00070; ++i){
    await databaseReference.collection("Card")
        .document(i.toString().padLeft(5, '0'))
        .setData({
      'character': '',
      'band': "Pastel Palettes",
      'title' : '',
      'type' : '无期限',
      'attribute' : '',
      'skill' : '',
      'event' : null,
      'imageURL1' : '',
      'imageURL2' : '',
      'rarity' : '3',
      'cardImageURL1' : '',
      'cardImageURL2' : '',
      'id' : i.toString(),

    });
  }
  for (int i = 00071; i <= 00075; ++i){
    await databaseReference.collection("Card")
        .document(i.toString().padLeft(5, '0'))
        .setData({
      'character': '',
      'band': "Roselia",
      'title' : '',
      'type' : '无期限',
      'attribute' : '',
      'skill' : '',
      'event' : null,
      'imageURL1' : '',
      'imageURL2' : '',
      'rarity' : '3',
      'cardImageURL1' : '',
      'cardImageURL2' : '',
      'id' : i.toString(),

    });
  }
}

void createRecord2() async {
  final databaseReference = Firestore.instance;

  for (int i = 00001; i <= 00001; ++i){
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
      'id' : '',
      'difficulty1' : '',
      'difficulty2' : '',
      'difficulty3' : '',
      'difficulty4' : '',

    });
  }
}

void createRecord3() async {
  final databaseReference = Firestore.instance;

  for (int i = 00001; i <= 00001; ++i){
    await databaseReference.collection("Event")
        .document(i.toString().padLeft(5, '0'))
        .setData({
      'endDate': '',
      'startDate': '',
      'imageURL' : '',
      'type' : '',
      'id' : '',
      'characters' : [],
      'attribute' : '',
      'title' : ''

    });
  }
}

