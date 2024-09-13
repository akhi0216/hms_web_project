// To parse this JSON data, do
//
//     final sampleViewfeedbackApimodel = sampleViewfeedbackApimodelFromJson(jsonString);

import 'dart:convert';

List<SampleViewfeedbackApimodel> sampleViewfeedbackApimodelFromJson(String str) => List<SampleViewfeedbackApimodel>.from(json.decode(str).map((x) => SampleViewfeedbackApimodel.fromJson(x)));

String sampleViewfeedbackApimodelToJson(List<SampleViewfeedbackApimodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SampleViewfeedbackApimodel {
    String? name;
    String? date;
    String? id;
    String? response;
    String? mobile;
    String? mail;
    String? feedbackid;

    SampleViewfeedbackApimodel({
        this.name,
        this.date,
        this.id,
        this.response,
        this.mobile,
        this.mail,
        this.feedbackid,
    });

    factory SampleViewfeedbackApimodel.fromJson(Map<String, dynamic> json) => SampleViewfeedbackApimodel(
        name: json["name"],
        date: json["date"],
        id: json["id"],
        response: json["response"],
        mobile: json["mobile"],
        mail: json["mail"],
        feedbackid: json["feedbackid"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "date": date,
        "id": id,
        "response": response,
        "mobile": mobile,
        "mail": mail,
        "feedbackid": feedbackid,
    };
}
