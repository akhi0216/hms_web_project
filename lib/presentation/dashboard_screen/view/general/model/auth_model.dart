// To parse this JSON data, do
//
//     final sampleAuthApimodel = sampleAuthApimodelFromJson(jsonString);

import 'dart:convert';

List<SampleAuthApimodel> sampleAuthApimodelFromJson(String str) => List<SampleAuthApimodel>.from(json.decode(str).map((x) => SampleAuthApimodel.fromJson(x)));

String sampleAuthApimodelToJson(List<SampleAuthApimodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SampleAuthApimodel {
    String? fname;
    String? empcode;
    String? date;
    String? des;
    String? towhom;
    String? mob;
    String? userId;
    String? dep;
    String? email;

    SampleAuthApimodel({
        this.fname,
        this.empcode,
        this.date,
        this.des,
        this.towhom,
        this.mob,
        this.userId,
        this.dep,
        this.email,
    });

    factory SampleAuthApimodel.fromJson(Map<String, dynamic> json) => SampleAuthApimodel(
        fname: json["fname"],
        empcode: json["empcode"],
        date: json["date"],
        des: json["des"],
        towhom: json["towhom"],
        mob: json["mob"],
        userId: json["user_id"],
        dep: json["dep"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "fname": fname,
        "empcode": empcode,
        "date": date,
        "des": des,
        "towhom": towhom,
        "mob": mob,
        "user_id": userId,
        "dep": dep,
        "email": email,
    };
}
