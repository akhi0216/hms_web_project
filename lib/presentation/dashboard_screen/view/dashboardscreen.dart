// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/login_page/view/login_page.dart';
import 'package:hms_web_project/presentation/settings_screen/settings_screen.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainwhite,
      appBar: AppBar(
        backgroundColor: ColorConstants.mainBlue,
        automaticallyImplyLeading: false,
        title: Text(
          'Highland Hospital',
          style: MyTextStyle.appbartext,
        ),

        // title: Row(
        //   children: [
        //     Container(
        //       height: 90,
        //       width: 107,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.all(Radius.circular(8)),
        //           image: DecorationImage(
        //               image: AssetImage("assets/images/highlandlogo.jpg"))),
        //     ),
        //     // SizedBox(width: 8), // Add some spacing between the logo and text
        //     // Text(
        //     //   'Highland Hospital',
        //     //   style: MyTextStyle.appbartext,
        //     // ),
        //   ],
        // ),
        actions: [
          InkWell(
            child: Text(
              'Billing',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
          InkWell(
            child: Text(
              'Patients',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
          InkWell(
            child: Text(
              'Appointments',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
          InkWell(
            child: Text(
              'Queues',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
          InkWell(
            child: Text(
              'EMR',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
          InkWell(
            child: Text(
              'E-consult',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
          InkWell(
            child: Text(
              'Lab',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
          InkWell(
            child: Text(
              'Radiology',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
          InkWell(
            child: Text(
              'Stocks',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
          // Container(
          //   height: 90,
          //   width: 107,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(8)),
          //       image: DecorationImage(
          //           image: AssetImage("assets/images/highlandlogo.jpg"))),
          // ),
          SizedBox(
            width: 11,
          ),
          InkWell(
            child: Text(
              'Pharmacy',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
          InkWell(
            child: Text(
              'Reminders',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),

          SizedBox(
            width: 11,
          ),
          InkWell(
            child: Text(
              'Analysis',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
          InkWell(
            child: Text(
              'SMS Center',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Settings',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
          InkWell(
            child: Text(
              'Doctors',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
          InkWell(
            child: Text(
              'HR&Pay Roll',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
          InkWell(
            child: Text(
              'Accounts',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: ColorConstants.mainwhite,
        elevation: 0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: ColorConstants.mainwhite,
                backgroundBlendMode: BlendMode.clear,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: ColorConstants.mainBlack,
                  fontSize: 24,
                ),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 670,
              width: 670,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                      image: AssetImage("assets/images/highlandlogo.jpg"))),
            ),
          ),
        ],
      ),
    );
  }
}
