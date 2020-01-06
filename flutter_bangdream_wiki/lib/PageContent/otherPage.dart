import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/PageContent/gachaPage.dart';
import 'comicPage.dart';

class OtherPageContent extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<OtherPageContent>{

  List<dynamic> others = ["https://i1.hdslb.com/bfs/game/de43be8ebc6eb030c04dcc0ce7c1733f7fc011ad.jpg"];
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Text("漫画鉴赏"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ComicPageContent(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Text("抽卡模拟"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GachaPageContent(),
                ),
              );
            },
          )

        ],
      ),
    );
  }
  
}
