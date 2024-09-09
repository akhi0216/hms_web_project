import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/emr/model/emr_details_model.dart';
import 'package:http/http.dart' as http;

class EmrScreenController with ChangeNotifier {
  EmrDetailsModel emrDetailsModel = EmrDetailsModel();
  // ipEmrDetails() async {
  //   String url = "";
  //   var res = await http.get(Uri.parse(url));
  //   print(res.body);
  // }
  Future<void> ipEmrDetails({required String pid, required String ipid}) async {
    String uri = "https://cybot.avanzosolutions.in/hms/emrtestnew.php";
    var res = await http.post(Uri.parse(uri), body: {
      'patientidcontroller': pid,
      'ipnocontroller': ipid,
    });
    print(res.body);
    var json = await jsonDecode(res.body) as Map<String, dynamic>;
    print(json);
    emrDetailsModel = EmrDetailsModel.fromJson(json);
  }
}
