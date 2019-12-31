import 'package:cloud_firestore/cloud_firestore.dart';

class CharacterCard {

  String character;
  String band;
  String title;
  String type;
  String attribute;
  String skill;
  String event;
  String imageURL1;
  String imageURL2;
  String gacha;
  String attributeAssetPath;
  String starAssetPath;
  String rarity;
  String cardImageURL1;
  String cardImageURL2;
  int id;

  CharacterCard.fromMap(DocumentSnapshot map){
    this.character = map["character"];
    this.band = map["band"];
    this.title =  map["title"];
    this.type = map["type"];
    this.attribute = map["attribute"];
    this.skill = map["skill"];
    this.event = map["event"];
    this.imageURL1 = map["imageURL1"];
    this.gacha = map["gacha"];
    this.rarity = map["rarity"];
    this.imageURL2 = map["imageURL2"];
    this.cardImageURL1 = map["cardImageURL1"];
    this.cardImageURL2 = map["cardImageURL2"];
    this.id = int.parse(map["id"]);
    switch (rarity) {
      case "1":
        this.starAssetPath = "assets/images/rarity/1.png";
        break;
      case "2":
        this.starAssetPath = "assets/images/rarity/2.png";
        break;
      case "3":
        this.starAssetPath = "assets/images/rarity/3.png";
        break;
      case "4":
        this.starAssetPath = "assets/images/rarity/4.png";
        break;
    }
    switch (attribute) {
      case "powerful":
        this.attributeAssetPath = "assets/images/attribute/power.png";
        break;
      case "cool":
        this.attributeAssetPath = "assets/images/attribute/cool.png";
        break;
      case "pure":
        this.attributeAssetPath = "assets/images/attribute/pure.png";
        break;
      case "happy":
        this.attributeAssetPath = "assets/images/attribute/happy.png";
        break;
    }
  }

  CharacterCard(String character, String band, String title, String type, String attribute, String skill, String event, String imageURL1, String gacha, String rarity, String imageURL2) {
    this.character = character;
    this.band = band;
    this.title = title;
    this.type = type;
    this.attribute = attribute;
    this.skill = skill;
    this.event = event;
    this.imageURL1 = imageURL1;
    this.gacha = gacha;
    this.rarity = rarity;
    this.imageURL2 = imageURL2;
    switch (rarity) {
      case "1":
        this.starAssetPath = "assets/images/rarity/1.png";
        break;
      case "2":
        this.starAssetPath = "assets/images/rarity/2.png";
        break;
      case "3":
        this.starAssetPath = "assets/images/rarity/3.png";
        break;
      case "4":
        this.starAssetPath = "assets/images/rarity/4.png";
        break;
    }
    switch (attribute) {
      case "power":
        this.attributeAssetPath = "assets/images/attribute/power.png";
        break;
      case "cool":
        this.attributeAssetPath = "assets/images/attribute/cool.png";
        break;
      case "pure":
        this.attributeAssetPath = "assets/images/attribute/pure.png";
        break;
      case "happy":
        this.attributeAssetPath = "assets/images/attribute/happy.png";
        break;
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return title + character;
  }
}
