import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_web_project/repositories/api/services/app_utils.dart';
import 'package:http/http.dart' as http;

class RadiologyController with ChangeNotifier {
  List<String> selectedtimeList = [];
  List radiologyHistoryList = [];
  String? bookingId;
  List<String> timeList = [
    '8:00',
    '9:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00'
  ];

  Future<void> radiologyTimePicker(
      {required String date, required String dept}) async {
    log("Date sent : $date");
    if (date.isEmpty) {
      log("Error: Date is empty or invalid.");
      return;
    }
    String uri = "${AppUtils.baseURL}/radiologytimeslot.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        'datecontroller': date,
        'departmentcontroller': dept,
      });
      log("Response: ${res.body}");

      Map<String, dynamic> timeSlotMap = jsonDecode(res.body);
      log("Time slot map: $timeSlotMap");

      selectedtimeList.clear();
      for (var i = 2; i < timeList.length + 2; i++) {
        if (timeSlotMap.containsKey((i).toString())) {
          selectedtimeList.add((i - 1).toString());
        }
      }
      log("Selected time list: $selectedtimeList");
    } catch (e) {
      log('my error:${e.toString()}');
    }
    notifyListeners();
  }

  Future<void> callBookingId({required String dept}) async {
    String url = '${AppUtils.baseURL}/countid.php';
    var res = await http.post(Uri.parse(url), body: {
      'departmentidcontroller': dept,
    }); 
    log(res.body);
    bookingId = res.body;
  }

  Future<void> radiologyHistory() async {
    String url = '${AppUtils.baseURL}/radiology_history.php';
    var res = await http.get(Uri.parse(url));
    // log(res.body);
    radiologyHistoryList = (jsonDecode(res.body) as List)
        .map(
          (json) => json,
        )
        .toList();
    log(radiologyHistoryList.toString());
  }
}