import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bangdream_wiki/PageContent/ImageDetailScreen.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/CardEvent.dart';

/// When click on one CardTile on CardPage, the detail of that card shows
class CardDetailedPage extends StatefulWidget {

  final CharacterCard card;
  CardDetailedPage({Key key, @required this.card}) : super(key: key);

  @override
  _State createState() => new _State();
}

class _State extends State<CardDetailedPage>{

  PageController controller = PageController(
      initialPage: 0, viewportFraction: 0.8);

  List<String> images = List<String> ();

  /// get images URL first before building page slide widget
  @override
  void initState() {
    super.initState();
    images.add(widget.card.cardImageURL1);
    if(widget.card.cardImageURL2 != null) {
      images.add(widget.card.cardImageURL2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("角色卡详情",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: <Widget>[
          /// slide page to view images
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
                      Image(image: AssetImage(widget.card.charaIconPath),height: 40,)
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
                      SvgPicture.asset(widget.card.bandIconPath,height: 40,)
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
                        child: Image(image: AssetImage("assets/images/attribute/" + widget.card.attribute + ".png")),
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
                        child: Image(image: AssetImage("assets/images/rarity/" + widget.card.rarity + ".png"))
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
                CardEvent(event: widget.card.event,),
                //CardEvent(widget.card),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// slide image
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
              return ImageDetailScreen(imageURL: images[index],);
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


