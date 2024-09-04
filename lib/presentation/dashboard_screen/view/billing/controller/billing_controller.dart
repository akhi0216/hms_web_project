import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/model/billing_model.dart';
// import 'package:hms_web_project/presentation/dashboard_screen/view/billing/model/billing_model.dart';
import 'package:http/http.dart' as http;

class BillingController with ChangeNotifier {
  List<SampleBillingApimodel> items = [];
  Future<void> supplimentaries() async {
    String uri = "https://cybot.avanzosolutions.in/hms/supplimentries.php";
    var res = await http.get(Uri.parse(uri));
    // print(res.body);
    // print(res.statusCode);
    if (res.statusCode == 200) {
      items = (jsonDecode(res.body) as List)
          .map((json) => SampleBillingApimodel.fromJson(json))
          .toList();
      // print(items);
      // items = List<SampleBillingApimodel>.from(await jsonDecode(res.body));
      // print(items[0].particulars);
    }
    notifyListeners();
  }
}
