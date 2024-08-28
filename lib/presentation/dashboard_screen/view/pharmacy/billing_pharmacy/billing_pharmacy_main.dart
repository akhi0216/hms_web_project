import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/image_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/billing_pharmacy/widgets/billing_pharmacy.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/billing_pharmacy/widgets/pharmacy_notifications.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/medicine_search.dart';

class BillingPharmacyMain extends StatefulWidget {
  BillingPharmacyMain({
    super.key,
  });

  @override
  State<BillingPharmacyMain> createState() => _BillingPharmacyMainState();
}

class _BillingPharmacyMainState extends State<BillingPharmacyMain> {
  String value = "Billing";
  Widget screen = BillingPharmacy();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: size.width * .2,
        height: size.height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: ColorConstants.mainBlue,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
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
                buttonCall(label: "Billing", newScreen: BillingPharmacy()),
                buttonCall(
                    label: "Medicine Search", newScreen: MedicineSearch()),
              ],
            ),
          ],
        ),
      ),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: screen,
      ))
    ]);
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
              // color: ColorConstants.mainOrange,
              color: value == label
                  ? ColorConstants.mainOrange
                  : Colors.transparent,
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
