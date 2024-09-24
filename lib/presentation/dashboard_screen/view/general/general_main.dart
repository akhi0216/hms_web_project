import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/image_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dashboardscreen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/concerns.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/feedback.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/housekeeping.dart';

import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/hr_page_main.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/leave_request_screen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/passing_section.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/supplimentaries.dart';

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
              bottomRight: Radius.circular(10),
            ),
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
              Expanded(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: size.height * 0.9, // Limits the height
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: size.height * .02),
                        buttonCall(
                            label: "HouseKeeping", newScreen: Housekeeping()),
                        buttonCall(label: "Accounts", newScreen: DummyPage()),
                        buttonCall(
                            label: "Concerns", newScreen: ConcernsScreen()),
                        buttonCall(
                            label: "Leave Request",
                            newScreen: LeaveRequestScreen()),
                        buttonCall(
                            label: "Feedback", newScreen: FeedbackForm()),
                        buttonCall(
                            label: "Supplimentaries",
                            newScreen: Supplimentaries()),
                        buttonCall(label: "SMS Center", newScreen: DummyPage()),
                        buttonCall(label: "Reminders", newScreen: DummyPage()),
                        buttonCall(
                            label: "Authorization",
                            newScreen: PassingSection()),
                        buttonCall(label: "HR", newScreen: HrPage()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: size.width * .02),
        Expanded(child: screen),
      ],
    );
  }

  Widget buttonCall({required String label, required Widget newScreen}) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: () {
          setState(() {
            value = label;
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
