import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/image_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/radiology/controller/radiology_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/radiology/view/widgets/radiology_booking.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/radiology/view/widgets/radiology_history.dart';
import 'package:provider/provider.dart';

class RadiologyMain extends StatefulWidget {
  const RadiologyMain({super.key});

  @override
  State<RadiologyMain> createState() => _RadiologyMainState();
}

class _RadiologyMainState extends State<RadiologyMain> {
  String value = "Booking";
  ScrollController _scrollController = ScrollController();
  Widget? screen;

  @override
  void initState() {
    super.initState();
    screen = RadiologyBooking();
  }

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
                  buttonCall(
                      label: "Booking",
                      onTap: () async {
                        value = "Booking";
                        setState(() {
                          screen = RadiologyBooking();
                        });
                      }),
                  buttonCall(
                      label: "Booking History",
                      onTap: () async {
                        value = "Booking History";
                        await Provider.of<RadiologyController>(context,
                                listen: false)
                            .radiologyHistory();
                        setState(() {
                          screen = RadiologyHistory();
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: size.width * .02),
        // ---------------Screen
        // Expanded(child: SingleChildScrollView(child: screen)),
        Expanded(
            child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: screen,
            )
          ],
        )),
        SizedBox(width: size.width * .02),
      ],
    );
  }

  Widget buttonCall({required String label, required VoidCallback onTap}) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: onTap,
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
