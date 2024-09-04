import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/concerns_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_doctor_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/search_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/controller/billing_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dashboardscreen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dialysis/controller/booking_dialysis_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/controller/staff_list_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/controller/view_concerns_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/controller/store_controller.dart';
import 'package:hms_web_project/presentation/login_page/controller/login_controller.dart';
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
          create: (context) => ConcernsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => StoreController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ViewConcernsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingDialysisController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BillingController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: SplashScreen(),
        // home: SplashScreen(),

        home: Dashboardsecondscreen(
            userName: "Admin", empId: "009", des: "Admin"),
        // home: UserDashBoardScreen(userName: "User", empId: "001", des: "user"),
      ),
    );
  }
}
