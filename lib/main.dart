// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_doctor_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/appointments/new_bookings.dart';

import 'package:hms_web_project/presentation/login_page/view/login_page.dart';
import 'package:hms_web_project/presentation/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewDoctorController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingPatientController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: LoginPage(),
        home: SplashScreen(),

        // home: NewBookings(),
      ),
    );
  }
}
