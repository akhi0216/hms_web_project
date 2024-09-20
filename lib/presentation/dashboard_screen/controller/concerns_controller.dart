import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_web_project/repositories/api/services/app_utils.dart';
import 'package:http/http.dart' as http;

class ConcernsController with ChangeNotifier {
  List<String> designationList = [];
  designations() async {
    String uri = "${AppUtils.baseURL}/designations.php";
    try {
      var res = await http.get(Uri.parse(uri));
      designationList = List<String>.from(await jsonDecode(res.body));
      print(res.body);
      print("----------------------$designationList");
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  complaintRegistration({
    required String empcode,
    required String date,
    required String towhom,
    required String complaints,
  }) async {
    String uri = "${AppUtils.baseURL}/complaintreg.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        'empcodecontroller': empcode,
        'complaintcontroller': complaints,
        'datecontroller': date,
        'towhomcontroller': towhom
      });
      print(res.statusCode);
      print(towhom);
      print(res.body);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
