import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/PageContent/CardPageContent.dart';
import '../ClassFiles/Card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// CardPage gets all cards from firestore
class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection("Card").snapshots(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            List<dynamic> cards = snapshot.data.documents.map((DocumentSnapshot document) {
              return new CharacterCard.fromMap(document);
            }).toList();
            cards = cards.reversed.toList();
            return CardPageContent(cards: cards);
        }
      },
    );
  }
}




