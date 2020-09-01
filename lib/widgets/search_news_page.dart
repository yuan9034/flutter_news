import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
  String startTime;
  String endTime;

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
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(2010, 1, 1),
                  maxTime: DateTime.now(),
                  onCancel: () {
                    startTime = endTime = null;
                _getSearchNews();
              },
                  onConfirm: (date) {
                    startTime = endTime =
                        "${date.year}-" + _twoDigits(date.month) +
                            "-${_twoDigits(date.day)}";
                    _getSearchNews();
                  },
                  currentTime: DateTime.now(),
                  locale: LocaleType.zh);
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
    searchNewsEntity.startTime = startTime;
    searchNewsEntity.endTime = endTime;
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

  String _twoDigits(int n) {
    if (n >= 10) return "${n}";
    return "0${n}";
  }
}
