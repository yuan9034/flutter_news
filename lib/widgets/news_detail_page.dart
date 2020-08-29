import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news/model/news_list_response_entity.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsDetailsState();
}

class NewsDetailsState extends State<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var data =
        ModalRoute.of(context).settings.arguments as NewsListResponseDataList;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: WebView(
        initialUrl: data.viewUrl,
      ),
    );
  }
}
