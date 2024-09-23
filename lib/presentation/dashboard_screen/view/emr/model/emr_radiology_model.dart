// To parse this JSON data, do
//
//     final emrRadiologyModel = emrRadiologyModelFromJson(jsonString);

import 'dart:convert';

EmrRadiologyModel emrRadiologyModelFromJson(String str) => EmrRadiologyModel.fromJson(json.decode(str));

String emrRadiologyModelToJson(EmrRadiologyModel data) => json.encode(data.toJson());

class EmrRadiologyModel {
    String? patientid;
    String? firstName;
    String? lastName;
    String? department;
    String? doctorName;
    String? reason;
    String? dateBook;
    String? timeBookStart;
    String? timeBookEnd;

    EmrRadiologyModel({
        this.patientid,
        this.firstName,
        this.lastName,
        this.department,
        this.doctorName,
        this.reason,
        this.dateBook,
        this.timeBookStart,
        this.timeBookEnd,
    });

    factory EmrRadiologyModel.fromJson(Map<String, dynamic> json) => EmrRadiologyModel(
        patientid: json["patientid"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        department: json["department"],
        doctorName: json["doctor_name"],
        reason: json["reason"],
        dateBook: json["date_book"],
        timeBookStart: json["time_book_start"],
        timeBookEnd: json["time_book_end"],
    );

    Map<String, dynamic> toJson() => {
        "patientid": patientid,
        "FirstName": firstName,
        "LastName": lastName,
        "department": department,
        "doctor_name": doctorName,
        "reason": reason,
        "date_book": dateBook,
        "time_book_start": timeBookStart,
        "time_book_end": timeBookEnd,
    };
}
