// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hms_web_project/current_booking_page.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/ip_billing.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/op_billing.dart';
import 'package:hms_web_project/presentation/login_page/view/login_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
      home: CurrentBookingPage(),
    );
  }
}
