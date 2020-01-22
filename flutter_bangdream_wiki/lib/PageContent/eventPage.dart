import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'EventPageContent.dart';
import '../ClassFiles/Event.dart';


class EventPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder(
      stream: Firestore.instance.collection("Event").snapshots(),
      builder: (context, snapshot) {

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            List<dynamic> events = snapshot.data.documents.map((DocumentSnapshot document) {
              return new Event.fromMap(document);
            }).toList();
            events = events.reversed.toList();
            return EventPageContent(events: events,);
        }
      },
    );
  }
}


