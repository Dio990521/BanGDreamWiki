import 'package:flutter_bangdream_wiki/cardClass/Card.dart';

class RarityThreeCard extends CharacterCard {

  String imageURL2;
  static String starAssetPath = "assets/images/rarity/3.png";
  static int rarity = 3;

  @override
  String getStarAssetPath() => starAssetPath;

  @override
  int getRarity() => rarity;

  @override
  String getImageURL2() => this.imageURL2;

  RarityThreeCard(
      this.imageURL2,
      String character,
      String band,
      String title,
      String type,
      String attribute,
      String skill,
      String event,
      String imageURL1,
      String gacha) : super (
      character,
      band,
      title,
      type,
      attribute,
      skill,
      event,
      imageURL1,
      gacha);


}