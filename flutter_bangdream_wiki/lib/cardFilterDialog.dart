import 'package:flutter/material.dart';

/// Filter for cards
/// There are 3 groups you can choose
class CardFilterDialog extends StatefulWidget {

  @override
  _CardFilterDialog createState() => _CardFilterDialog();

}

class _CardFilterDialog extends State<CardFilterDialog> {

  int group = 0;
  int group2 = 0;
  int group3 = 0;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Text(
          "按类别筛选",
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold
          ),
        ),
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "    乐队  ",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent,),
                overflow: TextOverflow.visible,
              ),
              Expanded(
                child: Container(
                  height: 1,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          Wrap(
            children: <Widget>[
              Padding(
                child: Image.asset(
                  "assets/images/bandLogo/Poppinparty_logo.png",
                  height: 45,
                  width: 50,
                ),
                padding: EdgeInsets.only(left: 6),
              ),

              Radio(
                value: 1,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
              Padding(
                child: Image.asset(
                  "assets/images/bandLogo/Roselia_logo.png",
                  height: 45,
                  width: 50,
                ),
                padding: EdgeInsets.only(left: 0),
              ),
              Radio(
                value: 2,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
              Padding(
                child: Image.asset(
                  "assets/images/bandLogo/Pastelpalettes_logo.png",
                  height: 45,
                  width: 50,
                ),
                padding: EdgeInsets.only(left: 0),
              ),
              Radio(
                value: 3,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
              Padding(
                child: Image.asset(
                  "assets/images/bandLogo/Afterglow_logo.png",
                  height: 45,
                  width: 50,
                ),
                padding: EdgeInsets.only(left: 6),
              ),
              Radio(
                value: 4,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
              Padding(
                child: Image.asset(
                  "assets/images/bandLogo/Hellohappyworld_logo.png",
                  height: 45,
                  width: 50,
                ),
                padding: EdgeInsets.only(left: 0),
              ),
              Radio(
                value: 5,
                groupValue: group,
                onChanged: (T) {
                  setState(() {
                    group = T;
                  });
                },
              ),
            ],
          ),

          Row(
            children: <Widget>[
              Text(
                "    属性  ",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent,),
                overflow: TextOverflow.visible,
              ),
              Expanded(
                child: Container(
                  height: 1,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          Wrap(
            children: <Widget>[
              Padding(
                child: Image.asset(
                  "assets/images/attribute/powerful.png",
                  height: 20,
                  width: 40,
                ),
                padding: EdgeInsets.only(left: 16,top: 13),
              ),

              Radio(
                value: 1,
                groupValue: group2,
                onChanged: (T) {
                  setState(() {
                    group2 = T;
                  });
                },
              ),
              Padding(
                child: Image.asset(
                  "assets/images/attribute/cool.png",
                  height: 20,
                  width: 45,
                ),
                padding: EdgeInsets.only(left: 5,top: 14),
              ),
              Radio(
                value: 2,
                groupValue: group2,
                onChanged: (T) {
                  setState(() {
                    group2 = T;
                  });
                },
              ),
              Padding(
                child: Image.asset(
                  "assets/images/attribute/pure.png",
                  height: 20,
                  width: 45,
                ),
                padding: EdgeInsets.only(left: 5,top: 14),
              ),
              Radio(
                value: 3,
                groupValue: group2,
                onChanged: (T) {
                  setState(() {
                    group2 = T;
                  });
                },
              ),
              Padding(
                child: Image.asset(
                  "assets/images/attribute/happy.png",
                  height: 20,
                  width: 40,
                ),
                padding: EdgeInsets.only(left: 16,top: 13),
              ),
              Radio(
                value: 4,
                groupValue: group2,
                onChanged: (T) {
                  setState(() {
                    group2 = T;
                  });
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "    稀有度  ",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent,),
                overflow: TextOverflow.visible,
              ),
              Expanded(
                child: Container(
                  height: 1,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          Wrap(
            children: <Widget>[
              Padding(
                child: Container(
                  width: 20,
                  height: 20,
                  child: RotationTransition(
                      turns: AlwaysStoppedAnimation(270 / 360),
                      child: Image.asset("assets/images/rarity/1.png")
                  ),
                ),
                padding: EdgeInsets.only(left: 28,top: 15,right: 8),
              ),

              Radio(
                value: 1,
                groupValue: group3,
                onChanged: (T) {
                  setState(() {
                    group3 = T;
                  });
                },
              ),
              Padding(
                child: Container(
                  width: 38,
                  height: 38,
                  child: RotationTransition(
                      turns: AlwaysStoppedAnimation(270 / 360),
                      child: Image.asset("assets/images/rarity/2.png")
                  ),
                ),
                padding: EdgeInsets.only(left: 8,top: 5,right: 5),
              ),
              Radio(
                value: 2,
                groupValue: group3,
                onChanged: (T) {
                  setState(() {
                    group3 = T;
                  });
                },
              ),
              Padding(
                child: Container(
                  width: 50,
                  height: 45,
                  child: RotationTransition(
                      turns: AlwaysStoppedAnimation(270 / 360),
                      child: Image.asset("assets/images/rarity/3.png")
                  ),
                ),
                padding: EdgeInsets.only(left: 0,top: 2,right: 0),
              ),
              Radio(
                value: 3,
                groupValue: group3,
                onChanged: (T) {
                  setState(() {
                    group3 = T;
                  });
                },
              ),
              Padding(
                child: Container(
                  width: 40,
                  height: 45,
                  child: RotationTransition(
                      turns: AlwaysStoppedAnimation(270 / 360),
                      child: Image.asset("assets/images/rarity/4.png")
                  ),
                ),
                padding: EdgeInsets.only(left: 16,top: 0),
              ),
              Radio(
                value: 4,
                groupValue: group3,
                onChanged: (T) {
                  setState(() {
                    group3 = T;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SimpleDialogOption(
                child: Icon(Icons.check,color: Colors.blueAccent,),
                onPressed: () {
                  String options = bandOption(group);
                  options = options +  " " + 
                      attributeOption(group2) + rarityOption(group3);
                  Navigator.pop(context, options);
                },
              ),
              SimpleDialogOption(
                child: Icon(Icons.refresh,color: Colors.blueAccent,),
                onPressed: () {
                  Navigator.pop(context, "reset");
                },
              )
            ],
          ),
        ]
    );
  }

  String bandOption(int group) {
    switch (group) {
      case 0:
        return "";
      case 1:
        return "Poppin'Party";
      case 2:
        return "Roselia";
      case 3:
        return "Pastel Palettes";
      case 4:
        return "Afterglow";
      default:
        return "Hello, Happy World!";
    }
  }

  String attributeOption(int group2) {
    switch (group2){
      case 0:
        return "";
      case 1:
        return "powerful";
      case 2:
        return "cool";
      case 3:
        return "pure";
      default:
        return "happy";
    }
  }

  String rarityOption(int group3) {
    switch (group3){
      case 0:
        return "";
      case 1:
        return "1";
      case 2:
        return "2";
      case 3:
        return "3";
      default:
        return "4";
    }
  }
}