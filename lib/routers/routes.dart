import 'package:flutter/material.dart';
import 'package:flutter_news/widgets/city_list_page.dart';
import 'package:flutter_news/widgets/news_detail_page.dart';
import 'package:flutter_news/widgets/news_home_page.dart';
import 'package:flutter_news/widgets/search_news_page.dart';

class Routes {
  static String cityListPage = "/city_list";
  static String newsHomePage = "/news_home";
  static String searchNewsPage = "/search_news";
  static String newsDetailsPage = "/news_details";
  static Map<String, WidgetBuilder> routes = {};

  static void init() {
    //城市列表
    routes[cityListPage] = (context) => CityListPage();
    //新闻主界面
    routes[newsHomePage] = (context) => NewsHomePage();
    //搜索新闻
    routes[searchNewsPage] = (context) => SearchNewsPage();
    //新闻详情
    routes[newsDetailsPage] = (context) => NewsDetailsPage();
  }
}
