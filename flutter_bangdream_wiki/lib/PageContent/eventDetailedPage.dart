import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Event.dart';
import 'package:flutter_bangdream_wiki/PageContent/ImageDetailScreen.dart';


class EventDetailedPage extends StatefulWidget {

  // Declare a field that holds the card.
  final Event event;
  EventDetailedPage({Key key, @required this.event}) : super(key: key);

  @override
  _State createState() => new _State();
}

class _State extends State<EventDetailedPage>{

  List<Widget> list = List<Widget> ();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (String name in widget.event.characters) {
      String path = "";
      switch (name) {
        case "上原绯玛丽":
          path = "assets/charaIcons/symfl.png";
          break;
        case "丸山彩":
          path = "assets/charaIcons/wsc.png";
          break;
        case "今井莉莎":
          path = "assets/charaIcons/jjls.png";
          break;
        case "冰川日菜":
          path = "assets/charaIcons/bcrc.png";
          break;
        case "冰川纱夜":
          path = "assets/charaIcons/bcsy.png";
          break;
        case "凑友希那":
          path = "assets/charaIcons/cyxn.png";
          break;
        case "北泽育美":
          path = "assets/charaIcons/bzym.png";
          break;
        case "大和麻弥":
          path = "assets/charaIcons/dhmm.png";
          break;
        case "奥泽美咲":
          path = "assets/charaIcons/azmx.png";
          break;
        case "宇田川亚子":
          path = "assets/charaIcons/ytcyz.png";
          break;
        case "宇田川巴":
          path = "assets/charaIcons/ytcb.png";
          break;
        case "山吹沙绫":
          path = "assets/charaIcons/scsl.png";
          break;
        case "市谷有咲":
          path = "assets/charaIcons/sgyx.png";
          break;
        case "弦卷心":
          path = "assets/charaIcons/xjx.png";
          break;
        case "户山香澄":
          path = "assets/charaIcons/hsxc.png";
          break;
        case "松原花音":
          path = "assets/charaIcons/syhy.png";
          break;
        case "濑田薰":
          path = "assets/charaIcons/ltx.png";
          break;
        case "牛込里美":
          path = "assets/charaIcons/nylm.png";
          break;
        case "白金燐子":
          path = "assets/charaIcons/bjlz.png";
          break;
        case "白鹭千圣":
          path = "assets/charaIcons/blqs.png";
          break;
        case "美竹兰":
          path = "assets/charaIcons/mzl.png";
          break;
        case "羽泽鸫":
          path = "assets/charaIcons/yzd.png";
          break;
        case "花园多惠":
          path = "assets/charaIcons/hydh.png";
          break;
        case "若宫伊芙":
          path = "assets/charaIcons/rgyf.png";
          break;
        case "青叶摩卡":
          path = "assets/charaIcons/qymk.png";
          break;
      }
      list.add(Image(image: AssetImage(path),height: 40,width: 45,));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("活动详情",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blueAccent,
                      width: 2.0
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(20.0)
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: widget.event.imageURL,
                    height: 130,
                  ),
                )
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text("标题",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.event.title, style: TextStyle(fontSize: 15),),
                ),
                Divider(),
                ListTile(
                    title: Text("属性",style: TextStyle(fontWeight: FontWeight.bold),),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image(image: AssetImage("assets/images/attribute/" + widget.event.attribute + ".png",),height: 40),
                        SizedBox(
                          width: 5,
                        ),
                        Text("+20%", style: TextStyle(fontSize: 15),),
                      ],
                    )
                ),
                Divider(),
                ListTile(
                  title: Text("种类",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.event.type, style: TextStyle(fontSize: 15),),
                ),
                Divider(),
                ListTile(
                  title: Text("角色",style: TextStyle(fontWeight: FontWeight.bold),),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: list
                    )
                ),
                Divider(),
                ListTile(
                  title: Text("开始日期",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.event.startDate, style: TextStyle(fontSize: 15),),
                ),
                Divider(),
                ListTile(
                  title: Text("结束日期",style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(widget.event.endDate, style: TextStyle(fontSize: 15),),
                ),
                Divider(),
                ListTile(
                  title: Text("招募信息",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return ImageDetailScreen(imageURL: widget.event.gachaURL,);
                      }));
                    },
                    child: CachedNetworkImage(
                        imageUrl: widget.event.gachaURL,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                        errorWidget: (context, url, error) => Icon(Icons.error)
                    ),
                  ),
                )
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
