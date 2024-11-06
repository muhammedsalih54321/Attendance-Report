
class CheckoutModel {
    String? checkInTime;
    String? checkOutTime;
    String? collectionId;
    String? collectionName;
    String? created;
    String? date;
    String? employee;
    bool? halfDayCut;
    double? hoursWorked;
    String? id;
    String? lateComeReason;
    String? overtimeCheckInTime;
    String? overtimeCheckOutTime;
    int? overtimeHours;
    String? overtimeReason;
    String? updated;

    CheckoutModel({this.checkInTime, this.checkOutTime, this.collectionId, this.collectionName, this.created, this.date, this.employee, this.halfDayCut, this.hoursWorked, this.id, this.lateComeReason, this.overtimeCheckInTime, this.overtimeCheckOutTime, this.overtimeHours, this.overtimeReason, this.updated});

    CheckoutModel.fromJson(Map<String, dynamic> json) {
        if(json["check_in_time"] is String) {
            checkInTime = json["check_in_time"];
        }
        if(json["check_out_time"] is String) {
            checkOutTime = json["check_out_time"];
        }
        if(json["collectionId"] is String) {
            collectionId = json["collectionId"];
        }
        if(json["collectionName"] is String) {
            collectionName = json["collectionName"];
        }
        if(json["created"] is String) {
            created = json["created"];
        }
        if(json["date"] is String) {
            date = json["date"];
        }
        if(json["employee"] is String) {
            employee = json["employee"];
        }
        if(json["half_day_cut"] is bool) {
            halfDayCut = json["half_day_cut"];
        }
        if(json["hours_worked"] is num) {
            hoursWorked = (json["hours_worked"] as num).toDouble();
        }
        if(json["id"] is String) {
            id = json["id"];
        }
        if(json["late_come_reason"] is String) {
            lateComeReason = json["late_come_reason"];
        }
        if(json["overtime_check_in_time"] is String) {
            overtimeCheckInTime = json["overtime_check_in_time"];
        }
        if(json["overtime_check_out_time"] is String) {
            overtimeCheckOutTime = json["overtime_check_out_time"];
        }
        if(json["overtime_hours"] is num) {
            overtimeHours = (json["overtime_hours"] as num).toInt();
        }
        if(json["overtime_reason"] is String) {
            overtimeReason = json["overtime_reason"];
        }
        if(json["updated"] is String) {
            updated = json["updated"];
        }
    }

    static List<CheckoutModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => CheckoutModel.fromJson(map)).toList();
    }


    CheckoutModel copyWith({
        String? checkInTime,
        String? checkOutTime,
        String? collectionId,
        String? collectionName,
        String? created,
        String? date,
        String? employee,
        bool? halfDayCut,
        double? hoursWorked,
        String? id,
        String? lateComeReason,
        String? overtimeCheckInTime,
        String? overtimeCheckOutTime,
        int? overtimeHours,
        String? overtimeReason,
        String? updated,
    }) => CheckoutModel(
        checkInTime: checkInTime ?? this.checkInTime,
        checkOutTime: checkOutTime ?? this.checkOutTime,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        created: created ?? this.created,
        date: date ?? this.date,
        employee: employee ?? this.employee,
        halfDayCut: halfDayCut ?? this.halfDayCut,
        hoursWorked: hoursWorked ?? this.hoursWorked,
        id: id ?? this.id,
        lateComeReason: lateComeReason ?? this.lateComeReason,
        overtimeCheckInTime: overtimeCheckInTime ?? this.overtimeCheckInTime,
        overtimeCheckOutTime: overtimeCheckOutTime ?? this.overtimeCheckOutTime,
        overtimeHours: overtimeHours ?? this.overtimeHours,
        overtimeReason: overtimeReason ?? this.overtimeReason,
        updated: updated ?? this.updated,
    );
}