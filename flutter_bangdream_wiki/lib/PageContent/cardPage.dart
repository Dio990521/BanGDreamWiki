
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ClassFiles/Card.dart';
import '../cardFilterDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';


class CardPageContent extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<CardPageContent>{

  IconData arrow = Icons.arrow_upward;

  bool arrowClicked = false;
  bool searchFilter = false;
  bool _reverse = true;
  bool filterClicked = false;
  int _cardsLength = 0;

  List<dynamic> cards = List<dynamic>();
  List<dynamic> filteredCards = List<dynamic>();
  List<dynamic> searchedListData = List<dynamic>();

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
        filterOn("Poppin'Party", "cool");
        break;
      case "ppp powerful":
        filterOn("Poppin'Party", "powerful");
        break;
      case "ppp happy":
        filterOn("Poppin'Party", "happy");
        break;
      case "ppp pure":
        filterOn("Poppin'Party", "pure");
        break;
      case "rsl cool":
        filterOn("Roselia", "cool");
        break;
      case "rsl powerful":
        filterOn("Roselia", "powerful");
        break;
      case "rsl happy":
        filterOn("Roselia", "happy");
        break;
      case "rsl pure":
        filterOn("Roselia", "pure");
        break;
      case "pp cool":
        filterOn("Pastel*Palettes", "cool");
        break;
      case "pp powerful":
        filterOn("Pastel*Palettes", "powerful");
        break;
      case "pp happy":
        filterOn("Pastel*Palettes", "happy");
        break;
      case "pp pure":
        filterOn("Pastel*Palettes", "pure");
        break;
      case "hhw cool":
        filterOn("Hello, Happy World!", "cool");
        break;
      case "hhw powerful":
        filterOn("Hello, Happy World!", "powerful");
        break;
      case "hhw happy":
        filterOn("Hello, Happy World!", "happy");
        break;
      case "hhw pure":
        filterOn("Hello, Happy World!", "pure");
        break;
      case "afg cool":
        filterOn("Afterglow", "cool");
        break;
      case "afg powerful":
        filterOn("Afterglow", "powerful");
        break;
      case "afg happy":
        filterOn("Afterglow", "happy");
        break;
      case "afg pure":
        filterOn("Afterglow", "pure");
        break;
      case "ppp ":
        filterOn("Poppin'Party", "");
        break;
      case "afg ":
        filterOn("Afterglow", "");
        break;
      case "hhw ":
        filterOn("Hello, Happy World!", "");
        break;
      case "rsl ":
        filterOn("Roselia", "");
        break;
      case "pp ":
        filterOn("Pastel*Palettes", "");
        break;
      case " powerful":
        filterOn("", "powerful");
        break;
      case " pure":
        filterOn("", "pure");
        break;
      case " cool":
        filterOn("", "cool");
        break;
      case " happy":
        filterOn("", "happy");
        break;
      case "reset":
        filterClicked = false;
        setState(() {});
        break;
      case "":
        break;
    }
  }

  void filterOn(String band, String attribute) {
    filteredCards = [];
    filterClicked = true;
    searchFilter = false;
    for (CharacterCard card in cards) {
      if (attribute == "") {
        if (card.band == band) {
          filteredCards.add(card);
        }
      } else if (band == "") {
        if (card.attribute == attribute) {
          filteredCards.add(card);
        }
      } else if (card.band == band && card.attribute == attribute){
        filteredCards.add(card);
      }
    }
    setState(() {});
  }

  void filterSearchResults(String query) {
    filterClicked = false;
    searchFilter = true;
    List<dynamic> searchList = List<dynamic>();
    searchList.addAll(cards);
    if(query.isNotEmpty) {
      searchedListData.clear();
      searchList.forEach((item) {
        if(item.toString().contains(query)) {
          searchedListData.add(item);
        }
      });
      print(searchedListData);
      setState(() {});
      return;
    } else {
      setState(() {
        searchFilter = false;
      });
    }
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
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: "输入卡牌/角色名",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)))
                    ),
                  ),
                )
              ),
              IconButton(
                icon: Icon(arrowClicked ? Icons.arrow_downward : Icons.arrow_upward),
                onPressed: () {
                  setState(() {
                    arrowClicked = !arrowClicked;
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
                    cards = snapshot.data.documents.map((DocumentSnapshot document) {
                      return new CharacterCard.fromMap(document);
                    }).toList();
                    _cardsLength = cards.length;
                    if (filterClicked) {
                      _cardsLength = filteredCards.length;
                    }
                    if (searchFilter){
                      _cardsLength = searchedListData.length;
                    }
                    return SingleChildScrollView(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemExtent: 70,
                          itemCount: _cardsLength,
                          reverse: _reverse,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            if (filterClicked) {
                              print(filteredCards);
                              CharacterCard card = filteredCards[index];
                              return CardTile(card);
                            }
                            if (searchFilter){
                              CharacterCard card = searchedListData[index];
                              return CardTile(card);
                            }
                            CharacterCard card = cards[index];
                            return CardTile(card);
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
    if (card.rarity == "1" || card.rarity == "2") {
      return Card(
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
    return Card(
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

