
class ReportModel {
    Summary? summary;
    List<DailyReport>? dailyReport;

    ReportModel({this.summary, this.dailyReport});

    ReportModel.fromJson(Map<String, dynamic> json) {
        if(json["summary"] is Map) {
            summary = json["summary"] == null ? null : Summary.fromJson(json["summary"]);
        }
        if(json["dailyReport"] is List) {
            dailyReport = json["dailyReport"] == null ? null : (json["dailyReport"] as List).map((e) => DailyReport.fromJson(e)).toList();
        }
    }

    static List<ReportModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ReportModel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(summary != null) {
            _data["summary"] = summary?.toJson();
        }
        if(dailyReport != null) {
            _data["dailyReport"] = dailyReport?.map((e) => e.toJson()).toList();
        }
        return _data;
    }

    ReportModel copyWith({
        Summary? summary,
        List<DailyReport>? dailyReport,
    }) => ReportModel(
        summary: summary ?? this.summary,
        dailyReport: dailyReport ?? this.dailyReport,
    );
}

class DailyReport {
    String? date;
    String? status;

    DailyReport({this.date, this.status});

    DailyReport.fromJson(Map<String, dynamic> json) {
        if(json["date"] is String) {
            date = json["date"];
        }
        if(json["status"] is String) {
            status = json["status"];
        }
    }

    static List<DailyReport> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => DailyReport.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["date"] = date;
        _data["status"] = status;
        return _data;
    }

    DailyReport copyWith({
        String? date,
        String? status,
    }) => DailyReport(
        date: date ?? this.date,
        status: status ?? this.status,
    );
}

class Summary {
    int? workingDays;
    int? onTime;
    int? late;
    int? onLeave;
    int? absent;

    Summary({this.workingDays, this.onTime, this.late, this.onLeave, this.absent});

    Summary.fromJson(Map<String, dynamic> json) {
        if(json["workingDays"] is num) {
            workingDays = (json["workingDays"] as num).toInt();
        }
        if(json["onTime"] is num) {
            onTime = (json["onTime"] as num).toInt();
        }
        if(json["late"] is num) {
            late = (json["late"] as num).toInt();
        }
        if(json["onLeave"] is num) {
            onLeave = (json["onLeave"] as num).toInt();
        }
        if(json["absent"] is num) {
            absent = (json["absent"] as num).toInt();
        }
    }

    static List<Summary> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Summary.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["workingDays"] = workingDays;
        _data["onTime"] = onTime;
        _data["late"] = late;
        _data["onLeave"] = onLeave;
        _data["absent"] = absent;
        return _data;
    }

    Summary copyWith({
        int? workingDays,
        int? onTime,
        int? late,
        int? onLeave,
        int? absent,
    }) => Summary(
        workingDays: workingDays ?? this.workingDays,
        onTime: onTime ?? this.onTime,
        late: late ?? this.late,
        onLeave: onLeave ?? this.onLeave,
        absent: absent ?? this.absent,
    );
}