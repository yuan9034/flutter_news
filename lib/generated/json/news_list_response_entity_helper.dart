import 'package:flutter_news/model/news_list_response_entity.dart';

newsListResponseEntityFromJson(
    NewsListResponseEntity data, Map<String, dynamic> json) {
  if (json['flag'] != null) {
    data.flag = json['flag'];
  }
  if (json['data'] != null) {
    data.data = new NewsListResponseData().fromJson(json['data']);
  }
  return data;
}

Map<String, dynamic> newsListResponseEntityToJson(
    NewsListResponseEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['flag'] = entity.flag;
  if (entity.data != null) {
    data['data'] = entity.data.toJson();
  }
  return data;
}

newsListResponseDataFromJson(
    NewsListResponseData data, Map<String, dynamic> json) {
  if (json['hasMore'] != null) {
    data.hasMore = json['hasMore'];
  }
  if (json['list'] != null) {
    data.xList = new List<NewsListResponseDataList>();
    (json['list'] as List).forEach((v) {
      data.xList.add(new NewsListResponseDataList().fromJson(v));
    });
  }
  return data;
}

Map<String, dynamic> newsListResponseDataToJson(NewsListResponseData entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['hasMore'] = entity.hasMore;
  if (entity.xList != null) {
    data['list'] = entity.xList.map((v) => v.toJson()).toList();
  }
  return data;
}

newsListResponseDataListFromJson(
    NewsListResponseDataList data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toInt();
  }
  if (json['colId'] != null) {
    data.colId = json['colId']?.toInt();
  }
  if (json['colName'] != null) {
    data.colName = json['colName'];
  }
  if (json['title'] != null) {
    data.title = json['title']?.toString();
  }
  if (json['date'] != null) {
    data.date = json['date']?.toString();
  }
  if (json['content'] != null) {
    data.content = json['content'];
  }
  if (json['description'] != null) {
    data.description = json['description']?.toString();
  }
  if (json['sourceUrl'] != null) {
    data.sourceUrl = json['sourceUrl'];
  }
  if (json['viewUrl'] != null) {
    data.viewUrl = json['viewUrl']?.toString();
  }
  if (json['createTime'] != null) {
    data.createTime = json['createTime']?.toInt();
  }
  if (json['grabBatch'] != null) {
    data.grabBatch = json['grabBatch']?.toInt();
  }
  if (json['sn'] != null) {
    data.sn = json['sn']?.toString();
  }
  if (json['type'] != null) {
    data.type = json['type']?.toInt();
  }
  if (json['status'] != null) {
    data.status = json['status']?.toInt();
  }
  if (json['bak'] != null) {
    data.bak = json['bak'];
  }
  if (json['coverImg'] != null) {
    data.coverImg = json['coverImg'];
  }
  if (json['imgs'] != null) {
    data.imgs =
        json['imgs']?.map((v) => v?.toString())?.toList()?.cast<String>();
  }
  return data;
}

Map<String, dynamic> newsListResponseDataListToJson(
    NewsListResponseDataList entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['colId'] = entity.colId;
  data['colName'] = entity.colName;
  data['title'] = entity.title;
  data['date'] = entity.date;
  data['content'] = entity.content;
  data['description'] = entity.description;
  data['sourceUrl'] = entity.sourceUrl;
  data['viewUrl'] = entity.viewUrl;
  data['createTime'] = entity.createTime;
  data['grabBatch'] = entity.grabBatch;
  data['sn'] = entity.sn;
  data['type'] = entity.type;
  data['status'] = entity.status;
  data['bak'] = entity.bak;
  data['coverImg'] = entity.coverImg;
  data['imgs'] = entity.imgs;
  return data;
}
