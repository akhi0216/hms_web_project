import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/model/doctor_model_class.dart';
// import 'package:hms_project/model/booking_patient_model.dart';
// import 'package:hms_project/model/doctors_model.dart';
import 'package:hms_web_project/presentation/dashboard_screen/model/newbooking_model.dart';
import 'package:http/http.dart' as http;

class BookingPatientController with ChangeNotifier {
  BookingPatientModel patientBookingModel = BookingPatientModel();
  Doctorsmodelclass doctorsmodelclass = Doctorsmodelclass();
  List<String> deptList = [];
  List<String> timeList = [];
  List<String> selectedtimeList = [];
  bool? isSuccessful;

  department() async {
    String uri = "https://cybot.avanzosolutions.in/hms/departments.php";
    try {
      var res = await http.get(Uri.parse(uri));
      deptList = List<String>.from(await jsonDecode(res.body));
      print(deptList);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  doctors(String? dept) async {
    String uri = "https://cybot.avanzosolutions.in/hms/department_select.php";
    try {
      var res =
          await http.post(Uri.parse(uri), body: {"patientidcontroller": dept});
      print(res.body);
      var json = await jsonDecode(res.body) as Map<String, dynamic>;
      doctorsmodelclass = Doctorsmodelclass.fromJson(json);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  doctorTime(String? empid) async {
    String uri = "https://cybot.avanzosolutions.in/hms/doctortiming.php";
    try {
      var res = await http
          .post(Uri.parse(uri), body: {"patienttimecontroller": empid});
      timeList = List<String>.from(await jsonDecode(res.body));
      print(timeList);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  doctorTimeSlots({
    required String? empid,
    required String? dept,
  }) async {
    selectedtimeList.clear();
    String uri = "https://cybot.avanzosolutions.in/hms/booktimeslots.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        "doctoridcontroller": empid,
        "departmentidcontroller": dept,
        // "datecontroller": date
      });
      print(res.body);
      // List timeSlotList = await jsonDecode(res.body);
      // print(timeSlotList);
      // for (var i = 0; i < timeList.length; i++) {
      //   if (timeSlotList[0][i.toString()] == null) {
      //     // selectedtimeList.add(timeSlotList[0][i.toString()]);
      //     selectedtimeList.add(i.toString());
      //   }
      // }
      // print("----$selectedtimeList");
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> patientdata(String searchText) async {
    notifyListeners();
    String uri = "https://cybot.avanzosolutions.in/hms/bookingpatient.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        "patientidcontroller": searchText,
      });
      var json = await jsonDecode(res.body) as Map<String, dynamic>;
      print(json);
      patientBookingModel = BookingPatientModel.fromJson(json);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  patientBooking({
    required String patientId,
    required String fName,
    required String lName,
    required String eMail,
    required String phNum,
    required String dept,
    required String docId,
    required String reason,
    required String date,
    required String time,
  }) async {
    String uri = "https://cybot.avanzosolutions.in/hms/bookingsave.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        "patientidcontroller": patientId,
        "FirstNamecontroller": fName,
        "LastNamecontroller": lName,
        "emailcontroller": eMail,
        "mobilecontroller": phNum,
        "departmentcontroller": dept,
        "doctornamecontroller": docId,
        "reasoncontroller": reason,
        "datecontroller": date,
        "timecontroller": time,
      });
      print("booking : ${res.body}");
      isSuccessful = res.statusCode == 200 ? true : false;
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

//

  // timeslotBooking({
  //   required String dept,
  //   required String docId,
  // }) async {
  //   String uri = "https://cybot.avanzosolutions.in/hms/booktimeslots.php";
  //   try {
  //     var res = await http.post(Uri.parse(uri), body: {
  //       "departmentcontroller": dept,
  //       "doctornamecontroller": docId,
  //     });
  //     print(res.body);
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   notifyListeners();
  // }

//
}
