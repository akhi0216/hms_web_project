import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookingDialysisController with ChangeNotifier {
  bool? isSuccessful;

  List<String> selectedtimeList = [];
  List timeList = [
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
  departmentDialysis(String date) async {
    print("hello");
    String uri = "https://cybot.avanzosolutions.in/hms/Dialysistimeslot.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {'datecontroller': date});
      // log("Response status: ${res.statusCode}");
      // log(res.body);

      // timeslots

      Map<String, dynamic> timeSlotMap = await jsonDecode(res.body);
      print("____________$timeSlotMap");
      for (var i = 2; i < timeSlotMap.length + 1; i++) {
        selectedtimeList.add(timeSlotMap[i.toString()]);
      }
      print("-----------${selectedtimeList}");
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
