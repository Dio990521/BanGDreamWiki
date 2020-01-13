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
        title: Text("冲冲冲！"),
      ),
      body: Column(
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
                  print(randomCardWidgets);
                  return Center(
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        crossAxisCount: 5,
                        padding: EdgeInsets.all(10),
                        childAspectRatio: 0.99 / 1,
                        children: randomCardWidgets,
                      )
                  );
              }
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Text("十连抽",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),),
                  color: Colors.blueAccent,
                  onPressed: () {
                    setState(() {
                      randomCardWidgets.clear();
                      cards.shuffle();
                      for (CharacterCard card in cards) {
                        if (card.rarity != "1" && card.type != "活动" && randomCardWidgets.length < 10) {
                          randomCardWidgets.add(CardGrid(card: card));
                        }
                      }
                    });
                  },
                ),
                FlatButton(
                  child: Text("必三十连抽",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),),
                  color: Colors.blueAccent,
                  onPressed: () {
                    setState(() {
                      randomCardWidgets.clear();
                      cards.shuffle();
                      for (CharacterCard card in cards) {
                        if (card.rarity != "1" && card.rarity != "2" && card.type != "活动" && randomCardWidgets.length < 10) {
                          randomCardWidgets.add(CardGrid(card: card));
                        }
                      }
                    });

                  },
                ),
              ],
            ),
          )

        ],
      )
    );
  }

}
