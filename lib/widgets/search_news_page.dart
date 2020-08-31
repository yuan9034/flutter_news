import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news/common/Config.dart';
import 'package:flutter_news/model/category_entity.dart';
import 'package:flutter_news/model/news_list_response_entity.dart';
import 'package:flutter_news/model/search_news_entity.dart';
import 'package:flutter_news/utils/HttpUtil.dart';
import 'package:flutter_news/widgets/news_item_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchNewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchNewsPageState();
}

class SearchNewsPageState extends State<SearchNewsPage> {
  var refreshController = RefreshController();
  var news = List<NewsListResponseDataList>();
  CategoryEntity _categoryEntity;
  TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _categoryEntity =
        ModalRoute.of(context).settings.arguments as CategoryEntity;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 37,
          child: TextField(
            controller: textEditingController,
            style: TextStyle(color: Colors.white, fontSize: 14),
            maxLines: 1,
            showCursor: true,
            textInputAction: TextInputAction.search,
            onSubmitted: (text) {
              _getSearchNews();
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: "请输入搜索关键字",
              hintStyle: TextStyle(color: Colors.white, fontSize: 14),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.white, width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.white, width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.white, width: 1)),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              print("日期");
            },
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Center(
                  child: Text("日期",
                      style: TextStyle(color: Colors.white, fontSize: 14))),
            ),
          )
        ],
        backgroundColor: Colors.blue,
      ),
      body: SmartRefresher(
        controller: refreshController,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: _getSearchNews,
        child: ListView.builder(
          itemBuilder: (context, index) => NewsItemPage(news[index]),
          itemCount: news.length,
        ),
      ),
    );
  }

  void _getSearchNews() async {
    var searchNewsEntity = SearchNewsEntity();
    var colIds = List<int>();
    _categoryEntity.data.forEach((element) {
      colIds.add(element.id);
    });
    searchNewsEntity.colIds = colIds;
    searchNewsEntity.searchKey = textEditingController.text;
    try {
      var post = await HttpUtil()
          .post(Config.searchArticle, searchNewsEntity.toJson());
      if (post.statusCode == 200) {
        var newsListResponseEntity =
            NewsListResponseEntity().fromJson(post.data);
        news = newsListResponseEntity.data.xList;
      }
    } on DioError catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "请求失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
    }
    refreshController.refreshCompleted();
    refreshController.loadComplete();
    setState(() {});
  }
}
