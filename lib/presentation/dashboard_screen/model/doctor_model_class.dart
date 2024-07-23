// To parse this JSON data, do
//
//     final doctorsmodelclass = doctorsmodelclassFromJson(jsonString);

import 'dart:convert';

Doctorsmodelclass doctorsmodelclassFromJson(String str) =>
    Doctorsmodelclass.fromJson(json.decode(str));

String doctorsmodelclassToJson(Doctorsmodelclass data) =>
    json.encode(data.toJson());

class Doctorsmodelclass {
  List<ListElement>? list;

  Doctorsmodelclass({
    this.list,
  });

  factory Doctorsmodelclass.fromJson(Map<String, dynamic> json) =>
      Doctorsmodelclass(
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
  String? name;
  String? time;

  ListElement({
    this.name,
    this.time,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        name: json["name"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "time": time,
      };
}
