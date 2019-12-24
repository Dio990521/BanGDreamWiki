
import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/cardClass/RarityFourCard.dart';
import 'cardClass/Card.dart';
import 'cardFilterDialog.dart';

class CardPageContent extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<CardPageContent>{

  String _option = "";

  final cards = [
    new RarityFourCard("https://bestdori.com/assets/jp/thumb/chara/card00000_rip/res005004_after_training.png",
        "Arisa", "Popinpa", "可愛いともだち", "permanent", "cool",
        "750 Life Recovery & Score Boost 40%", "1",
        "https://bestdori.com/assets/jp/thumb/chara/card00000_rip/res005004_normal.png",
        "2"),
    new RarityFourCard("https://bestdori.com/assets/jp/thumb/chara/card00015_rip/res005036_after_training.png",
        "Arisa", "Popinpa", "満開の桜の下で", "permanent", "cool",
        "Note Boost (L) & Score Boost 40%", "1",
        "https://bestdori.com/assets/jp/thumb/chara/card00015_rip/res005036_normal.png",
        "2"),
    new RarityFourCard("https://bestdori.com/assets/jp/thumb/chara/card00014_rip/res005035_after_training.png",
        "Arisa", "Popinpa", "みんながいたから", "permanent", "power",
        "Score Boost 100%", "1",
        "https://bestdori.com/assets/jp/thumb/chara/card00014_rip/res005035_normal.png",
        "2")
  ];
  
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
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemExtent: 70,
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return CardTile(cards[index]);
              }

          ),
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
            child: Image.asset(card.getStarAssetPath()),
          ),
          Container(
            width: 60,
            height: 60,
            child: Image.network(card.imageURL1)
            ),
          Container(
            width: 60,
            height: 60,
            child: Image.network(card.getImageURL2()),
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


