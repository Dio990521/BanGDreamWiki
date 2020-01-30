import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bangdream_wiki/PageContent/songDetailedPage.dart';
import 'Song.dart';

/// SongGrid layout class for GridView
class SongGrid extends StatelessWidget {

  final Song song;

  SongGrid({Key key, @required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SongDetailedPage(song: song),
          ),
        );
      },
      child: Card(
        color: Colors.lightBlueAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: song.imageURL,
                  ),
                  //SizedBox(height: 5),
                  Expanded(
                      child: Center(
                        child: Text(
                          song.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}