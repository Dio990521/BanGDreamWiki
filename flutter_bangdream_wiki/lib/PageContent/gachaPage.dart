import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Card.dart';
import 'gachaCardGrid.dart';

class GachaPageContent extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<GachaPageContent>{

  List<dynamic> cards = List<dynamic>();
  List<Widget> randomCardWidgets = List<Widget>();

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("抽卡结果"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: Firestore.instance.collection("Card").snapshots(),
              builder: (context, snapshot) {

                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    cards = snapshot.data.documents.map((DocumentSnapshot document) {
                      return new CharacterCard.fromMap(document);
                    }).toList();

                    cards.shuffle();
                    for (CharacterCard card in cards) {
                      if (/*card.rarity != "1" &&*/ randomCardWidgets.length <= 10) {
                        randomCardWidgets.add(CardGrid(card: card));
                      }
                    }
                    print(randomCardWidgets);
                    return Center(
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        crossAxisCount: 5,
                        padding: EdgeInsets.all(10),
                        childAspectRatio: 1.0 / 1,
                        children: randomCardWidgets,
                      )
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

