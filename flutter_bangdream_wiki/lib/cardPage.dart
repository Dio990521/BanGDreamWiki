
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Card.dart';
import 'cardFilterDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';


class CardPageContent extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<CardPageContent>{

  String _option = "";
  IconData arrow = Icons.arrow_upward;

  bool alreadyClicked = false;
  bool _reverse = false;
  bool filterClicked = false;

  List<dynamic> cards = [];
  List<dynamic> filteredCards = [];
  
  Future<Null> cardFilter() async {
    switch(
      await showGeneralDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 200),
        pageBuilder: (context, animation1, animation2) {return Text("?");},
        barrierDismissible: true,
        barrierLabel: "",
        transitionBuilder: (context,a1,a2,widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: CardFilterDialog()
              )
            );
          }
        )
    ) {
      case "ppp cool":
        getOption("ppp cool");
        break;
      case "ppp powerful":
        filteredCards = [];
        filterClicked = true;
        getOption("ppp powerful");

        for (CharacterCard card in cards) {
          if (card.band == "Poppin'Party" && card.attribute == "powerful"){
            filteredCards.add(card);
            print("!!!");
          }
        }

        cards = filteredCards;
        print(cards);

        break;
      case "ppp happy":
        getOption("ppp happy");
        break;
      case "ppp pure":
        getOption("ppp pure");
        break;
      case "rsl cool":
        getOption("rsl cool");
        break;
      case "rsl powerful":
        getOption("rsl powerful");
        break;
      case "rsl happy":
        getOption("rsl happy");
        break;
      case "rsl pure":
        getOption("rsl pure");
        break;
      case "pp cool":
        getOption("pp cool");
        break;
      case "pp powerful":
        getOption("pp powerful");
        break;
      case "pp happy":
        getOption("pp happy");
        break;
      case "pp pure":
        getOption("pp pure");
        break;
      case "hhw cool":
        getOption("hhw cool");
        break;
      case "hhw powerful":
        getOption("hhw powerful");
        break;
      case "hhw happy":
        getOption("hhw happy");
        break;
      case "hhw pure":
        getOption("hhw pure");
        break;
      case "afg cool":
        getOption("afg cool");
        break;
      case "afg powerful":
        getOption("afg powerful");
        break;
      case "afg happy":
        getOption("afg happy");
        break;
      case "afg pure":
        getOption("afg pure");
        break;
    }
  }

  void getOption(String option) {
    setState(() {
      _option = option;
      print(_option);
    });

  }

  @override
  Widget build(BuildContext context) {
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
                      labelText: "输入卡牌/角色名"
                  ),
                ),
              ),
              IconButton(
                icon: Icon(alreadyClicked ? Icons.arrow_downward : Icons.arrow_upward),
                onPressed: () {

                  setState(() {
                    alreadyClicked = !alreadyClicked;
                    _reverse = !_reverse;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  cardFilter();
                }
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: StreamBuilder(
              stream: Firestore.instance.collection("Card").snapshots(),
              builder: (context, snapshot) {

                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (!filterClicked) {
                      cards = snapshot.data.documents.map((DocumentSnapshot document) {
                        return new CharacterCard.fromMap(document);
                      }).toList();
                    }
                    return SingleChildScrollView(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemExtent: 70,
                          itemCount: cards.length,
                          reverse: _reverse,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            CharacterCard card = cards[index];
                            if (filterClicked) {
                              CharacterCard card = filteredCards[index];
                              switch (card.rarity) {
                                case "1":
                                  return CardTile2(card);
                                case "2":
                                  return CardTile2(card);
                                default:
                                  return CardTile(card);
                              }
                            } else {
                              switch (card.rarity) {
                                case "1":
                                  return CardTile2(card);
                                case "2":
                                  return CardTile2(card);
                                default:
                                  return CardTile(card);
                              }
                            }
                          }
                      ),
                    );
                }
              },
            ),
          )

        ],
      ),
    );
  }
}

class CardTile extends StatelessWidget {
  final CharacterCard card;

  CardTile(this.card);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      //padding: EdgeInsets.all(7),
      //decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(10.0),
          //border: Border.all()
      //),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Container(
            width: 25,
            height: 50,
            child: Image.asset(card.starAssetPath),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 50,
            height: 50,
            child: CachedNetworkImage(
              imageUrl: card.imageURL1,
            )
            ),
          Container(
            width: 60,
            height: 50,
            child: CachedNetworkImage(
              imageUrl: card.imageURL2,
            ),
          ),
          Expanded(
            child: Container(
              //color: Colors.blueAccent,
              padding: EdgeInsets.only(left: 1,right: 10,top: 13),
              child: Column(
                children: <Widget>[
                  Text(
                    card.title,
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Text(
                      card.skill,
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,

                    ),
                  )

                ],
              ),
            ),
          ),
          Container(
            width: 25,
            //height: 30,
            child: Image.asset(card.attributeAssetPath),
            padding: EdgeInsets.only(right: 3),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}

class CardTile2 extends StatelessWidget {
  final CharacterCard card;

  CardTile2(this.card);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      //padding: EdgeInsets.all(7),
      //decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(10.0),
          //border: Border.all()
      //),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Container(
            width: 25,
            height: 50,
            child: Image.asset(
                card.starAssetPath,
            ),
          ),
          Container(
              width: 120,
              height: 50,
              child: CachedNetworkImage(
                imageUrl: card.imageURL1,
              )
          ),
          Expanded(
            child: Container(
              //color: Colors.blueAccent,
              padding: EdgeInsets.only(left: 0,right: 0,top: 13),
              child: Column(
                children: <Widget>[
                  Text(
                    card.title,
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    card.skill,
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,

                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 25,
            //height: 30,
            child: Image.asset(card.attributeAssetPath),
            padding: EdgeInsets.only(right: 3),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}


