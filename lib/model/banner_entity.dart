import 'package:flutter_news/generated/json/base/json_convert_content.dart';

class BannerEntity with JsonConvert<BannerEntity> {
  List<NewsListResponseDataList> carouselNews;
  int parentId;
  List<NewsListResponseDataList> topNews;
}

class NewsListResponseDataList with JsonConvert<NewsListResponseDataList> {
  int id;
  int colId;
  dynamic colName;
  String title;
  String date;
  dynamic content;
  String description;
  dynamic sourceUrl;
  String viewUrl;
  int createTime;
  int grabBatch;
  String sn;
  int type;
  int status;
  dynamic bak;
  dynamic coverImg;
  List<String> imgs;
}
