import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_list_response_entity.dart';

//新闻列表
class NewsItemPage extends StatefulWidget {
  NewsListResponseDataList data;

  NewsItemPage(this.data);

  @override
  State<StatefulWidget> createState() => NewsItemPageState();
}

class NewsItemPageState extends State<NewsItemPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 100,
      child: getChild(),
    );
  }

  Widget getChild() {
    var data = widget.data;
    if (data.imgs != null && data.imgs.isNotEmpty) {
      if (data.imgs.length >= 3) {
        return Column(
          children: [
            Text(data.title,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
            Row(
              children: [
                Text("置顶", style: TextStyle(color: Colors.blue, fontSize: 14)),
                Flexible(
                    child: Text(data.date,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        textAlign: TextAlign.end))
              ],
            )
          ],
        );
      } else {
        return Column(
          children: [
            Text(data.title,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
            Row(
              children: [
                Text("置顶", style: TextStyle(color: Colors.blue, fontSize: 14)),
                Flexible(
                    child: Text(data.date,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        textAlign: TextAlign.end))
              ],
            )
          ],
        );
      }
    }
    return Column(
      children: [
        Text(data.title,
            style: TextStyle(color: Colors.black, fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis),
        Row(
          children: [
            Text("置顶", style: TextStyle(color: Colors.blue, fontSize: 14)),
            Flexible(
                child: Text(data.date,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                    textAlign: TextAlign.end))
          ],
        )
      ],
    );
  }
}
