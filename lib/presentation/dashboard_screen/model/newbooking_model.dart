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
  String? email;
  String? phn;
  String? dep;
  String? empid;

  ListElement({
    this.fname,
    this.lname,
    this.doc,
    this.email,
    this.phn,
    this.dep,
    this.empid,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        fname: json["fname"],
        lname: json["lname"],
        doc: json["doc"],
        email: json["email"],
        phn: json["phn"],
        dep: json["dep"],
        empid: json["empid"],
      );

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "doc": doc,
        "email": email,
        "phn": phn,
        "dep": dep,
        "empid": empid,
      };
}
