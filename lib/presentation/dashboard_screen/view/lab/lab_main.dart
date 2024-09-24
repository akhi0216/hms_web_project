import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/image_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/appointments/current_booking_page.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/appointments/new_bookings.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/lab/lab_records.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/lab/lab_tests.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/widgets/current_stock.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/widgets/new_stock.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/widgets/new_store.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/widgets/open_stock.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/widgets/store_billing.dart';

class LabMain extends StatefulWidget {
  const LabMain({super.key});

  @override
  State<LabMain> createState() => LabMainState();
}

class LabMainState extends State<LabMain> {
  String value = "Lab Tests";
  Widget screen = LabTests();
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
                      label: "Lab Records",
                      newScreen: LabDetailsPage(
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
                            report:
                                'Chest X-Ray shows no significant findings.',
                          ),
                          TestDetail(
                            name: 'Urine Test',
                            date: '2024-08-10',
                            report:
                                'Normal results. No infections or abnormalities.',
                          ),
                        ],
                        doctorRemarks:
                            'The patient is in good health. Follow-up in 6 months.',
                      )),
                  buttonCall(label: "Lab Tests", newScreen: LabTests()),
                  buttonCall(
                      label: "Lab Records",
                      newScreen: LabDetailsPage(
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
                            report:
                                'Chest X-Ray shows no significant findings.',
                          ),
                          TestDetail(
                            name: 'Urine Test',
                            date: '2024-08-10',
                            report:
                                'Normal results. No infections or abnormalities.',
                          ),
                        ],
                        doctorRemarks:
                            'The patient is in good health. Follow-up in 6 months.',
                      )),
                  buttonCall(label: "Lab Tests", newScreen: LabTests()),
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
