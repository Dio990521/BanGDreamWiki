
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageDetailScreen extends StatelessWidget {

  final String imageURL;
  ImageDetailScreen(this.imageURL);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Center(
          child: Hero(
            transitionOnUserGestures: true,
            tag: imageURL,
            child: CachedNetworkImage(
                imageUrl: imageURL,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                errorWidget: (context, url, error) => Icon(Icons.error)
            ),
          ),
        ),
      ),
    );
  }
}