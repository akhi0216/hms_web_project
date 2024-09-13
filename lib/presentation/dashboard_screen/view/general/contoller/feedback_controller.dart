import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/model/view_feedback.dart';
import 'package:http/http.dart' as http;

class FeedbackController with ChangeNotifier {
  List<SampleViewfeedbackApimodel> viewfeedbackList = [];
  List deptwiseFeedbackList = [];
  feedbackSaving({
    required String patientid,
    required String name,
    required String email,
    required String phn,
    required String feedback,
    required String date,
  }) async {
    String uri = "https://cybot.avanzosolutions.in/hms/feedbacksubmission.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        'patientidcontroller': patientid,
        'datecontroller': date,
        'feedbackcontroller': feedback,
        'lnamecontroller': name,
        'mobilecontroller': phn,
        'mailcontroller': email
      });
      print(res.statusCode);
      log(res.body);
    } catch (e) {
      log(e.toString());
    }
  }

  datePassing({required String date}) async {
    String uri = "https://cybot.avanzosolutions.in/hms/feedbackview.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        'datecontroller': date,
      });
      print(res.statusCode);
      log(res.body);

      viewfeedbackList = (jsonDecode(res.body) as List)
          .map((json) => SampleViewfeedbackApimodel.fromJson(json))
          .toList();
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  feedbackReturnresponse(
      {required response,
      required feedbackid,
      required approvedby,
      required date}) async {
    String uri = "https://cybot.avanzosolutions.in/hms/feedbackresponse.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        'datecontroller': date,
        'responsebackcontroller': response,
        'feedbackidcontroller': feedbackid,
        'approvedbycontroller': approvedby
      });
      print("feedback -${feedbackid}");
      print("empid-----${approvedby}");
      // print(response);
      print(res.body);
      print(date);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
