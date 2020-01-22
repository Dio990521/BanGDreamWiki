import 'Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/PageContent/cardDetailedPage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardTile extends StatelessWidget {
  final CharacterCard card;

  CardTile(this.card);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (card.rarity == "1" || card.rarity == "2") {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CardDetailedPage(card: card),
            ),
          );
        },
        child: Card(
          child: Row(
            children: <Widget>[
              const SizedBox(
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
                  padding: const EdgeInsets.only(left: 0,right: 0,top: 13),
                  child: Column(
                    children: <Widget>[
                      Text(
                        card.title,
                        style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        card.skill,
                        style: const TextStyle(fontSize: 10),
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
                padding: const EdgeInsets.only(right: 3),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
        ),
      );
    }
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardDetailedPage(card: card),
          ),
        );
      },
      child: Card(
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 12,
            ),
            Container(
              width: 25,
              height: 50,
              child: Image.asset(card.starAssetPath),
            ),
            const SizedBox(
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
                padding: const EdgeInsets.only(left: 1,right: 10,top: 13),
                child: Column(
                  children: <Widget>[
                    Text(
                      card.title,
                      style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                      child: Text(
                        card.skill,
                        style: const TextStyle(fontSize: 10),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

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
              padding: const EdgeInsets.only(right: 3),
            ),
            const SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );
  }
}