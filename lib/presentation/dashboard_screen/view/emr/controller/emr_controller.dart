import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/emr/model/emr_ip_model.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/emr/model/emr_op_model.dart';
import 'package:http/http.dart' as http;

class EmrScreenController with ChangeNotifier {
  EmrIpModel emrIpModel = EmrIpModel();
  EmrOpModel emrOpModel = EmrOpModel();
  List<String> ipIdList = [];
  List<String> opIdList = [];
  // ipEmrDetails() async {
  //   String url = "";
  //   var res = await http.get(Uri.parse(url));
  //   print(res.body);
  // }
  Future<void> ipEmrDetails({required String pid, required String ipid}) async {
    String uri = "https://cybot.avanzosolutions.in/hms/emrtestnew.php";
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
    String uri = "https://cybot.avanzosolutions.in/hms/emrop.php";
    var res = await http.post(Uri.parse(uri), body: {
      'patientidcontroller': pid,
      'ipnocontroller': opid,
    });
    print(res.body);
    var json = await jsonDecode(res.body) as Map<String, dynamic>;
    print(json);
    emrOpModel = EmrOpModel.fromJson(json);
    notifyListeners();
  }

  Future<void> ipidFetch({required String pid}) async {
    ipIdList.clear();
    String url = 'https://cybot.avanzosolutions.in/hms/ipnofetch.php';
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
    String url = 'https://cybot.avanzosolutions.in/hms/opnofetch.php';
    var res = await http.post(Uri.parse(url), body: {
      'patientidcontroller': pid,
    });
    print(res.body);
    opIdList = List<String>.from(jsonDecode(res.body));
    print(opIdList);
    notifyListeners();
  }
}