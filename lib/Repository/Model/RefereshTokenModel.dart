class RefereshTokenModel {
  RefereshTokenModel({
      this.access, 
      this.refresh, 
      this.accessExpires,});

  RefereshTokenModel.fromJson(dynamic json) {
    access = json['access'];
    refresh = json['refresh'];
    accessExpires = json['accessExpires'];
  }
  String? access;
  String? refresh;
  int? accessExpires;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access'] = access;
    map['refresh'] = refresh;
    map['accessExpires'] = accessExpires;
    return map;
  }

}