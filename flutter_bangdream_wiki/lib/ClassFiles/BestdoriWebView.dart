import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BestdoriWebView extends StatelessWidget{

  final String webUrl;

  BestdoriWebView(this.webUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Bestdori!"),
        ),
        body: WebView(
          initialUrl: webUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }

}