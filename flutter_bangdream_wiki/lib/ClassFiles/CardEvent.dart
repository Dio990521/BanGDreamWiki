import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Event.dart';
import 'package:flutter_bangdream_wiki/PageContent/eventDetailedPage.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// show the event info of the card
class CardEvent extends StatelessWidget{

  final String event;
  CardEvent({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (event == null) {
      return Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Center(
          child: Text("无活动信息"),
        ),
      );
    }
    return StreamBuilder(
        stream: Firestore.instance.collection("Event").document(event).snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              Event currentEvent = Event.fromMap(snapshot.data);
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventDetailedPage(event: currentEvent),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: CachedNetworkImage(
                      imageUrl: currentEvent.imageURL,
                      fit: BoxFit.fill,
                    ),
                  )
              );
          }
        }
    );
  }
}