import 'package:flutter/material.dart';
import 'Comic.dart';
import 'package:flutter_bangdream_wiki/PageContent/comicDetailedPage.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// comic shows in GridView
class ComicGrid extends StatelessWidget{

  final Comic comic;
  ComicGrid({Key key, @required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ComicDetailedPage(comic: comic),
          ),
        );
      },
      child: Card(
          child: Padding(
            padding: EdgeInsets.only(top: 3),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: comic.imageURL1,
            ),
          )
      ),
    );
  }
}