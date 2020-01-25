
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Event.dart';
import 'eventDetailedPage.dart';
import 'package:flutter_bangdream_wiki/PageContent/ImageDetailScreen.dart';

class CardDetailedPage extends StatefulWidget {

  // Declare a field that holds the card.
  final CharacterCard card;
  CardDetailedPage({Key key, @required this.card}) : super(key: key);

  @override
  _State createState() => new _State();
}

class _State extends State<CardDetailedPage>{
  PageController controller = PageController(
      initialPage: 0, viewportFraction: 0.8);
  // In the constructor, require a card.

  List<String> images = List<String> ();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    images.add(widget.card.cardImageURL1);
    if(widget.card.cardImageURL2 != null) {
      images.add(widget.card.cardImageURL2);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text("角色卡详情",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            child: PageView.builder(
                controller: controller,
                itemCount: images.length,
                itemBuilder: (context, position) {
                  return imageSlider(position);
                }
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("标题",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.card.title, style: TextStyle(fontSize: 15),),
                ),
                Divider(),
                ListTile(
                  title: Text("种类",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.card.type, style: TextStyle(fontSize: 15),),
                ),
                Divider(),
                ListTile(
                  title: Text("角色",style: TextStyle(fontWeight: FontWeight.bold,),),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(widget.card.character, style: TextStyle(fontSize: 15),),
                      SizedBox(
                        width: 15,
                      ),
                      Image.asset("assets/images/icons/" + widget.card.character + ".png",height: 40,)
                    ],
                  )
                ),
                Divider(),
                ListTile(
                  title: Text("乐团",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(widget.card.band, style: TextStyle(fontSize: 15),),
                      SizedBox(
                        width: 15,
                      ),
                      SvgPicture.asset("assets/images/icons/" + widget.card.band + ".svg",height: 40,)
                    ],
                  )
                ),
                Divider(),
                ListTile(
                  title: Text("属性",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(widget.card.attribute.toUpperCase(), style: TextStyle(fontSize: 15),),
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Image.asset("assets/images/attribute/" + widget.card.attribute + ".png"),
                      )
                    ],
                  )
                ),
                Divider(),
                ListTile(
                  title: Text("稀有度",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Container(
                    width: 70,
                    child: RotationTransition(
                        turns: AlwaysStoppedAnimation(270 / 360),
                        child: Image.asset("assets/images/rarity/" + widget.card.rarity + ".png")
                    ),
                  )
                ),
                Divider(),
                ListTile(
                  title: Text("技能",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(
                    widget.card.skill,
                    style: TextStyle(fontSize: 15),
                    maxLines: 2,
                    textAlign: TextAlign.right,
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text("活动",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                CardEvent(widget.card.event),
                //CardEvent(widget.card),

              ],
            ),
          )

        ],
      ),
    );
  }

  imageSlider(int index) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, widget) {
        double value = 1;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 230,
            width: Curves.easeInOut.transform(value) * 370,
            child: widget,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ImageDetailScreen(images[index]);
            }));
          },
          child: CachedNetworkImage(
              imageUrl: images[index],
              fit: BoxFit.fill,
              placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
              errorWidget: (context, url, error) => Icon(Icons.error)
          ),
        )
      ),
    );
  }

}

class CardEvent extends StatelessWidget{

  final String event;
  CardEvent(this.event);

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
