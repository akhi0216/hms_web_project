import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/model/allotted_leave.dart';
import 'package:http/http.dart' as http;

class AllotedLeaveController with ChangeNotifier {
  List<SampleAllotedLeaveApimodel> allottedleaveList = [];
  List deptwiseAllottedleaveList = [];
  // List<SampleAuthApimodel> authList = [];
  // List deptwiseAuthList = [];

// -----------------------------

  deptPassing({required String dept}) async {
    allottedleaveList.clear();
    String uri = "https://cybot.avanzosolutions.in/hms/allotedleave.php";
    try {
      var res =
          await http.post(Uri.parse(uri), body: {'departmentcontroller': dept});
      print(res.statusCode);
      print(res.body);
      // --------------------------------------
      allottedleaveList = (jsonDecode(res.body) as List)
          .map(
            (json) => SampleAllotedLeaveApimodel.fromJson(json),
          )
          .toList();

      // ------------------------------------
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
