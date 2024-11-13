class TodayAttendenceModel {
  TodayAttendenceModel({
      this.checkInTime, 
      this.checkOutTime, 
      this.collectionId, 
      this.collectionName, 
      this.created, 
      this.date, 
      this.employee, 
      this.halfDayCut, 
      this.hoursWorked, 
      this.id, 
      this.lateComeReason, 
      this.overtimeCheckInTime, 
      this.overtimeCheckOutTime, 
      this.overtimeHours, 
      this.overtimeReason, 
      this.updated,});

  TodayAttendenceModel.fromJson(dynamic json) {
    checkInTime = json['check_in_time'];
    checkOutTime = json['check_out_time'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    date = json['date'];
    employee = json['employee'];
    halfDayCut = json['half_day_cut'];
    hoursWorked = json['hours_worked'];
    id = json['id'];
    lateComeReason = json['late_come_reason'];
    overtimeCheckInTime = json['overtime_check_in_time'];
    overtimeCheckOutTime = json['overtime_check_out_time'];
    overtimeHours = json['overtime_hours'];
    overtimeReason = json['overtime_reason'];
    updated = json['updated'];
  }
  String? checkInTime;
  String? checkOutTime;
  String? collectionId;
  String? collectionName;
  String? created;
  String? date;
  String? employee;
  bool? halfDayCut;
  dynamic hoursWorked;
  String? id;
  String? lateComeReason;
  String? overtimeCheckInTime;
  String? overtimeCheckOutTime;
  dynamic overtimeHours;
  String? overtimeReason;
  String? updated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['check_in_time'] = checkInTime;
    map['check_out_time'] = checkOutTime;
    map['collectionId'] = collectionId;
    map['collectionName'] = collectionName;
    map['created'] = created;
    map['date'] = date;
    map['employee'] = employee;
    map['half_day_cut'] = halfDayCut;
    map['hours_worked'] = hoursWorked;
    map['id'] = id;
    map['late_come_reason'] = lateComeReason;
    map['overtime_check_in_time'] = overtimeCheckInTime;
    map['overtime_check_out_time'] = overtimeCheckOutTime;
    map['overtime_hours'] = overtimeHours;
    map['overtime_reason'] = overtimeReason;
    map['updated'] = updated;
    return map;
  }

}