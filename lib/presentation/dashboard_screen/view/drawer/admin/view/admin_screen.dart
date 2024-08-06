import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/doctors/new_doctor.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/view/widgets/doctor_search_screen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/view/widgets/staff_list_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorSearchScreen(),
                  ));
            },
            child: Text("doctor search"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: NewDoctor(),
                    ),
                  ));
            },
            child: Text("staff registration"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: StaffListScreen(),
                    ),
                  ));
            },
            child: Text("staff List"),
          ),
        ],
      ),
    );
  }
}
