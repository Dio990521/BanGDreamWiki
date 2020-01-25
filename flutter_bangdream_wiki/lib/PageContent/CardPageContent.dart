import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../ClassFiles/Card.dart';
import '../cardFilterDialog.dart';
import 'dart:async';
import 'package:flutter_bangdream_wiki/ClassFiles/CardTile.dart';


class CardPageContent extends StatefulWidget{

  final List<dynamic> cards;
  CardPageContent({Key key, @required this.cards}) : super(key: key);

  @override
  _State createState() => new _State();
}

class _State extends State<CardPageContent> {

  IconData arrow = Icons.arrow_upward;

  bool arrowClicked = false;
  bool searchFilter = false;
  bool filterClicked = false;
  int _cardsLength = 0;

  List<dynamic> filteredCards = List<dynamic>();
  List<dynamic> searchedListData = List<dynamic>();

  final ScrollController _scrollController= ScrollController();

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
      case "Poppin'Party cool":
        filterOn("Poppin'Party", "cool","");
        break;
      case "Poppin'Party powerful":
        filterOn("Poppin'Party", "powerful","");
        break;
      case "Poppin'Party happy":
        filterOn("Poppin'Party", "happy","");
        break;
      case "Poppin'Party pure":
        filterOn("Poppin'Party", "pure","");
        break;
      case "Roselia cool":
        filterOn("Roselia", "cool","");
        break;
      case "Roselia powerful":
        filterOn("Roselia", "powerful","");
        break;
      case "Roselia happy":
        filterOn("Roselia", "happy","");
        break;
      case "Roselia pure":
        filterOn("Roselia", "pure","");
        break;
      case "Pastel Palettes cool":
        filterOn("Pastel Palettes", "cool","");
        break;
      case "Pastel Palettes powerful":
        filterOn("Pastel Palettes", "powerful","");
        break;
      case "Pastel Palettes happy":
        filterOn("Pastel Palettes", "happy","");
        break;
      case "Pastel Palettes pure":
        filterOn("Pastel Palettes", "pure","");
        break;
      case "Hello, Happy World! cool":
        filterOn("Hello, Happy World!", "cool","");
        break;
      case "Hello, Happy World! powerful":
        filterOn("Hello, Happy World!", "powerful","");
        break;
      case "Hello, Happy World! happy":
        filterOn("Hello, Happy World!", "happy","");
        break;
      case "Hello, Happy World! pure":
        filterOn("Hello, Happy World!", "pure","");
        break;
      case "Afterglow cool":
        filterOn("Afterglow", "cool","");
        break;
      case "Afterglow powerful":
        filterOn("Afterglow", "powerful","");
        break;
      case "Afterglow happy":
        filterOn("Afterglow", "happy","");
        break;
      case "Afterglow pure":
        filterOn("Afterglow", "pure","");
        break;
      case "Poppin'Party ":
        filterOn("Poppin'Party", "","");
        break;
      case "Afterglow ":
        filterOn("Afterglow", "","");
        break;
      case "Hello, Happy World! ":
        filterOn("Hello, Happy World!", "","");
        break;
      case "Roselia ":
        filterOn("Roselia", "","");
        break;
      case "Pastel Palettes ":
        filterOn("Pastel Palettes", "", "");
        break;
      case " powerful":
        filterOn("", "powerful", "");
        break;
      case " pure":
        filterOn("", "pure", "");
        break;
      case " cool":
        filterOn("", "cool", "");
        break;
      case " happy":
        filterOn("", "happy", "");
        break;
      case " 1":
        filterOn("", "", "1");
        break;
      case " 2":
        filterOn("", "", "2");
        break;
      case " 3":
        filterOn("", "", "3");
        break;
      case " 4":
        filterOn("", "", "4");
        break;
      case " powerful1":
        filterOn("", "powerful", "1");
        break;
      case " powerful2":
        filterOn("", "powerful", "2");
        break;
      case " powerful3":
        filterOn("", "powerful", "3");
        break;
      case " powerful4":
        filterOn("", "powerful", "4");
        break;
      case " pure1":
        filterOn("", "pure", "1");
        break;
      case " pure2":
        filterOn("", "pure", "2");
        break;
      case " pure3":
        filterOn("", "pure", "3");
        break;
      case " pure4":
        filterOn("", "pure", "4");
        break;
      case " cool1":
        filterOn("", "cool", "1");
        break;
      case " cool2":
        filterOn("", "cool", "2");
        break;
      case " cool3":
        filterOn("", "cool", "3");
        break;
      case " cool4":
        filterOn("", "cool", "4");
        break;
      case " happy1":
        filterOn("", "happy", "1");
        break;
      case " happy2":
        filterOn("", "happy", "2");
        break;
      case " happy3":
        filterOn("", "happy", "3");
        break;
      case " happy4":
        filterOn("", "happy", "4");
        break;
      case "Poppin'Party 1":
        filterOn("Poppin'Party", "", "1");
        break;
      case "Poppin'Party 2":
        filterOn("Poppin'Party", "", "2");
        break;
      case "Poppin'Party 3":
        filterOn("Poppin'Party", "", "3");
        break;
      case "Poppin'Party 4":
        filterOn("Poppin'Party", "", "4");
        break;
      case "Hello, Happy World! 1":
        filterOn("Hello, Happy World!", "", "1");
        break;
      case "Hello, Happy World! 2":
        filterOn("Hello, Happy World!", "", "2");
        break;
      case "Hello, Happy World! 3":
        filterOn("Hello, Happy World!", "", "3");
        break;
      case "Hello, Happy World! 4":
        filterOn("Hello, Happy World!", "", "4");
        break;
      case "Pastel Palettes 1":
        filterOn("Pastel Palettes", "", "1");
        break;
      case "Pastel Palettes 2":
        filterOn("Pastel Palettes", "", "2");
        break;
      case "Pastel Palettes 3":
        filterOn("Pastel Palettes", "", "3");
        break;
      case "Pastel Palettes 4":
        filterOn("Pastel Palettes", "", "4");
        break;
      case "Roselia 1":
        filterOn("Roselia", "", "1");
        break;
      case "Roselia 2":
        filterOn("Roselia", "", "2");
        break;
      case "Roselia 3":
        filterOn("Roselia", "", "3");
        break;
      case "Roselia 4":
        filterOn("Roselia", "", "4");
        break;
      case "Afterglow 1":
        filterOn("Afterglow", "", "1");
        break;
      case "Afterglow 2":
        filterOn("Afterglow", "", "2");
        break;
      case "Afterglow 3":
        filterOn("Afterglow", "", "3");
        break;
      case "Afterglow 4":
        filterOn("Afterglow", "", "4");
        break;
      case "Poppin'Party powerful1":
        filterOn("Poppin'Party", "powerful", "1");
        break;
      case "Poppin'Party powerful2":
        filterOn("Poppin'Party", "powerful", "2");
        break;
      case "Poppin'Party powerful3":
        filterOn("Poppin'Party", "powerful", "3");
        break;
      case "Poppin'Party powerful4":
        filterOn("Poppin'Party", "powerful", "4");
        break;
      case "Poppin'Party pure1":
        filterOn("Poppin'Party", "pure", "1");
        break;
      case "Poppin'Party pure2":
        filterOn("Poppin'Party", "pure", "2");
        break;
      case "Poppin'Party pure3":
        filterOn("Poppin'Party", "pure", "3");
        break;
      case "Poppin'Party pure4":
        filterOn("Poppin'Party", "pure", "4");
        break;
      case "Poppin'Party cool1":
        filterOn("Poppin'Party", "cool", "1");
        break;
      case "Poppin'Party cool2":
        filterOn("Poppin'Party", "cool", "2");
        break;
      case "Poppin'Party cool3":
        filterOn("Poppin'Party", "cool", "3");
        break;
      case "Poppin'Party cool4":
        filterOn("Poppin'Party", "cool", "4");
        break;
      case "Poppin'Party happy1":
        filterOn("Poppin'Party", "happy", "1");
        break;
      case "Poppin'Party happy2":
        filterOn("Poppin'Party", "happy", "2");
        break;
      case "Poppin'Party happy3":
        filterOn("Poppin'Party", "happy", "3");
        break;
      case "Poppin'Party happy4":
        filterOn("Poppin'Party", "happy", "4");
        break;
      case "Hello, Happy World! powerful1":
        filterOn("Hello, Happy World!", "powerful", "1");
      break;
      case "Hello, Happy World! powerful2":
        filterOn("Hello, Happy World!", "powerful", "2");
        break;
      case "Hello, Happy World! powerful3":
        filterOn("Hello, Happy World!", "powerful", "3");
        break;
      case "Hello, Happy World! powerful4":
        filterOn("Hello, Happy World!", "powerful", "4");
        break;
      case "Hello, Happy World! pure1":
        filterOn("Hello, Happy World!", "pure", "1");
        break;
      case "Hello, Happy World! pure2":
        filterOn("Hello, Happy World!", "pure", "2");
        break;
      case "Hello, Happy World! pure3":
        filterOn("Hello, Happy World!", "pure", "3");
        break;
      case "Hello, Happy World! pure4":
        filterOn("Hello, Happy World!", "pure", "4");
        break;
      case "Hello, Happy World! cool1":
        filterOn("Hello, Happy World!", "cool", "1");
        break;
      case "Hello, Happy World! cool2":
        filterOn("Hello, Happy World!", "cool", "2");
        break;
      case "Hello, Happy World! cool3":
        filterOn("Hello, Happy World!", "cool", "3");
        break;
      case "Hello, Happy World! cool4":
        filterOn("Hello, Happy World!", "cool", "4");
        break;
      case "Hello, Happy World! happy1":
        filterOn("Hello, Happy World!", "happy", "1");
        break;
      case "Hello, Happy World! happy2":
        filterOn("Hello, Happy World!", "happy", "2");
        break;
      case "Hello, Happy World! happy3":
        filterOn("Hello, Happy World!", "happy", "3");
        break;
      case "Hello, Happy World! happy4":
        filterOn("Hello, Happy World!", "happy", "4");
        break;
      case "Pastel Palettes powerful1":
        filterOn("Pastel Palettes", "powerful", "1");
        break;
      case "Pastel Palettes powerful2":
        filterOn("Pastel Palettes", "powerful", "2");
        break;
      case "Pastel Palettes powerful3":
        filterOn("Pastel Palettes", "powerful", "3");
        break;
      case "Pastel Palettes powerful4":
        filterOn("Pastel Palettes", "powerful", "4");
        break;
      case "Pastel Palettes pure1":
        filterOn("Pastel Palettes", "pure", "1");
        break;
      case "Pastel Palettes pure2":
        filterOn("Pastel Palettes", "pure", "2");
        break;
      case "Pastel Palettes pure3":
        filterOn("Pastel Palettes", "pure", "3");
        break;
      case "Pastel Palettes pure4":
        filterOn("Pastel Palettes", "pure", "4");
        break;
      case "Pastel Palettes cool1":
        filterOn("Pastel Palettes", "cool", "1");
        break;
      case "Pastel Palettes cool2":
        filterOn("Pastel Palettes", "cool", "2");
        break;
      case "Pastel Palettes cool3":
        filterOn("Pastel Palettes", "cool", "3");
        break;
      case "Pastel Palettes cool4":
        filterOn("Pastel Palettes", "cool", "4");
        break;
      case "Pastel Palettes happy1":
        filterOn("Pastel Palettes", "happy", "1");
        break;
      case "Pastel Palettes happy2":
        filterOn("Pastel Palettes", "happy", "2");
        break;
      case "Pastel Palettes happy3":
        filterOn("Pastel Palettes", "happy", "3");
        break;
      case "Pastel Palettes happy4":
        filterOn("Pastel Palettes", "happy", "4");
        break;
      case "Roselia powerful1":
        filterOn("Roselia", "powerful", "1");
        break;
      case "Roselia powerful2":
        filterOn("Roselia", "powerful", "2");
        break;
      case "Roselia powerful3":
        filterOn("Roselia", "powerful", "3");
        break;
      case "Roselia powerful4":
        filterOn("Roselia", "powerful", "4");
        break;
      case "Roselia pure1":
        filterOn("Roselia", "pure", "1");
        break;
      case "Roselia pure2":
        filterOn("Roselia", "pure", "2");
        break;
      case "Roselia pure3":
        filterOn("Roselia", "pure", "3");
        break;
      case "Roselia pure4":
        filterOn("Roselia", "pure", "4");
        break;
      case "Roselia cool1":
        filterOn("Roselia", "cool", "1");
        break;
      case "Roselia cool2":
        filterOn("Roselia", "cool", "2");
        break;
      case "Roselia cool3":
        filterOn("Roselia", "cool", "3");
        break;
      case "Roselia cool4":
        filterOn("Roselia", "cool", "4");
        break;
      case "Roselia happy1":
        filterOn("Roselia", "happy", "1");
        break;
      case "Roselia happy2":
        filterOn("Roselia", "happy", "2");
        break;
      case "Roselia happy3":
        filterOn("Roselia", "happy", "3");
        break;
      case "Roselia happy4":
        filterOn("Roselia", "happy", "4");
        break;
      case "Afterglow powerful1":
        filterOn("Afterglow", "powerful", "1");
        break;
      case "Afterglow powerful2":
        filterOn("Afterglow", "powerful", "2");
        break;
      case "Afterglow powerful3":
        filterOn("Afterglow", "powerful", "3");
        break;
      case "Afterglow powerful4":
        filterOn("Afterglow", "powerful", "4");
        break;
      case "Afterglow pure1":
        filterOn("Afterglow", "pure", "1");
        break;
      case "Afterglow pure2":
        filterOn("Afterglow", "pure", "2");
        break;
      case "Afterglow pure3":
        filterOn("Afterglow", "pure", "3");
        break;
      case "Afterglow pure4":
        filterOn("Afterglow", "pure", "4");
        break;
      case "Afterglow cool1":
        filterOn("Afterglow", "cool", "1");
        break;
      case "Afterglow cool2":
        filterOn("Afterglow", "cool", "2");
        break;
      case "Afterglow cool3":
        filterOn("Afterglow", "cool", "3");
        break;
      case "Afterglow cool4":
        filterOn("Afterglow", "cool", "4");
        break;
      case "Afterglow happy1":
        filterOn("Afterglow", "happy", "1");
        break;
      case "Afterglow happy2":
        filterOn("Afterglow", "happy", "2");
        break;
      case "Afterglow happy3":
        filterOn("Afterglow", "happy", "3");
        break;
      case "Afterglow happy4":
        filterOn("Afterglow", "happy", "4");
        break;
      case "reset":
        filterClicked = false;
        setState(() {});
        break;
      case "":
        break;
    }
  }

  void filterOn(String band, String attribute, String rarity) {
    filteredCards.clear();
    filterClicked = true;
    searchFilter = false;
    for (CharacterCard card in widget.cards) {
      if (rarity != "" && band != "" && attribute == "") {
        if (card.band == band && card.rarity == rarity) {
          filteredCards.add(card);
        }
      } else if (rarity != "" && band == "" && attribute != "") {
        if (card.attribute == attribute && card.rarity == rarity) {
          filteredCards.add(card);
        }
      } else if (rarity == "" && band != "" && attribute != "") {
        if (card.attribute == attribute && card.band == band) {
          filteredCards.add(card);
        }
      } else if (band == "" && attribute == "") {
        if (card.rarity == rarity) {
          filteredCards.add(card);
        }
      } else if (band == "" && rarity == "") {
        if (card.attribute == attribute) {
          filteredCards.add(card);
        }
      } else if (rarity == "" && attribute == "") {
        if (card.band == band) {
          filteredCards.add(card);
        }
      } else if (rarity != "" && attribute != "" && band != ""){
        if (card.rarity == rarity && card.band == band && card.attribute == attribute) {
          filteredCards.add(card);
        }
      }
    }
    setState(() {_scrollController.jumpTo(0);});
  }

  void filterSearchResults(String query) {
    filterClicked = false;
    searchFilter = true;
    List<dynamic> searchList = List<dynamic>();
    searchList.addAll(widget.cards);
    if(query.isNotEmpty) {
      searchedListData.clear();
      searchList.forEach((item) {
        if(item.toString().contains(query)) {
          searchedListData.add(item);
        }
      });
      setState(() {_scrollController.jumpTo(0);});
      return;
    } else {
      setState(() {
        searchFilter = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _cardsLength = widget.cards.length;
    if (filterClicked) {
      _cardsLength = filteredCards.length;
    }
    if (searchFilter){
      _cardsLength = searchedListData.length;
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          _scrollController.animateTo(0, duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 4.0, left: 7.0, right: 7.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        onChanged: (value) {
                          filterSearchResults(value);
                        },
                        style: const TextStyle(height: 1),
                        decoration: const InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            labelText: "输入角色名",
                            border: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(20.0)))
                        ),
                      ),
                    )
                ),
                IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {
                      cardFilter();
                    }
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemExtent: 70,
                  itemCount: _cardsLength,
                  itemBuilder: (BuildContext context, int index) {
                    if (filterClicked) {
                      CharacterCard card = filteredCards[index];
                      return CardTile(card);
                    }
                    if (searchFilter){
                      CharacterCard card = searchedListData[index];
                      return CardTile(card);
                    }
                    CharacterCard card = widget.cards[index];
                    return CardTile(card);
                  }
              ),
            )

          ],
        ),
      ),
    );
  }

}