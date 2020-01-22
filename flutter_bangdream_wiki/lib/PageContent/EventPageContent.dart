import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Event.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/EventTile.dart';


class EventPageContent extends StatefulWidget{

  final List<dynamic> events;
  EventPageContent({Key key, @required this.events}) : super(key: key);


  @override
  _State createState() => new _State();
}

class _State extends State<EventPageContent> {

  List<dynamic> searchedListData = List<dynamic>();

  bool arrowClicked = false;
  bool searchFilter = false;
  bool filterClicked = false;
  int _eventsLength = 0;

  void filterSearchResults(String query) {
    filterClicked = false;
    searchFilter = true;
    List<dynamic> searchList = List<dynamic>();
    searchList.addAll(widget.events);
    if(query.isNotEmpty) {
      searchedListData.clear();
      searchList.forEach((item) {
        if(item.toString().contains(query)) {
          searchedListData.add(item);
        }
      });
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
    _eventsLength = widget.events.length;
    if (searchFilter) {
      _eventsLength = searchedListData.length;
    }
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
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemExtent: 160,
                itemCount: _eventsLength,
                itemBuilder: (BuildContext context, int index) {
                  if(searchFilter) {
                    Event event = searchedListData[index];
                    return EventTile(event);
                  }
                  Event event = widget.events[index];
                  return EventTile(event);
                }
            ),
          )

        ],
      ),
    );
  }
}