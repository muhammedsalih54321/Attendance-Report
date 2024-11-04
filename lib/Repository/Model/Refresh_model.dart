
class RefreshModel {
    String? access;
    String? refresh;
    int? accessExpires;

    RefreshModel({this.access, this.refresh, this.accessExpires});

    RefreshModel.fromJson(Map<String, dynamic> json) {
        if(json["access"] is String) {
            access = json["access"];
        }
        if(json["refresh"] is String) {
            refresh = json["refresh"];
        }
        if(json["accessExpires"] is num) {
            accessExpires = (json["accessExpires"] as num).toInt();
        }
    }

    static List<RefreshModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => RefreshModel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["access"] = access;
        _data["refresh"] = refresh;
        _data["accessExpires"] = accessExpires;
        return _data;
    }

    RefreshModel copyWith({
        String? access,
        String? refresh,
        int? accessExpires,
    }) => RefreshModel(
        access: access ?? this.access,
        refresh: refresh ?? this.refresh,
        accessExpires: accessExpires ?? this.accessExpires,
    );
}