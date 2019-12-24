import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongPageContent extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<SongPageContent> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, left: 7.0, right: 7.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      labelText: "输入歌曲名"
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                  }
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          GridView.count(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 3,
              padding: EdgeInsets.all(10),
              childAspectRatio: 5.0 / 9.0,
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                        "https://bestdori.com/assets/jp/characters/resourceset/res005035_rip/card_after_training.png",
                          fit:BoxFit.fill
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 8),
                              Text(
                                  "music1",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text("12345")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                          "https://bestdori.com/assets/jp/musicjacket/musicjacket240_rip/assets-star-forassetbundle-startapp-musicjacket-musicjacket240-235_smilesong-jacket.png",
                          fit:BoxFit.fill
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                          "https://bestdori.com/assets/jp/characters/resourceset/res005035_rip/card_after_training.png",
                          fit:BoxFit.fill
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                          "https://bestdori.com/assets/jp/characters/resourceset/res005035_rip/card_after_training.png",
                          fit:BoxFit.fill
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                          "https://bestdori.com/assets/jp/characters/resourceset/res005035_rip/card_after_training.png",
                          fit:BoxFit.fill
                      )
                    ],
                  ),
                ),
              ],
          ),
        ],
      ),
    );
  }
}