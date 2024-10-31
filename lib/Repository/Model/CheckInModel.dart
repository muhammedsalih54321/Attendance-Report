class CheckInModel {
  CheckInModel({
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
      this.overtimeCheckInTime, 
      this.overtimeCheckOutTime, 
      this.overtimeHours, 
      this.updated,});

  CheckInModel.fromJson(dynamic json) {
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
    overtimeCheckInTime = json['overtime_check_in_time'];
    overtimeCheckOutTime = json['overtime_check_out_time'];
    overtimeHours = json['overtime_hours'];
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
  int? hoursWorked;
  String? id;
  String? overtimeCheckInTime;
  String? overtimeCheckOutTime;
  int? overtimeHours;
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
    map['overtime_check_in_time'] = overtimeCheckInTime;
    map['overtime_check_out_time'] = overtimeCheckOutTime;
    map['overtime_hours'] = overtimeHours;
    map['updated'] = updated;
    return map;
  }

}