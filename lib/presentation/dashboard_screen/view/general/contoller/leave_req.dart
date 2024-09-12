import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/model/leave_req.dart';
import 'package:http/http.dart' as http;

class LeaveReqControllers with ChangeNotifier {
  // List<SampleAuthApimodel> authList = [];

  List<SampleLeavereqApimodel> leavereqList = [];
  // List deptwiseAuthList = [];
  List deptwiseLeavereqList = [];

  deptPassing({required String dept}) async {
    String uri = "https://cybot.avanzosolutions.in/hms/leaverequestview.php";
    try {
      var res =
          await http.post(Uri.parse(uri), body: {'departmentcontroller': dept});
      print(res.statusCode);
      print(res.body);
      // --------------------------------------
      leavereqList = (jsonDecode(res.body) as List)
          .map(
            (json) => SampleLeavereqApimodel.fromJson(json),
          )
          .toList();

      // ------------------------------------
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  deptAuthpassing(
      {required String date,
      required String leaveid,
      required String empid}) async {
    String uri = "https://cybot.avanzosolutions.in/hms/leaverequestauth.php";

    try {
      var res = await http.post(Uri.parse(uri), body: {
        'datecontroller': date,
        'leaveidcontroller': leaveid,
        'approvedbycontroller': empid
      });
      log('empid - ${empid}');
      log(date);
      log(leaveid);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

//
  deptUnauthpassing(
      {required String date,
      required String leaveid,
      required String empid}) async {
    String uri = "https://cybot.avanzosolutions.in/hms/leaverequestunauth.php";

    try {
      var res = await http.post(Uri.parse(uri), body: {
        'datecontroller': date,
        'leaveidcontroller': leaveid,
        'approvedbycontroller': empid
      });
      log('empid - ${empid}');
      log(date);
      log(leaveid);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  int? leaveRequest;
  leaveRequestFunction({
    required String eid,
    required String currentDate,
    required String reason,
    required String startDate,
    required String endDate,
    required String dept,
  }) async {
    if (endDate == null || endDate == '') {
      endDate = startDate;
    }
    String url = 'https://cybot.avanzosolutions.in/hms/leaverequest.php';
    var res = await http.post(Uri.parse(url), body: {
      'empcodecontroller': eid,
      'datecontroller': currentDate,
      'reasoncontroller': reason,
      'leaverequestedoncontroller': startDate,
      'returncontroller': endDate,
      'departmentcontroller': dept,
    });
    print(res.body);
    print(res.statusCode);
    leaveRequest = res.statusCode;
    notifyListeners();
  }
}
