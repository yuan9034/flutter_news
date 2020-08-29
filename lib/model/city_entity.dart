class CityEntity {
  bool flag;
  List<Data> data;

  CityEntity({this.flag, this.data});

  CityEntity.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  int status;
  int createTime;
  int seq;
  int pubId;
  String name;
  String code;
  String info;
  String logo;

  Data(
      {this.id,
      this.status,
      this.createTime,
      this.seq,
      this.pubId,
      this.name,
      this.code,
      this.info,
      this.logo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createTime = json['createTime'];
    seq = json['seq'];
    pubId = json['pubId'];
    name = json['name'];
    code = json['code'];
    info = json['info'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['createTime'] = this.createTime;
    data['seq'] = this.seq;
    data['pubId'] = this.pubId;
    data['name'] = this.name;
    data['code'] = this.code;
    data['info'] = this.info;
    data['logo'] = this.logo;
    return data;
  }
}
