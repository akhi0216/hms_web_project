import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/model/concerns_model.dart';
import 'package:http/http.dart' as http;

class ViewConcernsController with ChangeNotifier {
  List<ListElement?> departmentWiseConcernsList = [];
  ConcernsModel concernsModel = ConcernsModel();

  Future<void> resolveController(
      {required String complaintId, required String modeController}) async {
    String url = "https://cybot.avanzosolutions.in/hms/complaintauth.php";
    var res = await http.post(Uri.parse(url), body: {
      'compidcontroller': complaintId,
      'modecontroller': modeController,
    });
    print(res.body);
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
