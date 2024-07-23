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
}