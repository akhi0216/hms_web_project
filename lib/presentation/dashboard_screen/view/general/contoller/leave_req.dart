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
}
