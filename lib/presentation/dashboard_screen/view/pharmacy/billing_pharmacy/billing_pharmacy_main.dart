import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/billing_pharmacy/widgets/billing_pharmacy.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/billing_pharmacy/widgets/pharmacy_notifications.dart';

class BillingPharmacyMain extends StatefulWidget {
  BillingPharmacyMain({super.key, this.notifications = false});
  final bool notifications;

  @override
  State<BillingPharmacyMain> createState() => _BillingPharmacyMainState();
}

class _BillingPharmacyMainState extends State<BillingPharmacyMain> {
  String value = "Billing";
  Widget screen = BillingPharmacy();
  @override
  void initState() {
    super.initState();
    if (widget.notifications) {
      value = "Notifications";
      screen = PharmacyNotifications();
    } else {
      value = "Billing";
      screen = BillingPharmacy();
    }
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
                "assets/images/highlandlogo-removebg-preview.png",
              ),
            ),
            SizedBox(height: size.height * .01),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * .05),
                buttonCall(
                    label: widget.notifications ? "Notifications" : "Billing",
                    newScreen: widget.notifications
                        ? PharmacyNotifications()
                        : BillingPharmacy()),
              ],
            ),
          ],
        ),
      ),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child:
            widget.notifications ? PharmacyNotifications() : BillingPharmacy(),
      ))
    ]);
  }

  Widget buttonCall({required String label, required Widget newScreen}) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: () {
          // value = label;
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
              color: ColorConstants.mainOrange,
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
