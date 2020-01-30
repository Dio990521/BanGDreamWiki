import 'package:cloud_firestore/cloud_firestore.dart';

/// Card class
/// store all data here
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
  String attributeAssetPath;
  String starAssetPath;
  String rarity;
  String cardImageURL1;
  String cardImageURL2;
  String charaIconPath;
  int id;
  String bandIconPath;

  /// special constructor for firestore only
  CharacterCard.fromMap(DocumentSnapshot map){
    this.character = map["character"];
    this.band = map["band"];
    this.title =  map["title"];
    this.type = map["type"];
    this.attribute = map["attribute"];
    this.skill = map["skill"];
    this.event = map["event"];
    this.imageURL1 = map["imageURL1"];
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
        this.attributeAssetPath = "assets/images/attribute/powerful.png";
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
    switch (character) {
      case "上原绯玛丽":
        this.charaIconPath = "assets/charaIcons/symfl.png";
        break;
      case "丸山彩":
        this.charaIconPath = "assets/charaIcons/wsc.png";
        break;
      case "今井莉莎":
        this.charaIconPath = "assets/charaIcons/jjls.png";
        break;
      case "冰川日菜":
        this.charaIconPath = "assets/charaIcons/bcrc.png";
        break;
      case "冰川纱夜":
        this.charaIconPath = "assets/charaIcons/bcsy.png";
        break;
      case "凑友希那":
        this.charaIconPath = "assets/charaIcons/cyxn.png";
        break;
      case "北泽育美":
        this.charaIconPath = "assets/charaIcons/bzym.png";
        break;
      case "大和麻弥":
        this.charaIconPath = "assets/charaIcons/dhmm.png";
        break;
      case "奥泽美咲":
        this.charaIconPath = "assets/charaIcons/azmx.png";
        break;
      case "宇田川亚子":
        this.charaIconPath = "assets/charaIcons/ytcyz.png";
        break;
      case "宇田川巴":
        this.charaIconPath = "assets/charaIcons/ytcb.png";
        break;
      case "山吹沙绫":
        this.charaIconPath = "assets/charaIcons/scsl.png";
        break;
      case "市谷有咲":
        this.charaIconPath = "assets/charaIcons/sgyx.png";
        break;
      case "弦卷心":
        this.charaIconPath = "assets/charaIcons/xjx.png";
        break;
      case "户山香澄":
        this.charaIconPath = "assets/charaIcons/hsxc.png";
        break;
      case "松原花音":
        this.charaIconPath = "assets/charaIcons/syhy.png";
        break;
      case "濑田薰":
        this.charaIconPath = "assets/charaIcons/ltx.png";
        break;
      case "牛込里美":
        this.charaIconPath = "assets/charaIcons/nylm.png";
        break;
      case "白金燐子":
        this.charaIconPath = "assets/charaIcons/bjlz.png";
        break;
      case "白鹭千圣":
        this.charaIconPath = "assets/charaIcons/blqs.png";
        break;
      case "美竹兰":
        this.charaIconPath = "assets/charaIcons/mzl.png";
        break;
      case "羽泽鸫":
        this.charaIconPath = "assets/charaIcons/yzd.png";
        break;
      case "花园多惠":
        this.charaIconPath = "assets/charaIcons/hydh.png";
        break;
      case "若宫伊芙":
        this.charaIconPath = "assets/charaIcons/rgyf.png";
        break;
      case "青叶摩卡":
        this.charaIconPath = "assets/charaIcons/qymk.png";
        break;
    }
    switch (band) {
      case "Afterglow":
        this.bandIconPath = "assets/images/icons/Afterglow.svg";
        break;
      case "Roselia":
        this.bandIconPath = "assets/images/icons/Roselia.svg";
        break;
      case "Poppin'Party":
        this.bandIconPath = "assets/images/icons/Poppin'Party.svg";
        break;
      case "Pastel Palettes":
        this.bandIconPath = "assets/images/icons/PastelPalettes.svg";
        break;
      case "Hello, Happy World!":
        this.bandIconPath = "assets/images/icons/HelloHappyWorld.svg";
        break;
    }
  }

  @override
  String toString() {
    return character;
  }
}
