import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Card.dart';
import 'gachaCardGrid.dart';
import 'dart:math';

/// build gacha page here
class GachaPageContent extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<GachaPageContent>{

  List<dynamic> cards = List<dynamic>();
  List<Widget> randomCardWidgets = List<Widget>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("冲冲冲！"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30),
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
                    return Container(
                      padding: EdgeInsets.all(5),
                      height: 200,
                      decoration: BoxDecoration(
                        //color: Colors.lightBlue,
                        border: Border.all(),
                      ),
                        child: Center(
                          child: GridView.count(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            crossAxisCount: 5,
                            padding: EdgeInsets.all(10),
                            childAspectRatio: 0.99 / 1,
                            children: randomCardWidgets,
                          ),
                        )
                    );
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Text("十连抽",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),),
                    color: Colors.blueAccent,
                    onPressed: () {
                      normalGacha();
                      int count = 0;
                      for (GachaCardGrid cardGrid in randomCardWidgets) {
                        if (int.parse(cardGrid.card.rarity) == 2) {
                          count++;
                        }
                      }
                      if (count == 10) {
                        randomCardWidgets.removeLast();
                        for (CharacterCard card in cards) {
                          if (card.rarity == "3" && card.type != "活动" && card.type != "联名合作") {
                            randomCardWidgets.add(GachaCardGrid(card: card));
                            break;
                          }
                        }
                      }
                      setState(() {});
                    },
                  ),
                  FlatButton(
                    child: Text("机票模拟",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),),
                    color: Colors.blueAccent,
                    onPressed: () {
                      setState(() {
                        specialGacha();
                      });

                    },
                  ),
                  FlatButton(
                    child: Text("必四星十连",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),),
                    color: Colors.blueAccent,
                    onPressed: () {
                      setState(() {
                        rarity4Gacha();
                      });
                    },
                  ),
                  FlatButton(
                    child: Text("大杂烩十连",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),),
                    color: Colors.blueAccent,
                    onPressed: () {
                      setState(() {
                        mixedGacha();
                      });
                    },
                  ),
                ],
              ),
            )

          ],
        ),
      )
    );
  }

  /// several gacha probability functions
  void normalGacha() {
    randomCardWidgets.clear();
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      if (rng.nextInt(100) <= 5) {
        cards.shuffle();
        for (CharacterCard card in cards) {
          if (card.rarity == "4" && card.type != "活动" && card.type != "联名合作" && randomCardWidgets.length < 10) {
            randomCardWidgets.add(GachaCardGrid(card: card));
            break;
          }
        }
      }
      else if (rng.nextInt(100) <= 15) {
        cards.shuffle();
        for (CharacterCard card in cards) {
          if (card.rarity == "3" && card.type != "活动" && card.type != "联名合作" && randomCardWidgets.length < 10) {
            randomCardWidgets.add(GachaCardGrid(card: card));
            break;
          }
        }
      }
      else {
        cards.shuffle();
        for (CharacterCard card in cards) {
          if (card.rarity == "2" && card.type != "活动" && card.type != "联名合作" && randomCardWidgets.length < 10) {
            randomCardWidgets.add(GachaCardGrid(card: card));
            break;
          }
        }
      }
    }
  }

  void specialGacha() {
    randomCardWidgets.clear();
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      if (rng.nextInt(100) <= 10) {
        cards.shuffle();
        for (CharacterCard card in cards) {
          if (card.rarity == "4" && card.type != "活动" && card.type != "联名合作" && card.type != "期间限定" && randomCardWidgets.length < 10) {
            randomCardWidgets.add(GachaCardGrid(card: card));
            break;
          }
        }
      }
      else {
        cards.shuffle();
        for (CharacterCard card in cards) {
          if (card.rarity == "3" && card.type != "活动" && card.type != "联名合作" && card.type != "期间限定" && randomCardWidgets.length < 10) {
            randomCardWidgets.add(GachaCardGrid(card: card));
            break;
          }
        }
      }
    }
  }

  void rarity4Gacha() {
    randomCardWidgets.clear();
    for (var i = 0; i < 10; i++) {
      cards.shuffle();
      for (CharacterCard card in cards) {
        if (card.rarity == "4" && card.type != "活动" && card.type != "联名合作" && randomCardWidgets.length < 10) {
          randomCardWidgets.add(GachaCardGrid(card: card));
          break;
        }
      }
    }
  }

  void mixedGacha() {
    randomCardWidgets.clear();
    cards.shuffle();
    var count = 0;
    while (count < 10) {
      randomCardWidgets.add(GachaCardGrid(card: cards[count]));
      count++;
    }
  }

}
