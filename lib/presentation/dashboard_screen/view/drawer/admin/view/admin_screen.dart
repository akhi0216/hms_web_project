import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dashboardscreen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/doctors/new_doctor.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/view/widgets/doctor_search_screen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/view/widgets/staff_list_screen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/view/widgets/view_concerns.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/home_dashboard/home_dashboard.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen(
      {super.key,
      required this.userName,
      required this.eid,
      required this.des});
  final String userName;
  final String eid;
  final String des;

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  Widget screen = DoctorSearchScreen();
  String selectedLabel = "Doctor search";
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
                      // backgroundColor: Color(0xff81f1f2),
                      backgroundImage:
                          AssetImage("assets/images/doc_cartoon.jpg"),
                      radius: 50,
                    ),
                    SizedBox(height: size.height * .01),
                    Text(widget.userName),
                  ],
                ),
                SizedBox(height: size.height * .05),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonCall(
                        label: "Doctor search",
                        newScreen: DoctorSearchScreen()),
                    buttonCall(
                        label: "Doctor registration", newScreen: NewDoctor()),
                    buttonCall(
                        label: "Staff List", newScreen: StaffListScreen()),
                    buttonCall(
                        label: "View Concerns",
                        newScreen: ViewConcerns(
                          designation: widget.des,
                          empId: widget.eid,
                        )),
                    // buttonCall(label: "Home", newScreen: HomeDashboard()),

                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Dashboardsecondscreen(
                                  userName: widget.userName,
                                  empId: widget.eid,
                                  des: widget.des,
                                ),
                              ));
                          // Navigator.pop(context);
                        },
                        child: Text(
                          "HOME",
                          style: TextStyle(
                              color: ColorConstants.mainwhite,
                              fontWeight: FontWeight.bold),
                        ))
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