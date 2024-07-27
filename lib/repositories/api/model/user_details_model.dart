import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) =>
    UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) =>
    json.encode(data.toJson());

class UserDetailsModel {
  String? uname;
  String? eid;
  String? des;

  UserDetailsModel({
    this.uname,
    this.eid,
    this.des,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        uname: json["uname"],
        eid: json["eid"],
        des: json["des"],
      );

  Map<String, dynamic> toJson() => {
        "uname": uname,
        "eid": eid,
        "des": des,
      };
}
