// To parse this JSON data, do
//
//     final sampleLeavereqApimodel = sampleLeavereqApimodelFromJson(jsonString);

import 'dart:convert';

List<SampleLeavereqApimodel> sampleLeavereqApimodelFromJson(String str) =>
    List<SampleLeavereqApimodel>.from(
        json.decode(str).map((x) => SampleLeavereqApimodel.fromJson(x)));

String sampleLeavereqApimodelToJson(List<SampleLeavereqApimodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SampleLeavereqApimodel {
  String? name;
  String? date;
  String? dep;
  String? enddate;
  String? reason;
  String? leaveid;

  SampleLeavereqApimodel({
    this.name,
    this.date,
    this.dep,
    this.enddate,
    this.reason,
    this.leaveid,
  });

  factory SampleLeavereqApimodel.fromJson(Map<String, dynamic> json) =>
      SampleLeavereqApimodel(
        name: json["name"],
        date: json["date"],
        dep: json["dep"],
        enddate: json["enddate"],
        reason: json["Reason"],
        leaveid: json["leaveid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        // "date":
        //     "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "date": date,
        "dep": dep,
        "enddate": enddate,
        "Reason": reason,
        "leaveid": leaveid,
      };
}
