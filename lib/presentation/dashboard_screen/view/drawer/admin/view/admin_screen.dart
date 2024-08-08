import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/doctors/new_doctor.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/view/widgets/doctor_search_screen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/view/widgets/staff_list_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key, required this.adminName});
  final String adminName;

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  Widget screen = DoctorSearchScreen();
  String selectedLabel = "doctor search";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: size.width * .2,
            color: ColorConstants.mainBlue,
            child: Column(
              children: [
                SizedBox(height: size.height * .01),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 50,
                    ),
                    SizedBox(height: size.height * .01),
                    Text(widget.adminName),
                  ],
                ),
                SizedBox(height: size.height * .05),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonCall(
                        label: "doctor search",
                        newScreen: DoctorSearchScreen()),
                    buttonCall(
                        label: "staff registration", newScreen: NewDoctor()),
                    buttonCall(
                        label: "staff List", newScreen: StaffListScreen()),
                  ],
                ),
              ],
            ),
          ),
          // VerticalDivider(),
          Container(
            width: size.width * .8,
            height: size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Admin"),
                    SizedBox(height: size.height * .01),
                    screen,
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buttonCall({required String label, required Widget newScreen}) {
    bool isSelected = label == selectedLabel;
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => Scaffold(
          //         body: screen,
          //       ),
          //     ));
          selectedLabel = label;
          setState(() {
            screen = newScreen;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: constraints.maxWidth * .6,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? ColorConstants.mainwhite
                  : ColorConstants.mainBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(label),
          ),
        ),
      );
    });
  }
}
// "doctor search"
// DoctorSearchScreen()