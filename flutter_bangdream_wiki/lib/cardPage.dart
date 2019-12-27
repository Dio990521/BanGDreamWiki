
import 'package:flutter/material.dart';
import 'Card.dart';
import 'cardFilterDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';


class CardPageContent extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<CardPageContent>{

  String _option = "";

  List<dynamic> cards = [];
  
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
      case "cool":
        getOption("cool");
        break;
      
    }
  }

  void getOption(String option) {
    setState(() {
      _option = option;
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
                    cards = snapshot.data.documents.map((DocumentSnapshot document) {
                      return new CharacterCard.fromMap(document);
                    }).toList();
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemExtent: 70,
                        itemCount: cards.length,
                        itemBuilder: (BuildContext context, int index) {
                          CharacterCard card = cards[index];
                          switch (card.rarity) {
                            case "1":
                              return CardTile2(card);
                            case "2":
                              return CardTile2(card);
                            default:
                              return CardTile(card);
                          }
                        }
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
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
          border: Border.all()
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 20,
            height: 60,
            child: Image.asset(card.starAssetPath),
          ),
          Container(
            width: 60,
            height: 60,
            child: CachedNetworkImage(
              imageUrl: card.imageURL1,
            )
            ),
          Container(
            width: 60,
            height: 60,
            child: CachedNetworkImage(
              imageUrl: card.imageURL2,
            ),
          ),
          Expanded(
            child: Container(
              //color: Colors.blueAccent,
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    card.title,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    card.skill,
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.end,

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
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all()
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 20,
            height: 60,
            child: Image.asset(card.starAssetPath),
          ),
          Container(
              width: 120,
              height: 60,
              child: CachedNetworkImage(
                imageUrl: card.imageURL1,
              )
          ),
          Expanded(
            child: Container(
              //color: Colors.blueAccent,
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    card.title,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    card.skill,
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.end,

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
          )
        ],
      ),
    );
  }
}


