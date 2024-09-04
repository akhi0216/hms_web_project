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
  // departmentDialysis(String date) async {
  //   print("hello");
  //   String uri = "https://cybot.avanzosolutions.in/hms/Dialysistimeslot.php";
  //   try {
  //     var res = await http.post(Uri.parse(uri), body: {'datecontroller': date});
  //     // log("Response status: ${res.statusCode}");
  //     log(res.body);

  //     // timeslots

  //     Map<String, dynamic> timeSlotMap = await jsonDecode(res.body);
  //     print("____________$timeSlotMap");
  //     for (var i = 2; i < timeSlotMap.length + 1; i++) {
  //       selectedtimeList.add(timeSlotMap[i.toString()]);
  //     }
  //     print("-----------${selectedtimeList}");
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   notifyListeners();
  // }

  // dialysisSaving({
  //   required String patientid,
  //   required String firstname,
  //   required String lstname,
  //   required String email,
  //   required String phn,
  //   required String dept,
  //   required String docid,
  //   required String date,
  //   required String time,
  //   required String reason,
  // }) async {
  //   log("date: $date");
  //   String uri = "https://cybot.avanzosolutions.in/hms/bookingsave.php";
  //   try {
  //     var res = await http.post(Uri.parse(uri), body: {
  //       'patientidcontroller': patientid,
  //       'FirstNamecontroller': firstname,
  //       'LastNamecontroller': lstname,
  //       'emailcontroller': email,
  //       'mobilecontroller': phn,
  //       'departmentcontroller': dept,
  //       'doctornamecontroller': docid,
  //       'reasoncontroller': reason,
  //       'datecontroller': date,
  //       'timecontroller': time
  //     });
  //     print(res.statusCode);
  //     log(res.body);
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   notifyListeners();
  // }

  // -------------
  departmentDialysis(String date) async {
    log("Date sent : $date");

    if (date.isEmpty) {
      log("Error: Date is empty or invalid.");
      return;
    }

    String uri = "https://cybot.avanzosolutions.in/hms/Dialysistimeslot.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {'datecontroller': date});
      log("Response: ${res.body}");

      Map<String, dynamic> timeSlotMap = jsonDecode(res.body);
      log("Time slot map: $timeSlotMap");

      // selectedtimeList.clear();
      for (var i = 2; i < timeList.length + 2; i++) {
        if (timeSlotMap.containsKey(i.toString())) {
          selectedtimeList.add((i - 1).toString());
        }
      }
      log("Selected time list: $selectedtimeList");
    } catch (e) {
      log('my error:${e.toString()}');
    }
    notifyListeners();
  }

  dialysisSaving({
    required String patientid,
    required String firstname,
    required String lstname,
    required String email,
    required String phn,
    required String dept,
    required String docid,
    required String date,
    required String time,
    required String reason,
  }) async {
    log("Date sent for dialysisSaving: $date");

    if (date.isEmpty) {
      log("Error: Date is empty or invalid.");
      return;
    }
    String uri = "https://cybot.avanzosolutions.in/hms/bookingsave.php";
    try {
      // String department = '29';
      var res = await http.post(Uri.parse(uri), body: {
        'patientidcontroller': patientid,
        'FirstNamecontroller': firstname,
        'LastNamecontroller': lstname,
        'emailcontroller': email,
        'mobilecontroller': phn,
        'departmentcontroller': 'Dialysis',
        'doctornamecontroller': docid,
        'reasoncontroller': reason,
        'datecontroller': date,
        'timecontroller': time,
      });

      log("Response status from dialysisSaving: ${res.statusCode}");
      log("Response body from dialysisSaving: ${res.body}");

      isSuccessful = res.statusCode == 200;
    } catch (e) {
      log("Error in dialysisSaving: ${e.toString()}");
      isSuccessful = false;
    }
    notifyListeners();
  }
}
