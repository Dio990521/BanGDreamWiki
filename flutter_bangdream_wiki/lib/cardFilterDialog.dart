import 'package:flutter/material.dart';

class CardFilterDialog extends StatefulWidget {
  @override
  _CardFilterDialog createState() => _CardFilterDialog();
}

class _CardFilterDialog extends State<CardFilterDialog> {

  int group = 1;
  int group2 = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SimpleDialog(
        title: Text(
          "按类别筛选",
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold
          ),
        ),
        children: <Widget>[
          Padding(
            child: Text(
              "乐队  " + "----------------------------------------------" ,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent,),
              overflow: TextOverflow.visible,
            ),
            padding: EdgeInsets.only(left: 10),
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
                  print(T);
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
                  print(T);
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
                  print(T);
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
                  print(T);
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
                  print(T);
                  setState(() {
                    group = T;
                  });
                },
              ),
            ],
          ),

          Padding(
            child: Text(
              "属性  " + "----------------------------------------------" ,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent,),
              overflow: TextOverflow.visible,
            ),
            padding: EdgeInsets.only(left: 10),
          ),
          Wrap(
            children: <Widget>[
              Padding(
                child: Image.asset(
                  "assets/images/attribute/power.png",
                  height: 20,
                  width: 40,
                ),
                padding: EdgeInsets.only(left: 16,top: 13),
              ),

              Radio(
                value: 1,
                groupValue: group2,
                onChanged: (T) {
                  print(T);
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
                  print(T);
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
                  print(T);
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
                  print(T);
                  setState(() {
                    group2 = T;
                  });
                },
              ),
            ],
          ),
          SimpleDialogOption(
            child: Text(
              "< 确定 >",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              String options = bandOption(group);
              options = options +  " " + attributeOption(group2);
              Navigator.pop(context, options);
            },
          ),
        ]
    );
  }

  String bandOption(int group) {
    switch (group) {
      case 1:
        return "ppp";
      case 2:
        return "rsl";
      case 3:
        return "pp";
      case 4:
        return "afg";
      default:
        return "hhw";
    }
  }

  String attributeOption(int group2) {
    switch (group2){
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
}