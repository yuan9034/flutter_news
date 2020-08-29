import 'package:flutter_news/model/news_list_request_entity.dart';

newsListRequestEntityFromJson(
    NewsListRequestEntity data, Map<String, dynamic> json) {
  if (json['colIds'] != null) {
    data.colIds = json['colIds']?.map((v) => v?.toInt())?.toList()?.cast<int>();
  }
  if (json['pageSize'] != null) {
    data.pageSize = json['pageSize']?.toInt();
  }
  if (json['type'] != null) {
    data.type = json['type']?.toInt();
  }
  return data;
}

Map<String, dynamic> newsListRequestEntityToJson(NewsListRequestEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['colIds'] = entity.colIds;
  data['pageSize'] = entity.pageSize;
  data['type'] = entity.type;
  return data;
}
