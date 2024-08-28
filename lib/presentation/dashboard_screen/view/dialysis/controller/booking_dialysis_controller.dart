import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookingDialysisController with ChangeNotifier {
  List<String> selectedtimeList = [];
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
