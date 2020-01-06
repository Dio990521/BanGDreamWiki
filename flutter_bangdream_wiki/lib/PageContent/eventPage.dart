import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../ClassFiles/Event.dart';
import 'eventDetailedPage.dart';


class EventPageContent extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<EventPageContent>{

  List<dynamic> events = List<dynamic>();
  List<dynamic> searchedListData = List<dynamic>();

  bool arrowClicked = false;
  bool searchFilter = false;
  bool _reverse = true;
  bool filterClicked = false;
  int _eventsLength = 0;

  void filterSearchResults(String query) {
    filterClicked = false;
    searchFilter = true;
    List<dynamic> searchList = List<dynamic>();
    searchList.addAll(events);
    if(query.isNotEmpty) {
      searchedListData.clear();
      searchList.forEach((item) {
        if(item.toString().contains(query)) {
          searchedListData.add(item);
        }
      });
      print(searchedListData);
      setState(() {});
      return;
    } else {
      setState(() {
        searchFilter = false;
      });
    }
  }

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
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    style: TextStyle(height: 1),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        prefixIcon: Icon(Icons.search),
                        labelText: "输入活动名"
                    ),
                  ),
                )
              ),
              IconButton(
                  icon: Icon(arrowClicked ? Icons.arrow_downward : Icons.arrow_upward),
                  onPressed: () {
                    setState(() {
                      arrowClicked = !arrowClicked;
                      _reverse = !_reverse;
                    });
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
                    _eventsLength = events.length;
                    if (searchFilter){
                      _eventsLength = searchedListData.length;
                    }
                    return SingleChildScrollView(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemExtent: 160,
                          itemCount: _eventsLength,
                          reverse: _reverse,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            if(searchFilter) {
                              Event event = searchedListData[index];
                              return EventTile(event);
                            }
                            Event event = events[index];
                            return EventTile(event);
                          }
                      ),
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
    return InkWell(
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
