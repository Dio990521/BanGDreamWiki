import 'package:flutter/material.dart';

class SongFilterDialog extends StatefulWidget {
  @override
  _SongFilterDialog createState() => _SongFilterDialog();
}

class _SongFilterDialog extends State<SongFilterDialog> {

  int group = 0;
  int group2 = 0;

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
          Row(
            children: <Widget>[
              Text(
                "    类型  ",
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
          Padding(
            child: Text("原创曲",style: TextStyle(fontWeight: FontWeight.bold),),
            padding: EdgeInsets.only(left: 14,top: 12),
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
            child: Text("翻唱曲",style: TextStyle(fontWeight: FontWeight.bold),),
            padding: EdgeInsets.only(left: 4,top: 12,right: 4),
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
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SimpleDialogOption(
            child: Icon(Icons.check_circle,color: Colors.blueAccent,),
            onPressed: () {
              String options = bandOption(group);
              options = options +  " " + typeOption(group2);
              print(options);
              Navigator.pop(context, options);
            },
          ),
          SimpleDialogOption(
            child: Icon(Icons.cancel,color: Colors.blueAccent,),
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

  String typeOption(int group2) {
    switch (group2) {
      case 0:
        return "";
      case 1:
        return "original";
      default:
        return "cover";
    }
  }
}