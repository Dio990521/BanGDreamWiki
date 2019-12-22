import 'package:flutter_bangdream_wiki/cardClass/Card.dart';

class RarityTwoCard extends CharacterCard {

  static String starAssetPath = "assets/images/rarity/2.png";
  static int rarity = 2;

  @override
  String getStarAssetPath() => starAssetPath;

  @override
  int getRarity() => rarity;

  RarityTwoCard(
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