import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/image_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dashboardscreen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/complaint.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/feedback.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/housekeeping.dart';

class GeneralMain extends StatefulWidget {
  const GeneralMain({super.key});

  @override
  State<GeneralMain> createState() => GeneralMainState();
}

class GeneralMainState extends State<GeneralMain> {
  String value = "HouseKeeping";
  Widget screen = Housekeeping();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width * .2,
          height: size.height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: ColorConstants.mainBlue,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Column(
            children: [
              Container(
                width: size.width * .199,
                color: ColorConstants.mainwhite,
                child: Image.asset(
                  ImageConstants.highlandlogonobackground,
                ),
              ),
              SizedBox(height: size.height * .01),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * .05),
                  // buttonCall(label: "Store", newScreen: StoreScreen()),
                  buttonCall(label: "HouseKeeping", newScreen: Housekeeping()),
                  buttonCall(label: "Accounts", newScreen: DummyPage()),
                  buttonCall(label: "Concerns", newScreen: Complaint()),

                  buttonCall(label: "feedback", newScreen: FeedbackForm()),
                  // buttonCall(label: "HR", newScreen: DummyPage()),
                  // buttonCall(label: "Nurse", newScreen: DummyPage()),
                  buttonCall(label: "SMS center", newScreen: DummyPage()),
                  buttonCall(label: "Reminders", newScreen: DummyPage()),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: size.width * .02),
        // SingleChildScrollView(child: screen),
        Expanded(child: screen),
      ],
    );
  }

  Widget buttonCall({required String label, required Widget newScreen}) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: () {
          value = label;
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
              color: value == label
                  ? ColorConstants.mainOrange
                  : ColorConstants.mainBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(color: ColorConstants.mainwhite),
            ),
          ),
        ),
      );
    });
  }
}
