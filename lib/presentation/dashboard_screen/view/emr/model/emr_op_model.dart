// To parse this JSON data, do
//
//     final emrOpDetailsModel = emrOpDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:hms_web_project/presentation/dashboard_screen/view/emr/model/emr_ip_model.dart';

EmrOpModel emrOpDetailsModelFromJson(String str) =>
    EmrOpModel.fromJson(json.decode(str));

String emrOpDetailsModelToJson(EmrOpModel data) => json.encode(data.toJson());

class EmrOpModel {
  String? opno;
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

  EmrOpModel({
    this.opno,
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

  factory EmrOpModel.fromJson(Map<String, dynamic> json) => EmrOpModel(
        opno: json["opno"],
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
        "opno": opno,
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
