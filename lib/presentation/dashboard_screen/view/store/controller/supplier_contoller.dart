import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SupplierContoller with ChangeNotifier {
  String supplierid = '';
  suppliearidGeneration() async {
    String uri = "https://cybot.avanzosolutions.in/hms/supplieridcount.php";
    try {
      var res = await http.get(Uri.parse(uri));
      print(res.statusCode);
      log(res.body);
      supplierid = res.body;
    } catch (e) {
      log(e.toString());
    }
  }
}
