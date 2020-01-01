import 'package:flutter/material.dart';

class SongFilterDialog extends StatefulWidget {
  @override
  _SongFilterDialog createState() => _SongFilterDialog();
}

class _SongFilterDialog extends State<SongFilterDialog> {

  int group = 1;

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

        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
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
              Navigator.pop(context, options);
            },
          ),
          SimpleDialogOption(
            child: Text(
              "< 重置 >",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
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
}