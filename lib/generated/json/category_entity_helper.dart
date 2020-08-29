import 'package:flutter_news/model/category_entity.dart';

categoryEntityFromJson(CategoryEntity data, Map<String, dynamic> json) {
  if (json['flag'] != null) {
    data.flag = json['flag'];
  }
  if (json['data'] != null) {
    data.data = new List<CategoryData>();
    (json['data'] as List).forEach((v) {
      data.data.add(new CategoryData().fromJson(v));
    });
  }
  return data;
}

Map<String, dynamic> categoryEntityToJson(CategoryEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['flag'] = entity.flag;
  if (entity.data != null) {
    data['data'] = entity.data.map((v) => v.toJson()).toList();
  }
  return data;
}

categoryDataFromJson(CategoryData data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toInt();
  }
  if (json['pubId'] != null) {
    data.pubId = json['pubId']?.toInt();
  }
  if (json['name'] != null) {
    data.name = json['name']?.toString();
  }
  if (json['icon'] != null) {
    data.icon = json['icon']?.toString();
  }
  if (json['info'] != null) {
    data.info = json['info']?.toString();
  }
  if (json['status'] != null) {
    data.status = json['status']?.toInt();
  }
  if (json['type'] != null) {
    data.type = json['type']?.toInt();
  }
  if (json['createTime'] != null) {
    data.createTime = json['createTime']?.toInt();
  }
  if (json['seq'] != null) {
    data.seq = json['seq']?.toInt();
  }
  if (json['sn'] != null) {
    data.sn = json['sn']?.toString();
  }
  if (json['cronExpression'] != null) {
    data.cronExpression = json['cronExpression']?.toString();
  }
  if (json['property'] != null) {
    data.property = json['property']?.toInt();
  }
  if (json['categoryId'] != null) {
    data.categoryId = json['categoryId'];
  }
  if (json['cronTime'] != null) {
    data.cronTime = json['cronTime']?.toInt();
  }
  if (json['templateId'] != null) {
    data.templateId = json['templateId'];
  }
  if (json['enableImg'] != null) {
    data.enableImg = json['enableImg'];
  }
  if (json['grabFlag'] != null) {
    data.grabFlag = json['grabFlag'];
  }
  if (json['relation'] != null) {
    data.relation = json['relation'];
  }
  return data;
}

Map<String, dynamic> categoryDataToJson(CategoryData entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['pubId'] = entity.pubId;
  data['name'] = entity.name;
  data['icon'] = entity.icon;
  data['info'] = entity.info;
  data['status'] = entity.status;
  data['type'] = entity.type;
  data['createTime'] = entity.createTime;
  data['seq'] = entity.seq;
  data['sn'] = entity.sn;
  data['cronExpression'] = entity.cronExpression;
  data['property'] = entity.property;
  data['categoryId'] = entity.categoryId;
  data['cronTime'] = entity.cronTime;
  data['templateId'] = entity.templateId;
  data['enableImg'] = entity.enableImg;
  data['grabFlag'] = entity.grabFlag;
  data['relation'] = entity.relation;
  return data;
}
