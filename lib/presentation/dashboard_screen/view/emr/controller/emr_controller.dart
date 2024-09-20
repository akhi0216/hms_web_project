import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/emr/model/emr_ip_model.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/emr/model/emr_op_model.dart';
import 'package:hms_web_project/repositories/api/services/app_utils.dart';
import 'package:http/http.dart' as http;

class EmrScreenController with ChangeNotifier {
  EmrIpModel emrIpModel = EmrIpModel();
  EmrOpModel emrOpModel = EmrOpModel();
  List<String> ipIdList = [];
  List<String> opIdList = [];
  List emrRadiologyList = [];
  // ipEmrDetails() async {
  //   String url = "";
  //   var res = await http.get(Uri.parse(url));
  //   print(res.body);
  // }
  Future<void> ipEmrDetails({required String pid, required String ipid}) async {
    String uri = "${AppUtils.baseURL}/emrtestnew.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        'patientidcontroller': pid,
        'ipnocontroller': ipid,
      });
      print(res.body);
      var json = await jsonDecode(res.body) as Map<String, dynamic>;
      print(json);
      emrIpModel = EmrIpModel.fromJson(json);
    } on Exception catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> opEmrDetails({required String pid, required String opid}) async {
    String uri = "${AppUtils.baseURL}/emrop.php";
    var res = await http.post(Uri.parse(uri), body: {
      'patientidcontroller': pid,
      'opnocontroller': opid,
    });
    print(res.body);
    var json = await jsonDecode(res.body) as Map<String, dynamic>;
    print(json);
    emrOpModel = EmrOpModel.fromJson(json);
    notifyListeners();
  }

  Future<void> ipidFetch({required String pid}) async {
    ipIdList.clear();
    String url = '${AppUtils.baseURL}/ipnofetch.php';
    var res = await http.post(Uri.parse(url), body: {
      'patientidcontroller': pid,
    });
    print(res.body);
    ipIdList = List<String>.from(jsonDecode(res.body));
    print(ipIdList);
    notifyListeners();
  }

  Future<void> opidFetch({required String pid}) async {
    opIdList.clear();
    String url = '${AppUtils.baseURL}/opnofetch.php';
    var res = await http.post(Uri.parse(url), body: {
      'patientidcontroller': pid,
    });
    print(res.body);
    opIdList = List<String>.from(jsonDecode(res.body));
    print(opIdList);
    notifyListeners();
  }

  Future<void> emrRadiologyDetails({required String pid}) async {
    String url =
        '${AppUtils.baseURL}/radiology_patient_details.php';

    var res = await http.post(Uri.parse(url), body: {
      'patientidcontroller': pid,
    });
    // print("hi");
    print(res.body);
    // emrRadiologyList = List.from(jsonDecode(res.body));
    // print(emrRadiologyDetails);
    notifyListeners();
  }
}
