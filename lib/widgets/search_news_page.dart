import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchNewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchNewsPageState();
}

class SearchNewsPageState extends State<SearchNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "警务新闻",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue),
    );
  }
}
