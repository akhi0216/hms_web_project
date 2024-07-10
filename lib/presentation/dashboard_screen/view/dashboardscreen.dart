// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/login_page/view/login_page.dart';
import 'package:hms_web_project/presentation/settings_screen/settings_screen.dart';
// import 'package:http/http.dart' as http;

class Dashboardsecondscreen extends StatefulWidget {
  const Dashboardsecondscreen(
      {super.key, required this.userName, required this.empId});

  final String userName;
  final String empId;

  @override
  State<Dashboardsecondscreen> createState() => _DashboardsecondscreenState();
}

class _DashboardsecondscreenState extends State<Dashboardsecondscreen> {
  bool searchVisibility = false;

  bool _isHovered = false;

  void _handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
    _isHovered == true ? print("true") : print("false");
  }

  List<String> tabLabels = [
    'Billing',
    'Patients',
    'Doctors',
    'Appointments',
    'EMR',
    'E-consult',
    'Lab',
    'Radiology',
    'Store',
    'Pharmacy',
    'Reminders',
    'Analysis',
    'SMS Center',
    'Settings',
    'Accounts'
  ];

  String selectedData = "";
  int itemIndex = 0;

  List<Map<String, Widget>> tabItems = [
    {
      "Ip billing": DummyPage(),
      "Op billing": DummyPage(),
      "Unhealthy billing": DummyPage(),
    },
    {
      "New patient": DummyPage(),
      // "Existing patient": ExistingPatientsPage(),
      "discharged": DummyPage(),
    },
    {
      "Dept. wise availability": DummyPage(),
      "Doctors list": DummyPage(),
      "Doctors on call": DummyPage(),
    },
    {
      "New bookings": DummyPage(),
      "Existing bookings": DummyPage(),
      "Previous bookings": DummyPage(),
    },
    {
      "Ip records": DummyPage(),
      "Op records": DummyPage(),
      "Medical history": DummyPage(),
      "Discribe advice": DummyPage(),
      "Data analysis": DummyPage(),
      "Graphs": DummyPage(),
    },
    {}, //--------- E-consult
    {
      "Booking": DummyPage(),
      "Records": DummyPage(),
      "Availability": DummyPage(),
    },
    {}, //--------------- Radiology
    {
      "New stock": DummyPage(),
      "Open stock": DummyPage(),
      "Main stock": DummyPage(),
      "Expired stock": DummyPage(),
    },
    {}, //-------------------- Pharmacy
    {
      "Pending booking": DummyPage(),
      "Upcoming events": DummyPage(),
      "Dept. notifications": DummyPage(),
    },
    {}, //------------------ Analysis
    {
      "Greetings": DummyPage(),
      "History": DummyPage(),
    },
    {}, //----------------Settings
    {
      "Staff list": DummyPage(),
      "Duty assignment": DummyPage(),
      "Hr & payroll": DummyPage(),
      "Miscellaneous": DummyPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.sizeOf(context);
    return DefaultTabController(
      length: 15,
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
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: ColorConstants.mainBlue,
              automaticallyImplyLeading: false,
              title: Text(
                'Highland Hospital',
                style: MyTextStyle.appbartext,
              ),
              expandedHeight: 150,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) => FlexibleSpaceBar(
                  expandedTitleScale: 1,
                  stretchModes: [StretchMode.zoomBackground],
                  centerTitle: false,
                  titlePadding: EdgeInsets.only(
                      left: constraints.maxWidth * .6,
                      right: constraints.maxWidth * .05,
                      top: constraints.maxHeight * .25,
                      bottom: constraints.maxHeight * .5),
                  title: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              bottom: TabBar(
                  isScrollable: false,
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                  indicatorColor: Colors.transparent,
                  tabs: List.generate(tabLabels.length, (index) {
                    return MouseRegion(
                        // onEnter: (event) => _handleHover(true),
                        onExit: (event) => _handleHover(false),
                        onHover: (event) => _handleHover(true),
                        child: _buildPopupMenu(
                            tabLabels[index], tabItems[index], index)
                        // : Tab(
                        // child: Text(
                        //   tabLabels[index],
                        //   style: MyTextStyle.appbartext,
                        // ),
                        //   ),
                        );
                  })),
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
            SliverToBoxAdapter(child: tabItems[itemIndex][selectedData]
                // child: Center(
                //   child: Container(
                //     height: 670,
                //     width: 670,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.all(Radius.circular(8)),
                //         image: DecorationImage(
                //             image: AssetImage("assets/images/highlandlogo.jpg"))),
                //   ),
                // ),
                //         TabBarView(
                //             children: List.generate(
                //   tabLabels.length,
                //   (index) => DummyPage(title: tabLabels[index]),
                // ))
                ),
          ],
        ),
      ),
    );
  }

  PopupMenuButton<String> _buildPopupMenu(
      String title, Map<String, Widget> items, int index) {
    return PopupMenuButton<String>(
      offset:
          Offset(0, 40), // Adjust this value to position the menu below the tab
      onSelected: (value) {
        // TabBarView(
        //     children: List.generate(
        //   items.length,
        //   (index) => DummyPage(title: title),
        // ));
        if (value.isNotEmpty && value != null) {
          setState(() {
            selectedData = value;
            itemIndex = index;
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


// class SearchPage extends StatelessWidget {
//   SearchPage({super.key});
//   TextEditingController searchController = TextEditingController();
//   String ret = "";
//   Future<String> searchPatient() async {
//     String url = "https://cybot.avanzosolutions.in/hms/patientname.php";
//     try {
//       var res = await http.post(Uri.parse(url), body: {
//         "patientnamecontroller": searchController.text.trim(),
//       });
//       print(res.body);
//       ret = res.body;
//     } on Exception catch (e) {
//       print(e);
//     }
//     return ret;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: TextFormField(
//               controller: searchController,
//               onFieldSubmitted: (value) {
//                 searchPatient();
//               },
//               decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(color: ColorConstants.mainBlue),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   borderSide:
//                       BorderSide(color: ColorConstants.mainBlue, width: 2),
//                 ),
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     searchPatient();
//                   },
//                   icon: Icon(Icons.search),
//                   color: ColorConstants.mainBlue,
//                 ),
//                 hintText: "Search patient by name/id/username",
//                 hintStyle: TextStyle(color: Colors.grey[400]),
//                 contentPadding:
//                     EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 44,
//           ),
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(5))),
//             child: Row(
//               children: [Text("Name : ")],
//             ),
//           ),
//           SizedBox(
//             height: 7,
//           ),
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(5))),
//             child: Row(
//               children: [Text("Email : ")],
//             ),
//           ),
//           SizedBox(
//             height: 7,
//           ),
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(5))),
//             child: Row(
//               children: [Text("ph no : ")],
//             ),
//           ),
//           SizedBox(
//             height: 7,
//           ),
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(5))),
//             child: Row(
//               children: [Text("Address : ")],
//             ),
//           ),
//           SizedBox(
//             height: 7,
//           ),
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(5))),
//             child: Row(
//               children: [Text("Doctor name : ")],
//             ),
//           ),
//           SizedBox(
//             height: 7,
//           ),
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(5))),
//             child: Row(
//               children: [Text("DEPT : ")],
//             ),
//           ),
//           SizedBox(
//             height: 7,
//           ),
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(5))),
//             child: Row(
//               children: [Text("Attachments : ")],
//             ),
//           ),
//           SizedBox(
//             height: 7,
//           ),
//         ],
//       ),
//     );
//   }
// }