import 'package:flutter_news/generated/json/base/json_convert_content.dart';
import 'package:flutter_news/generated/json/base/json_field.dart';

class NewsListResponseEntity with JsonConvert<NewsListResponseEntity> {
  bool flag;
  NewsListResponseData data;
}

class NewsListResponseData with JsonConvert<NewsListResponseData> {
  bool hasMore;
  @JSONField(name: "list")
  List<NewsListResponseDataList> xList;
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
