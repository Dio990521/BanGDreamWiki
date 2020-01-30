import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/BestdoriWebView.dart';
import 'package:flutter_bangdream_wiki/PageContent/InfoPage.dart';
import 'package:flutter_bangdream_wiki/PageContent/gachaPage.dart';
import 'comicPage.dart';

/// some other small features of this app
class OtherPageContent extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<OtherPageContent>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("漫画鉴赏"),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.book),
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
            title: Text("抽卡模拟"),
            leading: Icon(Icons.attach_money),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GachaPageContent(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Bestdori网站"),
            leading: Icon(Icons.web),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BestdoriWebView(webUrl: "https://bestdori.com",),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Bandori车站"),
            leading: Icon(Icons.directions_bus),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BestdoriWebView(webUrl: "https://bandoristation.com",),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("声明"),
            leading: Icon(Icons.info),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
