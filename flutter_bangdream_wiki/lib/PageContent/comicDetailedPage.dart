import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Comic.dart';

class ComicDetailedPage extends StatefulWidget {

  // Declare a field that holds the card.
  final Comic comic;
  ComicDetailedPage({Key key, @required this.comic}) : super(key: key);

  @override
  _State createState() => new _State();
}

class _State extends State<ComicDetailedPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.comic.title,style: TextStyle(fontWeight: FontWeight.bold),)
      ),
      body: Center(
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: widget.comic.imageURL2,
        ),
      )
    );
  }
}