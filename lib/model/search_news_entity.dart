class SearchNewsEntity {
  List<int> colIds;
  String endTime;
  String order = "1";
  int pageNum = 1;
  int pageSize = 10;
  String searchKey;
  String startTime;

  SearchNewsEntity(
      {this.colIds,
      this.endTime,
      this.order,
      this.pageNum,
      this.pageSize,
      this.searchKey,
      this.startTime});

  SearchNewsEntity.fromJson(Map<String, dynamic> json) {
    colIds = json['colIds'].cast<int>();
    endTime = json['endTime'];
    order = json['order'];
    pageNum = json['pageNum'];
    pageSize = json['pageSize'];
    searchKey = json['searchKey'];
    startTime = json['startTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['colIds'] = this.colIds;
    data['endTime'] = this.endTime;
    data['order'] = this.order;
    data['pageNum'] = this.pageNum;
    data['pageSize'] = this.pageSize;
    data['searchKey'] = this.searchKey;
    data['startTime'] = this.startTime;
    return data;
  }
}
