import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/ot/widgets/new_ot_booking.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/ot/widgets/ot_status.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/ot/widgets/previous_ot_booking.dart';

class OtScreen extends StatefulWidget {
  const OtScreen({super.key});

  @override
  State<OtScreen> createState() => _OtScreenState();
}

class _OtScreenState extends State<OtScreen> {
  Widget screen = NewOtBooking();
  String value = "New Booking";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width * .2,
          height: size.height,
          color: ColorConstants.mainBlue,
          child: Column(
            children: [
              Container(
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
                  buttonCall(label: "New Booking", newScreen: NewOtBooking()),
                  buttonCall(
                      label: "Previous Booking",
                      newScreen: PreviousOtBooking()),
                  buttonCall(label: "OT Status", newScreen: OtStatus()),
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
                  Text("Operation Theatre"),
                  SizedBox(height: size.height * .05),
                  screen,
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buttonCall({required String label, required Widget newScreen}) {
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

  // Widget sampleWidget() {
  // Size size = MediaQuery.sizeOf(context);

  // return Container(
  //   width: size.width * .8,
  //   height: size.height,
  //   color: Colors.blue,
  // );
  // }
}

class NewOtBookings {}

class SampleWidgetScreen extends StatelessWidget {
  const SampleWidgetScreen({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width * .8,
      height: size.height,
      color: color,
    );
  }
}
