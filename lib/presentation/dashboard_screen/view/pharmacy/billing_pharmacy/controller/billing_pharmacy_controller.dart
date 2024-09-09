import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/billing_pharmacy/model/billing_pharmacy_model.dart';

class BillingPharmacyController with ChangeNotifier {
  List<BillingPharmacyModel> medicineList = [];
  medicinesListFunction() async {
    String url = 'https://cybot.avanzosolutions.in/hms/medicinefetch.php';
    try {
      var res = await http.get(Uri.parse(url));
      print(res.body);
      if (res.statusCode == 200) {
        medicineList = (jsonDecode(res.body) as List)
            .map((json) => BillingPharmacyModel.fromJson(json))
            .toList();
      }
    } on Exception catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
