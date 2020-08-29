import 'package:flutter/material.dart';
import 'package:flutter_news/model/news_list_response_entity.dart';
import 'package:flutter_news/routers/routes.dart';

//新闻列表
class NewsItemPage extends StatefulWidget {
  final NewsListResponseDataList data;

  NewsItemPage(this.data);

  @override
  State<StatefulWidget> createState() => NewsItemPageState();
}

class NewsItemPageState extends State<NewsItemPage> {
  double itemHeight = 100;

  @override
  Widget build(BuildContext context) {
    if (widget.data.imgs != null && widget.data.imgs.length >= 3) {
      itemHeight = 150;
    }
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.newsDetailsPage,
            arguments: widget.data);
      },
      child: Container(
        padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
        height: itemHeight,
        child: getChild(),
        // 下边框
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
      ),
    );
  }

  Widget getChild() {
    var data = widget.data;
    if (data.imgs != null && data.imgs.isNotEmpty) {
      if (data.imgs.length >= 3) {
        return haveManyImgsWidge(data);
      } else {
        return haveOneImgsWidge(data);
      }
    }
    return haveOnlyTextWidge(data);
  }

  Widget haveManyImgsWidge(NewsListResponseDataList data) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(data.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
        ),
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: Image.network(data.imgs[0] + "_306x192.jpg",
                    width: 105, height: 88, fit: BoxFit.fill)),
            Expanded(
                child: Image.network(data.imgs[0] + "_306x192.jpg",
                    width: 105, height: 88, fit: BoxFit.fill)),
            Expanded(
                child: Image.network(data.imgs[0] + "_306x192.jpg",
                    width: 105, height: 88, fit: BoxFit.fill))
          ],
        )),
        Row(
          children: [
            Expanded(
                child: Visibility(
                    child: Text("置顶",
                        style: TextStyle(color: Colors.blue, fontSize: 14)),
                    visible: false)),
            Text(data.date, style: TextStyle(color: Colors.grey, fontSize: 14))
          ],
        )
      ],
    );
  }

  Widget haveOneImgsWidge(NewsListResponseDataList data) {
    return Row(
      children: [
        Image.network(data.imgs[0] + "_306x192.jpg",
            width: 105, height: 88, fit: BoxFit.fill),
        Expanded(
            child: Column(
          children: [
            Expanded(
              child: Text(data.title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
            ),
            Container(
              child: Row(
                children: [
                  Visibility(
                    child: Text("置顶",
                        style: TextStyle(color: Colors.blue, fontSize: 14)),
                    visible: false,
                  ),
                  Expanded(child: Text("")),
                  Text(
                    data.date,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                    textAlign: TextAlign.end,
                    textDirection: TextDirection.rtl,
                  )
                ],
              ),
            )
          ],
        ))
      ],
    );
  }

  Widget haveOnlyTextWidge(NewsListResponseDataList data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(data.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ),
        Container(
          margin: EdgeInsets.only(top: 6),
          child: Row(
            children: [
              Visibility(
                child: Text("置顶",
                    style: TextStyle(color: Colors.blue, fontSize: 14)),
                visible: false,
              ),
              Expanded(child: Text("")),
              Text(
                data.date,
                style: TextStyle(color: Colors.grey, fontSize: 14),
                textAlign: TextAlign.end,
                textDirection: TextDirection.rtl,
              )
            ],
          ),
        )
      ],
    );
  }
}
