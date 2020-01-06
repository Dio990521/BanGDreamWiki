import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bangdream_wiki/ClassFiles/Comic.dart';
import 'comicDetailedPage.dart';

class ComicPageContent extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<ComicPageContent>{

  List<dynamic> comics = List<dynamic>();
  List<Widget> comicWidgets = List<Widget>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("漫画列表",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: StreamBuilder(
            stream: Firestore.instance.collection("Comic").snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  comics = snapshot.data.documents.map((DocumentSnapshot document) {
                    return new Comic.fromMap(document);
                  }).toList();
              }
              comicWidgets.clear();
              for (Comic comic in comics) {
                comicWidgets.add(ComicGrid(comic));
              }
              return GridView.count(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 3,
                padding: EdgeInsets.all(10),
                childAspectRatio: 1.0 / 0.8,
                children: comicWidgets,
              );
            }),
    );
  }

}
class ComicGrid extends StatelessWidget{

  final Comic comic;
  ComicGrid(this.comic);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ComicDetailedPage(comic: comic),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(top: 3),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: comic.imageURL1,
          ),
        )
      ),
    );
  }
}
