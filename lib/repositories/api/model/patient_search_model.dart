// To parse this JSON data, do
//
//     final patientSearchModel = patientSearchModelFromJson(jsonString);

import 'dart:convert';

PatientSearchModel patientSearchModelFromJson(String str) => PatientSearchModel.fromJson(json.decode(str));

String patientSearchModelToJson(PatientSearchModel data) => json.encode(data.toJson());

class PatientSearchModel {
    List<ListElement>? list;

    PatientSearchModel({
        this.list,
    });

    factory PatientSearchModel.fromJson(Map<String, dynamic> json) => PatientSearchModel(
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ListElement {
    String? fname;
    String? lname;
    String? pid;
    String? doc;
    String? presc;

    ListElement({
        this.fname,
        this.lname,
        this.pid,
        this.doc,
        this.presc,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        fname: json["fname"],
        lname: json["name"],
        pid: json["pid"],
        doc: json["doc"],
        presc: json["presc"],
    );

    Map<String, dynamic> toJson() => {
        "fname": fname,
        "name": lname,
        "pid": pid,
        "doc": doc,
        "presc": presc,
    };
}
