import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/complaints_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_doctor_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/search_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dashboardscreen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/controller/staff_list_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/housekeeping.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/home_dashboard/home_dashboard.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/controller/controller.dart';
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
          create: (context) => StaffListController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ComplaintsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => StoreModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        // home: Scaffold(
        // body: HomeDashboard(),
        // ),

        // home: Dashboardsecondscreen(
        //     userName: "Avanzo", empId: "001", des: "Admin"),
      ),
    );
  }
}
