import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/complaints_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_doctor_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/search_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/appointments/new_bookings.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/ip_billing.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/ip_billing_new.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/op_billing.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dashboardscreen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/emr/emr.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/complaint.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/lab/radiology/lab_details.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/billing_pharmcay.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/medicine_search.dart';
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
        ),
        ChangeNotifierProvider(
          create: (context) => TextSearchController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ComplaintsController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: SplashScreen(),

        home: Scaffold(body: OpBilling()),
      ),
    );
  }
}
