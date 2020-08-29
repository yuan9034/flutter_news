import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsDetailsState();
}

class NewsDetailsState extends State<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "警务新闻",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: WebView(
        initialUrl: "https://flutter.cn",
      ),
    );
  }
}
