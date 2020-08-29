class QueryCityEntity {
  String parentId;

  QueryCityEntity({this.parentId});

  QueryCityEntity.fromJson(Map<String, dynamic> json) {
    parentId = json['parentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parentId'] = this.parentId;
    return data;
  }
}
