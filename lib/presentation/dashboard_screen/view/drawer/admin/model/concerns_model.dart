// To parse this JSON data, do
//
//     final concernsModel = concernsModelFromJson(jsonString);

import 'dart:convert';

ConcernsModel concernsModelFromJson(String str) =>
    ConcernsModel.fromJson(json.decode(str));

String concernsModelToJson(ConcernsModel data) => json.encode(data.toJson());

class ConcernsModel {
  List<ListElement>? list;

  ConcernsModel({
    this.list,
  });

  factory ConcernsModel.fromJson(Map<String, dynamic> json) => ConcernsModel(
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
  String? empcode;
  String? date;
  String? dep;
  String? towhom;
  String? compl;
  String? complId;

  ListElement({
    this.fname,
    this.empcode,
    this.date,
    this.dep,
    this.towhom,
    this.compl,
    this.complId,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        fname: json["fname"],
        empcode: json["empcode"],
        date: json["date"],
        dep: json["dep"],
        towhom: json["towhom"],
        compl: json["compl"],
        complId: json["compl_id"],
      );

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "empcode": empcode,
        "date": date,
        "dep": dep,
        "towhom": towhom,
        "compl": compl,
        "compl_id": complId,
      };
}
