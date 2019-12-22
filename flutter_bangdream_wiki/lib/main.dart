import 'package:flutter/material.dart';
import 'cardPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CardPageContent(),
    Text("2"),
    Text("3"),
    Text("4"),
    Text("5"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BanGDreamWiki",
      darkTheme: ThemeData(),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                activeIcon: Icon(Icons.person, color: Colors.blueAccent,),
                title: Text("个人")
            ),
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


