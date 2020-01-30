import 'package:flutter/material.dart';
import 'Song.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// create band icon for specific song
class BandIcon extends StatelessWidget{

  final Song song;

  BandIcon({Key key, @required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /// if the band is not those 5 traditional bands -> leave it blank
    if (song.band != "Afterglow" &&
        song.band != "Poppin'Party" &&
        song.band != "Roselia" &&
        song.band != "Hello, Happy World!" &&
        song.band != "Pastel Palettes") {
      return SizedBox(width: 0.0);
    }

    return Container(
      padding: EdgeInsets.only(left: 5),
      width: 35,
      child: SvgPicture.asset("assets/images/icons/" + song.band + ".svg",height: 40,),
    );
  }
}