import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Card.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardGrid extends StatefulWidget{
  final CharacterCard card;
  CardGrid({Key key, @required this.card}) : super(key: key);
  @override
  _State createState() => new _State();
}

class _State extends State<CardGrid>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: 3),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: widget.card.imageURL1,
        ),
      ),
    );
  }
}