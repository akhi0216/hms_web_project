// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/billing_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/ip_billing.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/op_billing.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dialysis/dialysis_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/view/admin_screen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/view/widgets/view_concerns.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/concerns.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/general_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/home_dashboard/home_dashboard.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/lab/lab_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/lab/lab_records.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/lab/lab_tests.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/notifications/notifications_screen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/ot/ot_screen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/patients/patients_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/billing_pharmacy/billing_pharmacy_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/medicine_search.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/store_screen.dart';
import 'package:hms_web_project/presentation/login_page/view/login_page.dart';
import 'package:hms_web_project/presentation/settings_screen/settings_screen.dart';

class UserDashBoardScreen extends StatefulWidget {
  const UserDashBoardScreen(
      {super.key,
      required this.userName,
      required this.empId,
      required this.des});

  final String userName;
  final String empId;
  final String des;

  @override
  State<UserDashBoardScreen> createState() => _UserDashBoardScreenState();
}

class _UserDashBoardScreenState extends State<UserDashBoardScreen> {
  bool searchVisibility = false;

  bool _isHovered = false;

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
    'Patients',
    'Lab/Radiology',
    'Dialysis',
    'Operation Theatre',
    'Billing',
    'Insurance',
    'General'
  ];

  List<Widget> screenNames = [
    HomeDashboard(),
    PatientsMain(),
    LabMain(),
    DialysisMain(),
    OtScreenMain(),
    BillingMain(),
    DummyPage(),
    GeneralMain(),
  ];

  String selectedData = "";
  int itemIndex = 0;
  Map<String, Widget> tabs = {'Home': HomeDashboard()};
  List<Map<String, Widget>> tabItems = [
    // Home
    {
      "Home": HomeDashboard(),
    },
// Patient
    {
      "Patients": PatientsMain(),
      "discharged": DummyPage(),
    },
    //lAB
    {
      "Lab Records": LabDetailsPage(
        patientName: 'Akhila',
        testsDone: [
          TestDetail(
            name: 'Blood Test',
            date: '2024-08-01',
            report:
                'No abnormalities detected. All levels within normal range.',
          ),
          TestDetail(
            name: 'X-Ray',
            date: '2024-08-05',
            report: 'Chest X-Ray shows no significant findings.',
          ),
          TestDetail(
            name: 'Urine Test',
            date: '2024-08-10',
            report: 'Normal results. No infections or abnormalities.',
          ),
        ],
        doctorRemarks: 'The patient is in good health. Follow-up in 6 months.',
      ),
      "Lab Tests": LabTests()
    },
// DIALYSIS
    {},
// OPERATION THEATRE
    {
      "Operation Theatre": OtScreenMain(),
    },
// Billing
    {
      "Ip billing": IpBilling(),
      "Op billing": OpBilling(),
      "Unhealthy billing": DummyPage(),
    },
// INSURANCE
    {},
    // PHARMACY
    {
      "billing": BillingPharmacyMain(),
      "Availale stock": MedicineSearch(),
    },
// GENERAL
    {
      "Complaints": ConcernsScreen(),
      "Stores": StoreScreen(),
      "Nurse": DummyPage(),
      "SMS Center": DummyPage(),
      "Reminders": DummyPage(),
      "Feedback": DummyPage(),
    },
  ];

  Widget? screen;
  bool concerns = false;

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
      length: 8,
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
                        color: ColorConstants.mainBlack,
                        fontSize: 24,
                      ),
                    ),
                    Text(widget.userName),
                    Text(widget.empId),
                    Text(widget.des),
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
                    leading: Icon(Icons.account_circle),
                    title: Text('Admin'),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    concerns = true;
                  });
                  Navigator.pop(context);
                },
                child: ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text('View Concerns'),
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
                  leading: Icon(Icons.settings),
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
                  leading: Icon(Icons.logout),
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
          bottom: TabBar(
            isScrollable: false,
            labelPadding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
            indicatorColor: Colors.transparent,
            labelColor:
                concerns ? ColorConstants.mainwhite : ColorConstants.mainOrange,
            unselectedLabelColor: ColorConstants.mainwhite,
            onTap: (value) {
              setState(() {
                concerns = false;
              });
            },
            tabs: List.generate(tabLabels.length, (index) {
              return Tab(
                text: tabLabels[index],
                // child:
                //     _buildPopupMenu(tabLabels[index], tabItems[index], index),
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
        body: concerns
            ? NotificationsScreen(
                value: "View Concerns",
                givenScreen: ViewConcerns(
                  designation: widget.des,
                  empId: widget.empId,
                ),
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
