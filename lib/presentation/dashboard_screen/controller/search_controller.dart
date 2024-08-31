import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/model/doctor_search.dart';
import 'package:hms_web_project/repositories/api/model/patient_search_model.dart';
import 'package:http/http.dart' as http;

class TextSearchController with ChangeNotifier {
  Map<String, dynamic> ret = {};
  Map<String, dynamic> retDoc = {};

  PatientSearchModel patientSearchModel = PatientSearchModel();
  DoctorSearchModel doctorSearchModel = DoctorSearchModel();

  searchPatient(String searchText) async {
    notifyListeners();
    ret.clear();
    String url = "https://cybot.avanzosolutions.in/hms/patientname.php";
    try {
      var res = await http.post(Uri.parse(url), body: {
        "patientnamecontroller": searchText,
      });
      print(res.body);
      ret = jsonDecode(res.body);
      print(ret);
      patientSearchModel = PatientSearchModel.fromJson(ret);
    } on Exception catch (e) {
      print(e);
    }
    notifyListeners();
    return ret;
  }

  searchDoctor(String searchText) async {
    retDoc.clear();
    String url = "https://cybot.avanzosolutions.in/hms/doctorsearch.php";
    try {
      var res = await http.post(Uri.parse(url), body: {
        "patientnamecontroller": searchText,
      });
      print(res.body);
      retDoc = jsonDecode(res.body);
      print(retDoc);
      doctorSearchModel = DoctorSearchModel.fromJson(retDoc);
    } on Exception catch (e) {
      print(e);
    }
    notifyListeners();
    return retDoc;
  }
}
