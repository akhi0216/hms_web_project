// To parse this JSON data, do
//
//     final bookingPatientModel = bookingPatientModelFromJson(jsonString);

import 'dart:convert';

BookingPatientModel bookingPatientModelFromJson(String str) =>
    BookingPatientModel.fromJson(json.decode(str));

String bookingPatientModelToJson(BookingPatientModel data) =>
    json.encode(data.toJson());

class BookingPatientModel {
  List<ListElement>? list;

  BookingPatientModel({
    this.list,
  });
  factory BookingPatientModel.fromJson(Map<String, dynamic> json) =>
      BookingPatientModel(
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
  String? doc;
  String? presc;
  String? addr;
  String? phn;
  String? dep;

  ListElement({
    this.fname,
    this.lname,
    this.doc,
    this.presc,
    this.addr,
    this.phn,
    this.dep,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        fname: json["fname"],
        lname: json["lname"],
        doc: json["doc"],
        presc: json["presc"],
        addr: json["addr"],
        phn: json["phn"],
        dep: json["dep"],
      );

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "doc": doc,
        "presc": presc,
        "addr": addr,
        "phn": phn,
        "dep": dep,
      };
}
