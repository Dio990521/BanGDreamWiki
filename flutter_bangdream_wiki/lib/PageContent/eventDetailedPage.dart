import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Event.dart';

class EventDetailedPage extends StatefulWidget {

  // Declare a field that holds the card.
  final Event event;
  EventDetailedPage({Key key, @required this.event}) : super(key: key);

  @override
  _State createState() => new _State();
}

class _State extends State<EventDetailedPage>{

  List<Widget> list = List<Widget> ();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (String name in widget.event.characters) {
      list.add(Image.asset("assets/images/icons/" + name + ".png",height: 40,width: 45,));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("活动详情",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blueAccent,
                      width: 2.0
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(20.0)
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: widget.event.imageURL,
                    height: 130,
                  ),
                )
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("标题",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.event.title, style: TextStyle(fontSize: 15),),
                ),
                Divider(),
                ListTile(
                    title: Text("属性",style: TextStyle(fontWeight: FontWeight.bold),),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset("assets/images/attribute/" + widget.event.attribute + ".png",height: 40,),
                        SizedBox(
                          width: 5,
                        ),
                        Text("+20%", style: TextStyle(fontSize: 15),),
                      ],
                    )
                ),
                Divider(),
                ListTile(
                  title: Text("种类",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.event.type, style: TextStyle(fontSize: 15),),
                ),
                Divider(),
                ListTile(
                  title: Text("角色",style: TextStyle(fontWeight: FontWeight.bold),),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: list
                    )
                ),
                Divider(),
                ListTile(
                  title: Text("开始日期",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.event.startDate, style: TextStyle(fontSize: 15),),
                ),
                Divider(),
                ListTile(
                  title: Text("结束日期",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.event.endDate, style: TextStyle(fontSize: 15),),
                ),
                Divider(),
                ListTile(
                  title: Text("招募信息",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: CachedNetworkImage(
                    imageUrl: widget.event.gachaURL,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.fill,
                  ),
                )
                
              ],
            ),
          )
        ],
      ),
    );
  }
}