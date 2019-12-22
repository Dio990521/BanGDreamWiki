import 'package:flutter_bangdream_wiki/cardClass/Card.dart';

class RarityOneCard extends CharacterCard {

  static String starAssetPath = "assets/images/rarity/1.png";
  static int rarity = 1;

  @override
  String getStarAssetPath() => starAssetPath;

  @override
  int getRarity() => rarity;

  RarityOneCard(
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