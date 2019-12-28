import 'package:flutter/material.dart';
import 'Card.dart';
import 'cardFilterDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'Event.dart';


class EventPageContent extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<EventPageContent>{

  List<dynamic> events = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 7.0, right: 7.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      labelText: "输入活动名"
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.arrow_upward),
                  onPressed: () {

                  }
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: StreamBuilder(
              stream: Firestore.instance.collection("Event").snapshots(),
              builder: (context, snapshot) {

                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    events = snapshot.data.documents.map((DocumentSnapshot document) {
                      return new Event.fromMap(document);
                    }).toList();
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemExtent: 160,
                        itemCount: events.length,
                        itemBuilder: (BuildContext context, int index) {
                          Event event = events[index];
                          return EventTile(event);
                        }
                    );
                }
              },
            ),
          )

        ],
      ),
    );
  }
}

class EventTile extends StatelessWidget {

  final Event event;

  EventTile(this.event);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
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
    );
  }
}
