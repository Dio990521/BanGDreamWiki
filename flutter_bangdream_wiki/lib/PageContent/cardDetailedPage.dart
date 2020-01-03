
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Card.dart';

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
          Expanded(
            child: PageView.builder(
                controller: controller,
                itemCount: images.length,
                itemBuilder: (context, position) {
                  return imageSlider(position);
                }
            ),
          ),
          Container(
            height: 400,
            color: Colors.blueAccent,
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
        child: CachedNetworkImage(
          imageUrl: images[index],
          fit: BoxFit.fill,
          placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
          errorWidget: (context, url, error) => Icon(Icons.error)
        ),
      ),
    );
  }
}