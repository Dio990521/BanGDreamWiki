import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Event.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventDetailedPage extends StatefulWidget {

  // Declare a field that holds the card.
  final Event event;
  EventDetailedPage({Key key, @required this.event}) : super(key: key);

  @override
  _State createState() => new _State();
}

class _State extends State<EventDetailedPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("活动详情",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}