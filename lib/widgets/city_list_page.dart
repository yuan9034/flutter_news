import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/common/Config.dart';
import 'package:flutter_news/model/banner_entity.dart';
import 'package:flutter_news/model/city_entity.dart';
import 'package:flutter_news/model/query_city_entity.dart';
import 'package:flutter_news/utils/HttpUtil.dart';
import 'package:flutter_news/widgets/city_item_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CityListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CityListPageState();
}

class CityListPageState extends State<CityListPage> {
  var _refreshController = RefreshController(initialRefresh: false);
  var data = List<Data>();
  var firstRefresh = true;
  BannerEntity bannerEntity;

  void _onRefresh() async {
    try {
      var queryCityEntity = QueryCityEntity();
      var getCityResponse = await HttpUtil()
          .post<CityEntity>(Config.getCitys, queryCityEntity.toJson());
      if (getCityResponse.statusCode == 200) {
        data = CityEntity.fromJson(getCityResponse.data).data;
      }
      var response = await HttpUtil().post(Config.getTopTurn, {});
      if (response.statusCode == 200) {
        bannerEntity = BannerEntity().fromJson(response.data);
        print(bannerEntity);
      }
    } on DioError catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "获取数据失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    _refreshController.refreshCompleted();
    setState(() {});
  }

  @override
  void initState() {
    _onRefresh();
    super.initState();
  }

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
      body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: getBody()),
    );
  }

  Widget getBody() {
    if (firstRefresh) {
      firstRefresh = false;
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.92),
        itemBuilder: (context, index) =>
            CityItemPage(data[index], bannerEntity),
        itemCount: data.length);
  }
}
