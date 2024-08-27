import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/model/concerns_model.dart';
import 'package:http/http.dart' as http;

class ConcernsController with ChangeNotifier {
  List<String> designationList = [];
  List<ListElement?> departmentWiseConcernsList = [];
  ConcernsModel concernsModel = ConcernsModel();
  designations() async {
    String uri = "https://cybot.avanzosolutions.in/hms/designations.php";
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
    String uri = "https://cybot.avanzosolutions.in/hms/complaintreg.php";
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

  concernsListFunction({
    required String des,
    required String empcode,
  }) async {
    try {
      String uri =
          "https://cybot.avanzosolutions.in/hms/complaintfetchWithoutdate.php";
      var res = await http.post(Uri.parse(uri), body: {
        'designationcontroller': des,
        'empcodecontroller': empcode,
      });
      print(res.body);
      var json = await jsonDecode(res.body);
      // print(json);
      concernsModel = ConcernsModel.fromJson(json);
    } on Exception catch (e) {
      print(e);
    }
    notifyListeners();
  }

  departmentWiseConcerns({required String dept}) {
    departmentWiseConcernsList.clear();
    for (var i = 0; i < concernsModel.list!.length; i++) {
      if (concernsModel.list?[i].dep == dept) {
        departmentWiseConcernsList.add(concernsModel.list?[i]);
      }
    }
    print(departmentWiseConcernsList);
    notifyListeners();
  }

  dateWiseConcerns({required String date}) {
    departmentWiseConcernsList.clear();
    for (var i = 0; i < concernsModel.list!.length; i++) {
      if (concernsModel.list?[i].date == date) {
        departmentWiseConcernsList.add(concernsModel.list?[i]);
      }
    }
    print(departmentWiseConcernsList);
    notifyListeners();
  }
}
