import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/PageContent/FBPage.dart';
import 'package:flutter_bangdream_wiki/PageContent/InfoPage.dart';
import 'package:flutter_bangdream_wiki/PageContent/eventPage.dart';
import 'package:flutter_bangdream_wiki/PageContent/otherPage.dart';
import 'package:flutter_bangdream_wiki/PageContent/songPage.dart';
import 'PageContent/cardPage.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }

}


/// Build the navigation bar
/// 4 are available to users
/// 1(FBPage) is only for updating data on cloud firestore
class MyAppState extends State<MyApp> {

  int _currentIndex = 0;
  List<Widget> _children = [
    CardPage(),
    SongPage(),
    EventPage(),
    OtherPageContent(),
    //FBPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BanGDreamWiki",
      darkTheme: ThemeData(
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BanGDreamWiki'),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedFontSize: 16,
          unselectedFontSize: 13,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.face),
                activeIcon: Icon(Icons.face, color: Colors.blueAccent,),
                title: Text("角色")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                activeIcon: Icon(Icons.library_music, color: Colors.blueAccent,),
                title: Text("曲库")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.event),
                activeIcon: Icon(Icons.event, color: Colors.blueAccent,),
                title: Text("活动")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                activeIcon: Icon(Icons.dashboard, color: Colors.blueAccent,),
                title: Text("其他")
            ),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.person),
//                activeIcon: Icon(Icons.person, color: Colors.blueAccent,),
//                title: Text("个人")
//            ),
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}