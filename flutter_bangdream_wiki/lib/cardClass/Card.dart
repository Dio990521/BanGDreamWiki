class CharacterCard {

  String character;
  String band;
  String title;
  String type;
  String attribute;
  String skill;
  String event;
  String imageURL1;
  String gacha;
  String attributeAssetPath;

  String getStarAssetPath() => "";

  int getRarity() => 0;

  String getImageURL2() => null;

  CharacterCard(String character, String band, String title, String type, String attribute, String skill, String event, String imageURL1, String gacha) {
    this.character = character;
    this.band = band;
    this.title = title;
    this.type = type;
    this.attribute = attribute;
    this.skill = skill;
    this.event = event;
    this.imageURL1 = imageURL1;
    this.gacha = gacha;
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
}