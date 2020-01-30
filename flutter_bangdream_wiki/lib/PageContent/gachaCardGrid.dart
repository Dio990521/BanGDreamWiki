import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bangdream_wiki/PageContent/cardDetailedPage.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// gacha card grid
class GachaCardGrid extends StatefulWidget{

  final CharacterCard card;

  GachaCardGrid({Key key, @required this.card}) : super(key: key);

  @override
  _State createState() => new _State();
}

class _State extends State<GachaCardGrid>{

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardDetailedPage(card: widget.card),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.only(top: 3),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: widget.card.imageURL1,
                ),
              ),
            ),
          )
        ),
        Positioned(
          right: 5,
          top: 6,
          child: Image(image: AssetImage(widget.card.attributeAssetPath,),width: 17),
        ),
        Positioned(
          bottom: 4,
          left: 3,
          child: Image(image: AssetImage(widget.card.starAssetPath),width: 12),
        ),
        Positioned(
          top: 5,
          left: 2,
          child: SvgPicture.asset(widget.card.bandIconPath,width: 20,),
        )
      ],
    );
  }
}