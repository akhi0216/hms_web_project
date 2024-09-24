import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserpswdgeneratingController with ChangeNotifier {
  userpswdsaving(
      {required String empid,
      required String username,
      required String password,
      required String mob,
      required String des,
      required String name}) async {
    String uri = "https://cybot.avanzosolutions.in/hms/userpasswordaccess.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        'doctoridcontroller': empid,
        'usernamecontroller': username,
        'passcontroller': password,
        'namecontroller': name,
        'mobilecontroller': mob,
        'descontroller': des
      });
      print(res.statusCode);
      log('body --- ${res.body}');
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
