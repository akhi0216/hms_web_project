// To parse this JSON data, do
//
//     final doctorSearchModel = doctorSearchModelFromJson(jsonString);

import 'dart:convert';

DoctorSearchModel doctorSearchModelFromJson(String str) =>
    DoctorSearchModel.fromJson(json.decode(str));

String doctorSearchModelToJson(DoctorSearchModel data) =>
    json.encode(data.toJson());

class DoctorSearchModel {
  String? fname;
  String? eid;
  String? medlic;
  String? addr;
  String? mob;
  String? yrofgrad;
  String? curpos;
  String? availabilitystart;
  String? availabilityend;
  DateTime? dob;
  String? school;
  String? department;
  String? email;

  DoctorSearchModel({
    this.fname,
    this.eid,
    this.medlic,
    this.addr,
    this.mob,
    this.yrofgrad,
    this.curpos,
    this.availabilitystart,
    this.availabilityend,
    this.dob,
    this.school,
    this.department,
    this.email,
  });

  factory DoctorSearchModel.fromJson(Map<String, dynamic> json) =>
      DoctorSearchModel(
        fname: json["fname"],
        eid: json["eid"],
        medlic: json["medlic"],
        addr: json["addr"],
        mob: json["mob"],
        yrofgrad: json["yrofgrad"],
        curpos: json["curpos"],
        availabilitystart: json["availabilitystart"],
        availabilityend: json["availabilityend"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        school: json["school"],
        department: json["Department"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "eid": eid,
        "medlic": medlic,
        "addr": addr,
        "mob": mob,
        "yrofgrad": yrofgrad,
        "curpos": curpos,
        "availabilitystart": availabilitystart,
        "availabilityend": availabilityend,
        "dob": dob?.toIso8601String(),
        "school": school,
        "Department": department,
        "email": email,
      };
}
