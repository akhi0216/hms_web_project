import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dashboardscreen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dialysis/widgets/booking_dialysis.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dialysis/widgets/previous_dialysis_booking.dart';

class DialysisMain extends StatefulWidget {
  const DialysisMain({super.key});

  @override
  State<DialysisMain> createState() => _DialysisMainState();
}

class _DialysisMainState extends State<DialysisMain> {
  String value = "New Bookings";
  Widget screen = DialysisBooking();
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
                  "assets/images/highlandlogo-removebg-preview.png",
                ),
              ),
              SizedBox(height: size.height * .01),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * .05),
                  buttonCall(
                      label: "New Bookings", newScreen: DialysisBooking()),
                  buttonCall(
                      label: "Previous Recods",
                      newScreen: PreviousDialysisBooking()),
                  buttonCall(label: "Room Status", newScreen: DummyPage()),
                ],
              ),
            ],
          ),
        ),
        // SizedBox(width: size.width * .02),
        // SingleChildScrollView(child: screen),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: screen,
        )),
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
