import 'package:flutter/material.dart';

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
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemExtent: 180,
          itemCount: others.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.network(others[index]),
                  )

                ],
              ),
            );
          }
      ),
    );
  }
  
}
