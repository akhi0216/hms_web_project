import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/model/doctor_model_class.dart';
import 'package:hms_web_project/presentation/dashboard_screen/model/doctor_search.dart';
import 'package:http/http.dart' as http;

class StaffListController with ChangeNotifier {
  List deptList = [];
  List<Map<String, dynamic>> staffList = [];
  // List<String> doctorList = [];
  Doctorsmodelclass? doctorsmodelclass;
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

  staffListFunction() async {
    String uri = "https://cybot.avanzosolutions.in/hms/department_select.php";
    try {
      for (var i = 0; i < deptList.length; i++) {
        var res = await http
            .post(Uri.parse(uri), body: {"patientidcontroller": deptList[i]});
        var json = await jsonDecode(res.body) as Map<String, dynamic>;
        // print("${deptList[i]}--- $json");
        if (json.containsKey("list")) {
          doctorsmodelclass = Doctorsmodelclass.fromJson(json);
          for (var j = 0; j < doctorsmodelclass!.list!.length; j++) {
            staffList.add({
              "dept": deptList[i],
              "doc": doctorsmodelclass?.list?[j].name ?? ""
            });
            // doctorList.add(doctorsmodelclass?.list?[j].name ?? "");
          }
        }
      }
      print("----------------$staffList");
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
