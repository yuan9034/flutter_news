import 'package:flutter_news/generated/json/base/json_convert_content.dart';

class CategoryEntity with JsonConvert<CategoryEntity> {
  bool flag;
  List<CategoryData> data;
}

class CategoryData with JsonConvert<CategoryData> {
  int id;
  int pubId;
  String name;
  String icon;
  String info;
  int status;
  int type;
  int createTime;
  int seq;
  String sn;
  String cronExpression;
  int property;
  dynamic categoryId;
  int cronTime;
  dynamic templateId;
  dynamic enableImg;
  dynamic grabFlag;
  dynamic relation;
}
