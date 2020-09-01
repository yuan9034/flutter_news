import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/common/Config.dart';
import 'package:flutter_news/model/news_list_request_entity.dart';
import 'package:flutter_news/model/news_list_response_entity.dart';
import 'package:flutter_news/utils/HttpUtil.dart';
import 'package:flutter_news/widgets/news_item_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

//新闻列表
class NewsListPage extends StatefulWidget {
  int id;

  NewsListPage(this.id);

  @override
  State<StatefulWidget> createState() => NewsListPageState();
}

class NewsListPageState extends State<NewsListPage>
    with AutomaticKeepAliveClientMixin {
  var _refreshController = RefreshController(initialRefresh: true);
  NewsListRequestEntity newsListRequestEntity;
  List<NewsListResponseDataList> xList = List();

  @override
  void initState() {
    super.initState();
    newsListRequestEntity = NewsListRequestEntity();
    newsListRequestEntity.colIds = [widget.id];
  }

  void _onRefresh() async {
    try {
      var response = await HttpUtil()
          .post(Config.getArticleList, newsListRequestEntity.toJson());
      if (response.statusCode == 200) {
        var newsListResponseEntity =
            NewsListResponseEntity().fromJson(response.data);
        if (newsListResponseEntity.data != null) {
          xList = newsListResponseEntity.data.xList;
        }
      }
    } on DioError catch (e) {
      print(e);
    }
    _refreshController.refreshCompleted();
    _refreshController.loadComplete();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: getChildren());
  }

  Widget getChildren() {
    if (newsListRequestEntity.type == 0 && xList.length == 0) {
      return Center(
        child: Image.asset("images/no_data.png",
            height: 100, width: 100, fit: BoxFit.contain),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) => NewsItemPage(xList[index]),
      itemCount: xList.length,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
