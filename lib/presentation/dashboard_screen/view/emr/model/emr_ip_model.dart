// To parse this JSON data, do
//
//     final emrDetailsModel = emrDetailsModelFromJson(jsonString);

import 'dart:convert';

EmrIpModel emrDetailsModelFromJson(String str) =>
    EmrIpModel.fromJson(json.decode(str));

String emrDetailsModelToJson(EmrIpModel data) => json.encode(data.toJson());

class EmrIpModel {
  String? ipno;
  String? date;
  List<LabTestName>? labTestName;
  String? ambulanceDate;
  String? ambulanceIssueRegistered;
  String? ambulanceDepartment;
  String? ambulanceId;
  String? ambulanceDoctor;
  String? sosDepartment;
  String? sosIssue;
  String? sosDate;
  String? sosContact;
  String? sosRelativeContact;
  String? bookingDate;
  String? bookingDepartment;
  String? bookingDoctorName;
  String? bookingTimeBookStart;
  String? bookingReason;

  EmrIpModel({
    this.ipno,
    this.date,
    this.labTestName,
    this.ambulanceDate,
    this.ambulanceIssueRegistered,
    this.ambulanceDepartment,
    this.ambulanceId,
    this.ambulanceDoctor,
    this.sosDepartment,
    this.sosIssue,
    this.sosDate,
    this.sosContact,
    this.sosRelativeContact,
    this.bookingDate,
    this.bookingDepartment,
    this.bookingDoctorName,
    this.bookingTimeBookStart,
    this.bookingReason,
  });

  factory EmrIpModel.fromJson(Map<String, dynamic> json) => EmrIpModel(
        ipno: json["ipno"],
        date: json["date"],
        labTestName: json["lab_test_name"] == null
            ? []
            : List<LabTestName>.from(
                json["lab_test_name"]!.map((x) => LabTestName.fromJson(x))),
        ambulanceDate: json["ambulance_date"],
        ambulanceIssueRegistered: json["ambulance_issue_registered"],
        ambulanceDepartment: json["ambulance_department"],
        ambulanceId: json["ambulance_id"],
        ambulanceDoctor: json["ambulance_doctor"],
        sosDepartment: json["sos_department"],
        sosIssue: json["sos_issue"],
        sosDate: json["sos_date"],
        sosContact: json["sos_contact"],
        sosRelativeContact: json["sos_relative_contact"],
        bookingDate: json["booking_date"],
        bookingDepartment: json["booking_department"],
        bookingDoctorName: json["booking_doctor_name"],
        bookingTimeBookStart: json["booking_time_book_start"],
        bookingReason: json["booking_reason"],
      );

  Map<String, dynamic> toJson() => {
        "ipno": ipno,
        "date": date,
        "lab_test_name": labTestName == null
            ? []
            : List<dynamic>.from(labTestName!.map((x) => x.toJson())),
        "ambulance_date": ambulanceDate,
        "ambulance_issue_registered": ambulanceIssueRegistered,
        "ambulance_department": ambulanceDepartment,
        "ambulance_id": ambulanceId,
        "ambulance_doctor": ambulanceDoctor,
        "sos_department": sosDepartment,
        "sos_issue": sosIssue,
        "sos_date": sosDate,
        "sos_contact": sosContact,
        "sos_relative_contact": sosRelativeContact,
        "booking_date": bookingDate,
        "booking_department": bookingDepartment,
        "booking_doctor_name": bookingDoctorName,
        "booking_time_book_start": bookingTimeBookStart,
        "booking_reason": bookingReason,
      };
}

class LabTestName {
  String? testName;
  String? price;
  String? staffAlloted;
  String? duration;

  LabTestName({
    this.testName,
    this.price,
    this.staffAlloted,
    this.duration,
  });

  factory LabTestName.fromJson(Map<String, dynamic> json) => LabTestName(
        testName: json["test_name"],
        price: json["price"],
        staffAlloted: json["staff_alloted"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "test_name": testName,
        "price": price,
        "staff_alloted": staffAlloted,
        "duration": duration,
      };
}