import 'package:flutter/material.dart';
import 'Card.dart';
import 'cardFilterDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';


class EventPageContent extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<EventPageContent>{

  List<Event> events = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemExtent: 70,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return EventTile(events[index]);
        }
    );
  }
}

class EventTile extends StatelessWidget {

  final Event event;

  EventTile(this.event);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
