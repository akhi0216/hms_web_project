// To parse this JSON data, do
//
//     final sampleAllotedLeaveApimodel = sampleAllotedLeaveApimodelFromJson(jsonString);

import 'dart:convert';

List<SampleAllotedLeaveApimodel> sampleAllotedLeaveApimodelFromJson(String str) => List<SampleAllotedLeaveApimodel>.from(json.decode(str).map((x) => SampleAllotedLeaveApimodel.fromJson(x)));

String sampleAllotedLeaveApimodelToJson(List<SampleAllotedLeaveApimodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SampleAllotedLeaveApimodel {
    String? name;
    String? date;
    String? dep;
    String? leaveApproved;
    String? status;
    String? enddate;
    String? reason;
    String? approvedBy;

    SampleAllotedLeaveApimodel({
        this.name,
        this.date,
        this.dep,
        this.leaveApproved,
        this.status,
        this.enddate,
        this.reason,
        this.approvedBy,
    });

    factory SampleAllotedLeaveApimodel.fromJson(Map<String, dynamic> json) => SampleAllotedLeaveApimodel(
        name: json["name"],
        date: json["date"],
        dep: json["dep"],
        leaveApproved: json["leave_approved"],
        status: json["status"],
        enddate: json["enddate"],
        reason: json["Reason"],
        approvedBy: json["Approved_by"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "date": date,
        "dep": dep,
        "leave_approved": leaveApproved,
        "status": status,
        "enddate": enddate,
        "Reason": reason,
        "Approved_by": approvedBy,
    };
}
