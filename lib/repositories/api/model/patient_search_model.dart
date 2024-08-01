// To parse this JSON data, do
//
//     final patientSearchModel = patientSearchModelFromJson(jsonString);

import 'dart:convert';

PatientSearchModel patientSearchModelFromJson(String str) =>
    PatientSearchModel.fromJson(json.decode(str));

String patientSearchModelToJson(PatientSearchModel data) =>
    json.encode(data.toJson());

class PatientSearchModel {
  List<ListElement>? list;

  PatientSearchModel({
    this.list,
  });

  factory PatientSearchModel.fromJson(Map<String, dynamic> json) =>
      PatientSearchModel(
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  String? fname;
  String? lname;
  String? pid;
  String? doc;
  String? presc;
  String? mob;
  String? dob;
  String? address;
  String? department;
  String? email;
  String? img;

  ListElement({
    this.fname,
    this.lname,
    this.pid,
    this.doc,
    this.presc,
    this.mob,
    this.dob,
    this.address,
    this.department,
    this.email,
    this.img,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        fname: json["fname"],
        lname: json["lname"],
        pid: json["pid"],
        doc: json["doc"],
        presc: json["presc"],
        mob: json["mob"],
        dob: json["dob"],
        address: json["Address"],
        department: json["Department"],
        email: json["email"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "pid": pid,
        "doc": doc,
        "presc": presc,
        "mob": mob,
        "dob": dob,
        "Address": address,
        "Department": department,
        "email": email,
        "img": img,
      };
}
