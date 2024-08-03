import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_doctor_controller.dart';
<<<<<<< HEAD
import 'package:hms_web_project/presentation/dashboard_screen/view/appointments/current_booking_page.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/appointments/new_bookings.dart';
||||||| dbb5f9d
import 'package:hms_web_project/presentation/dashboard_screen/view/appointments/current_booking_page.dart';
=======
import 'package:hms_web_project/presentation/dashboard_screen/controller/search_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/appointments/new_bookings.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/ip_billing.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/ip_billing_new.dart';
>>>>>>> 040c01e8496892cb2f30426db72d92918cce8ad4
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
<<<<<<< HEAD
        // home: SplashScreen(),
        home: Scaffold(
          body: NewBookings(),
        ),
||||||| dbb5f9d
        home: SplashScreen(),
        // home: Scaffold(
        //   body: CurrentBookingPage(),
        // ),
=======
        // home: SplashScreen(),
        home: Scaffold(
          // body: IpBilling(),
          // body: IpBillingNew(),
          body: NewBookings(),
        ),
>>>>>>> 040c01e8496892cb2f30426db72d92918cce8ad4
      ),
    );
  }
}
