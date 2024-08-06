import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Center(
          child: Container(
              // decoration: BoxDecoration(
              //     gradient: LinearGradient(colors: [
              //   ColorConstants.mainBlue,
              //   ColorConstants.mainwhite,
//   ColorConstants.mainBlue
              // ])),
              child: Image.asset(
                  "assets/images/highlandlogo-removebg-preview.png")),
        ),
      ],
    );
  }
}
