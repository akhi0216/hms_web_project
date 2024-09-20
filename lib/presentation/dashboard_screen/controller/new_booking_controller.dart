import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/model/doctor_model_class.dart';
// import 'package:hms_project/model/booking_patient_model.dart';
// import 'package:hms_project/model/doctors_model.dart';
import 'package:hms_web_project/presentation/dashboard_screen/model/newbooking_model.dart';
import 'package:hms_web_project/repositories/api/services/app_utils.dart';
import 'package:http/http.dart' as http;

class BookingPatientController with ChangeNotifier {
  BookingPatientModel patientBookingModel = BookingPatientModel();
  Doctorsmodelclass doctorsmodelclass = Doctorsmodelclass();
  List<String> deptList = [];
  List<String> doctorList = [];
  List<String> doctorIdList = [];

  List<String> timeList = [];
  List<Map<String, dynamic>> listOfDoctors = [];

  List<String> selectedtimeList = [];
  bool? isSuccessful;

  department() async {
    deptList.clear();
    listOfDoctors.clear();
    String uri = "${AppUtils.baseURL}/departments.php";
    try {
      var res = await http.get(Uri.parse(uri));
      deptList = List<String>.from(await jsonDecode(res.body));
      print(deptList);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> doctors(String? dept) async {
    doctorList.clear();
    doctorIdList.clear();
    String uri = "${AppUtils.baseURL}/department_select.php";
    try {
      var res =
          await http.post(Uri.parse(uri), body: {"patientidcontroller": dept});
      // print(res.body);
      var json = await jsonDecode(res.body) as Map<String, dynamic>;
      doctorsmodelclass = Doctorsmodelclass.fromJson(json);
      if (doctorsmodelclass.list!.isNotEmpty) {
        for (var i = 0; i < doctorsmodelclass.list!.length; i++) {
          doctorList.add(doctorsmodelclass.list?[i].name ?? "");
          doctorIdList.add(doctorsmodelclass.list?[i].empcode ?? "");
        }
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  doctorTime(String? empid) async {
    timeList.clear();
    String uri = "${AppUtils.baseURL}/doctortiming.php";
    try {
      var res = await http
          .post(Uri.parse(uri), body: {"patienttimecontroller": empid});
      timeList = List<String>.from(await jsonDecode(res.body));
      // listOfTimeList.add(List<String>.from(await jsonDecode(res.body)));
      // print(timeList);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  listOfTimes({required String? dept, required String? date}) async {
    listOfDoctors.clear();
    await doctors(dept);
    for (var i = 0; i < doctorsmodelclass.list!.length; i++) {
      await doctorTime(doctorsmodelclass.list?[i].empcode);
      await doctorTimeSlots(
          empid: doctorsmodelclass.list?[i].empcode, dept: dept, date: date);
      listOfDoctors.add({
        'name': doctorList[i],
        'timeslots': List<String>.from(timeList),
        'selectedtimes': List<String>.from(selectedtimeList),
      });
      // print("------------------${listOfDoctors[i]['name']}");
      // print("------------------${listOfDoctors[i]['timeslots']}");
      // print("------------------${listOfDoctors[i]['selectedtimes']}");
      print("__________________________$listOfDoctors");
    }
    notifyListeners();
  }

  doctorTimeSlots({
    required String? empid,
    required String? dept,
    required String? date,
  }) async {
    selectedtimeList.clear();
    String uri = "${AppUtils.baseURL}/booktimeslots.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        "doctoridcontroller": empid,
        "departmentidcontroller": dept,
        "datecontroller": date,
      });
      print("-------------${res.body}");
      Map<String, dynamic> timeSlotMap = await jsonDecode(res.body);
      print(timeSlotMap);
      for (var i = 1; i < timeList.length + 2; i++) {
        if (timeSlotMap.containsKey(i.toString())) {
          // selectedtimeList.add(timeSlotList[0][i.toString()]);
          int j = i - 2;
          selectedtimeList.add(j.toString());
          // listOfSelectedTimeList.add(selectedtimeList);
        }
      }
      print("----$selectedtimeList");
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> patientdata(String searchText) async {
    notifyListeners();
    String uri = "${AppUtils.baseURL}/bookingpatient.php";
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
    String uri = "${AppUtils.baseURL}/bookingsave.php";
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
  //   String uri = "${AppUtils.baseURL}/booktimeslots.php";
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
