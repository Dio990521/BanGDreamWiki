import 'package:flutter/material.dart';
import 'Song.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BandIcon extends StatelessWidget{

  final Song song;


  BandIcon(this.song);

  @override
  Widget build(BuildContext context) {
    if (song.band != "Afterglow" &&
        song.band != "Poppin'Party" &&
        song.band != "Roselia" &&
        song.band != "Hello, Happy World!" &&
        song.band != "Pastel Palettes") {
      return SizedBox(width: 0.0);
    }
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 5),
      width: 35,
      child: SvgPicture.asset("assets/images/icons/" + song.band + ".svg",height: 40,),
    );
  }
}