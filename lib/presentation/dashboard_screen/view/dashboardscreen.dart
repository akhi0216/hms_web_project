// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/appointments/appintments_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/appointments/current_booking_page.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/appointments/new_bookings.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/billing_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/ip_billing.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/op_billing.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dialysis/dialysis_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/doctors/department_wise_availability.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/doctors/doctors_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/doctors/new_doctor.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/view/admin_screen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/emr/emr.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/emr/emr_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/concerns.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/feedback.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/general_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/housekeeping.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/home_dashboard/home_dashboard.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/lab/lab_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/lab/lab_records.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/lab/lab_tests.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/ot/ot_screen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/patients/existing_patients.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/patients/new_patient_reg.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/patients/patients_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/billing_pharmacy/billing_pharmacy_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/billing_pharmacy/widgets/billing_pharmacy.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/notifications/notifications_screen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/medicine_search.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/store_screen.dart';
import 'package:hms_web_project/presentation/login_page/view/login_page.dart';
import 'package:hms_web_project/presentation/settings_screen/settings_screen.dart';

class Dashboardsecondscreen extends StatefulWidget {
  const Dashboardsecondscreen(
      {super.key,
      required this.userName,
      required this.empId,
      required this.des});

  final String userName;
  final String empId;
  final String des;

  @override
  State<Dashboardsecondscreen> createState() => _DashboardsecondscreenState();
}

class _DashboardsecondscreenState extends State<Dashboardsecondscreen> {
  bool searchVisibility = false;

  bool _isHovered = false;
  bool isNotified = false;

  void _handleHover(bool isHovered, int index) {
    setState(() {
      _isHovered = isHovered;
    });
    if (_isHovered) {
      _buildPopupMenu(tabLabels[index], tabItems[index], index);
    }
    print(tabItems[index]);
  }

  List<String> tabLabels = [
    'Home',
    'Appointments',
    'Doctors',
    'Patients',
    'EMR',
    'Lab/Radiology',
    'Dialysis',
    'Operation Theatre',
    'Billing',
    'Insurance',
    'Pharmacy',
    'Store',
    'General'
  ];

  List<Widget> screenNames = [
    HomeDashboard(),
    AppintmentsMain(),
    DoctorMain(),
    PatientsMain(),
    EmrMain(),
    LabMain(),
    DialysisMain(),
    OtScreenMain(),
    BillingMain(),
    DummyPage(),
    BillingPharmacyMain(),
    StoreScreen(),
    GeneralMain(),
  ];

  String selectedData = "";
  int itemIndex = 0;
  Map<String, Widget> tabs = {'Home': HomeDashboard()};
  List<Map<String, Widget>> tabItems = [
    {
      "Home": HomeDashboard(),
    },
    {
      // -------------------------------------------------------------------appointments

      "Appointments": AppintmentsMain(),
    },
    {
      // --------------------------------------------------------------------------doctors
      "Doctors": DoctorMain(),
    },
    {
      // -----------------------------------------------------------------------patients
      "Patients": PatientsMain(),
    },
// ------------------------------------------------------------------- emr
    {
      "Patient records": EmrMain(),
    },
    //lAB
    {
      "Lab Records": LabMain()
      // --------------------
      // "Lab Records":
      //  LabDetailsPage(
      //   patientName: 'Akhila',
      //   testsDone: [
      //     TestDetail(
      //       name: 'Blood Test',
      //       date: '2024-08-01',
      //       report:
      //           'No abnormalities detected. All levels within normal range.',
      //     ),
      //     TestDetail(
      //       name: 'X-Ray',
      //       date: '2024-08-05',
      //       report: 'Chest X-Ray shows no significant findings.',
      //     ),
      //     TestDetail(
      //       name: 'Urine Test',
      //       date: '2024-08-10',
      //       report: 'Normal results. No infections or abnormalities.',
      //     ),
      //   ],
      //   doctorRemarks: 'The patient is in good health. Follow-up in 6 months.',
      // ),
      // "Lab Tests": LabTests()
    },
// DIALYSIS
    {},
// OPERATION THEATRE
    {
      "Operation Theatre": OtScreenMain(),
    },
    {
      "billing": BillingMain()
      // "Ip billing": IpBilling(),
      // "Op billing": OpBilling(),
    },
    // INSURANCE
    {},
    // PHARMACY
    {
      "billing": BillingPharmacyMain(),
      // "Availale stock": MedicineSearch(),
    },
    {
      // store
      "Store": StoreScreen(),
    },
    // GENERAL
    {
      "General": GeneralMain()
      // // ----------------
      // "Accounts": DummyPage(),
      // "Complaints": Complaint(),
      // "HR": DummyPage(),
      // "Stores": StoreScreen(),
      // "House Keeping": Housekeeping(),
      // "Analysis": DummyPage(),
      // "Nurse": DummyPage(),
      // "SMS Center": DummyPage(),
      // "Reminders": DummyPage(),
      // "Feedback": FeedbackForm(),
    },
  ];

  Widget? screen;

  @override
  void initState() {
    super.initState();
    // screen that comes first while opening dashboard
    // screen = NewPatientRegistrationscreen();
    screen = HomeDashboard();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.sizeOf(context);
    return DefaultTabController(
      length: 13,
      child: Scaffold(
        backgroundColor: ColorConstants.mainwhite,

        endDrawer: Drawer(
          backgroundColor: ColorConstants.mainwhite,
          elevation: 0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: ColorConstants.mainBlue,
                  // backgroundBlendMode: BlendMode.clear,
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Menu',
                      style: TextStyle(
                        color: ColorConstants.mainwhite,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      widget.userName,
                      style: TextStyle(color: ColorConstants.mainwhite),
                    ),
                    Text(
                      widget.empId,
                      style: TextStyle(color: ColorConstants.mainwhite),
                    ),
                    Text(
                      widget.des,
                      style: TextStyle(color: ColorConstants.mainwhite),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: widget.des == "Admin" ? true : false,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminScreen(
                            userName: widget.userName,
                            eid: widget.empId,
                            des: widget.des,
                          ),
                        ));
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: ColorConstants.mainBlue,
                    ),
                    title: Text('Admin'),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: ColorConstants.mainBlue,
                  ),
                  title: Text('Settings'),
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      // title: Text("Do you really want to logout"),
                      actions: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text("No"),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                                (route) => false,
                              );
                            },
                            child: Text("Yes")),
                      ],
                      title: Text("Logout"),
                      content: Text("Are you sure you want to logout"),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: ColorConstants.mainBlue,
                  ),
                  title: Text('Logout'),
                ),
              ),
            ],
          ),
        ),

        // ---------------------------------------------------------------------------------------
        // body: CustomScrollView(
        //   slivers: <Widget>[
        //     SliverAppBar(
        //       floating: true,
        //       snap: false,
        //       pinned: true,
        // backgroundColor: ColorConstants.mainBlue,
        // automaticallyImplyLeading: false,
        //   title: Text(
        //     'Highland Hospital',
        //     style: MyTextStyle.appbartext,
        //   ),
        //   bottom: TabBar(
        //       isScrollable: false,
        //       labelPadding:
        //           EdgeInsets.symmetric(horizontal: 3, vertical: 5),
        //       indicatorColor: Colors.transparent,
        //       labelColor: ColorConstants.mainOrange,
        //       unselectedLabelColor: ColorConstants.mainwhite,
        //       tabs: List.generate(tabLabels.length, (index) {
        //         return MouseRegion(
        //             // onEnter: (event) => _handleHover(true),
        //             onExit: (event) => _handleHover(false),
        //             onHover: (event) => _handleHover(true),
        //             child: _buildPopupMenu(
        //                 tabLabels[index], tabItems[index], index)
        //             );
        //       })),
        //   actions: [
        //     Builder(
        //       builder: (context) => IconButton(
        //         icon: Icon(
        //           Icons.menu,
        //           color: ColorConstants.mainwhite,
        //         ),
        //         onPressed: () {
        //           Scaffold.of(context).openEndDrawer();
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        //     SliverToBoxAdapter(child: screen),
        //   ],
        // ),

        appBar: AppBar(
          backgroundColor: ColorConstants.mainBlue,
          automaticallyImplyLeading: false,
          // title: Text(
          //   'Highland Hospital',
          //   style: MyTextStyle.appbartext,
          // ),
          // ------
          // title: CircleAvatar(
          //     radius: 20,
          //     backgroundColor: ColorConstants.mainwhite,
          //     child: Image.asset(
          //       "assets/images/highlandlogo-removebg-preview.png",
          //       fit: BoxFit.contain,
          //     )),
          bottom: TabBar(
            isScrollable: false,
            physics: NeverScrollableScrollPhysics(),
            labelPadding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
            indicatorColor: Colors.transparent,
            labelColor: isNotified
                ? ColorConstants.mainwhite
                : ColorConstants.mainOrange,
            labelStyle: TextStyle(
                fontWeight: isNotified ? FontWeight.normal : FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            unselectedLabelColor: ColorConstants.mainwhite,
            onTap: (value) {
              setState(() {
                isNotified = false;
              });
            },
            tabs: List.generate(tabLabels.length, (index) {
              return Tab(
                text: tabLabels[index],
                // child:
                // _buildPopupMenu(tabLabels[index], tabItems[index], index),
                // ------------------------------------------------------------
              );

              // return MouseRegion(
              //   onEnter: (event) =>
              //       _buildPopupMenu(tabLabels[index], tabItems[index], index),
              //   onExit: (event) => _handleHover(false, index),
              //   onHover: (event) => _handleHover(true, index),
              //   child: Tab(
              //     text: tabLabels[index],
              //     // child: _buildPopupMenu(
              //     //     tabLabels[index], tabItems[index], index),
              //   ),
              // );
            }),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isNotified = true;
                });
              },
              icon: Icon(Icons.notifications),
              color: ColorConstants.mainwhite,
            ),
            Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: ColorConstants.mainwhite,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          ],
        ),
        body: isNotified
            ? NotificationsScreen(
                value: "Notifications",
                givenScreen: NotificationsScreenSample(),
              )
            : TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: screenNames,
              ),
      ),
      // ),
    );
  }

  _buildPopupMenu(String title, Map<String, Widget> items, int index) {
    return PopupMenuButton<String>(
      offset:
          Offset(0, 40), // Adjust this value to position the menu below the tab
      onSelected: (value) {
        if (value.isNotEmpty && value != null) {
          setState(() {
            selectedData = value;
            itemIndex = index;
            screen = tabItems[itemIndex][selectedData];
          });
        }
      },
      itemBuilder: (BuildContext context) {
        return items.keys.map((String item) {
          return PopupMenuItem<String>(
            value: item,
            child: Container(
              // color: ColorConstants.mainBlue,
              child: Text(
                item,
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        }).toList();
      },
      child: Text(
        title,
        style: MyTextStyle.appbartext,
      ),
    );
  }
}

class DummyPage extends StatelessWidget {
  DummyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Dummy"));
  }
}
