import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/PageContent/eventDetailedPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'Event.dart';

class EventTile extends StatelessWidget {

  final Event event;

  EventTile(this.event);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              //height: 50,
              fit: BoxFit.fill,
              imageUrl: event.imageURL,
            ),
            Text(
              event.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}