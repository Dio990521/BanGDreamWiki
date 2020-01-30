import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// This widget can open a new route, which means users don't need to open browser
class BestdoriWebView extends StatelessWidget{

  final String webUrl;

  BestdoriWebView({Key key, @required this.webUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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