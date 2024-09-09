import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/doctors/department_wise_availability.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/model/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthController with ChangeNotifier {
  // SampleAuthModel sampleAuthModel = SampleAuthModel();
  List<SampleAuthApimodel> authList = [];
  List deptwiseAuthList = [];

  deptPassing({required String dept}) async {
    authList.clear();
    String uri = "https://cybot.avanzosolutions.in/hms/userauth.php";
    try {
      var res =
          await http.post(Uri.parse(uri), body: {'departcontroller': dept});
      print(res.statusCode);
      // print(res.body);
      log(res.body);
      authList = (jsonDecode(res.body) as List)
          .map(
            (json) => SampleAuthApimodel.fromJson(json),
          )
          .toList();
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  deptempuseridpassing(
      {required String empcode, required String userid}) async {
    String uri = "https://cybot.avanzosolutions.in/hms/userauthpassed.php";
    try {
      var res = await http.post(Uri.parse(uri),
          body: {'empcodecontroller': empcode, 'useridcontroller': userid});
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  deptunauthpassing({required String empcode, required String userid}) async {
    String uri = "https://cybot.avanzosolutions.in/hms/userunauth.php";
    try {
      var res = await http.post(Uri.parse(uri),
          body: {'empcodecontroller': empcode, 'useridcontroller': userid});
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  //  departmentWiseConcerns({required String dept}) {
  //   departmentWiseConcernsList.clear();
  //   for (var i = 0; i < concernsModel.list!.length; i++) {
  //     if (concernsModel.list?[i].dep == dept) {
  //       departmentWiseConcernsList.add(concernsModel.list?[i]);
  //     }
  //   }
  //   print(departmentWiseConcernsList);
  //   notifyListeners();
  // }
}
