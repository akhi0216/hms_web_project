import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/patients/existing_patients.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/patients/new_patient_reg.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/widgets/current_stock.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/widgets/new_stock.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/widgets/new_store.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/widgets/open_stock.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/widgets/store_billing.dart';

class PatientsMain extends StatefulWidget {
  const PatientsMain({super.key});

  @override
  State<PatientsMain> createState() => _PatientsMainState();
}

class _PatientsMainState extends State<PatientsMain> {
  String value = "New patient Reg";
  Widget screen = NewPatientRegistrationscreen();
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
                      label: "New patient Reg",
                      newScreen: NewPatientRegistrationscreen()),
                  buttonCall(
                      label: "Existing Patients",
                      newScreen: ExistingPatientsPage()),
                  // buttonCall(label: "Open Stock", newScreen: OpenStock()),
                  // buttonCall(label: "New Stock", newScreen: NewStock()),
                  // buttonCall(label: "Current Stock", newScreen: CurrentStock()),
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
