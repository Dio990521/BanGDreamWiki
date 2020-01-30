import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/PageContent/eventDetailedPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'Event.dart';

/// EVentTile layout class for ListView
class EventTile extends StatelessWidget {

  final Event event;

  EventTile({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailedPage(event: event),
          ),
        );
      },
      child: Card(
        color: Colors.lightBlueAccent,
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              //height: 50,
              fit: BoxFit.fill,
              imageUrl: event.imageURL,
            ),
            Expanded(
              child: Center(
                child: Text(
                  event.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}