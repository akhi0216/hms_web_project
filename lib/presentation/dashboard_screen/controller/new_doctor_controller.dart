import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewDoctorController with ChangeNotifier {
  List<String> deptList = [];

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
}
