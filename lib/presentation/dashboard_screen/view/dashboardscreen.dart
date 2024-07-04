import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.mainBlue,
        title: Text(
          'Highland Hospital',
          style: MyTextStyle.appbartext,
        ),
        actions: [
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
              'Patients',
              style: MyTextStyle.appbartext,
            ),
          ),
          SizedBox(
            width: 11,
          ),
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
        ],
      ),
    );
  }
}
