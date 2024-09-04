import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';

class OpBilling extends StatefulWidget {
  const OpBilling({super.key});

  @override
  State<OpBilling> createState() => _OpBillingState();
}

class _OpBillingState extends State<OpBilling> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Hospital Name, Address, and Logo
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // // Logo placed on the left side of the heading
                // Container(
                //   height: 100,
                //   width: 100,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     image: DecorationImage(
                //       image: AssetImage("assets/images/highlandlogo.jpg"),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                // SizedBox(width: 16),
                // Hospital name and address
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "HIGHLAND HOSPITAL RESEARCH AND DIAGNOSTIC CENTRE",
                        textAlign: TextAlign.left,
                        style: MyTextStyle.highlandheading.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.mainBlack,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Mother Theresa Rd, Highlands, Kankanady,",
                        style: MyTextStyle.highlandaddress.copyWith(
                          fontSize: 16,
                          color: ColorConstants.mainBlack,
                        ),
                      ),
                      Text(
                        "Mangaluru, Karnataka 575002",
                        style: MyTextStyle.highlandaddress.copyWith(
                          fontSize: 16,
                          color: ColorConstants.mainBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                // Logo placed on the left side of the heading
                Container(
                  height: 210,
                  width: 210,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/highlandlogo.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
            SizedBox(height: 30),
            // Cash Bill Header
            Center(
              child: Text(
                "CASH BILL (Original)",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: ColorConstants.mainBlue,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Billing Information
            Column(
              children: [
                // row 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Patient No : ",
                          style: TextStyle(
                            color: ColorConstants.mainBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 200),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Department : ",
                          style: TextStyle(
                            color: ColorConstants.mainBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Mental Health",
                          style: TextStyle(color: ColorConstants.mainBlack),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 11),
                // row 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Patient Name : ",
                          style: TextStyle(
                            color: ColorConstants.mainBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Adharsh PS",
                          style: TextStyle(color: ColorConstants.mainBlack),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Bill No : ",
                          style: TextStyle(
                            color: ColorConstants.mainBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "221133446655",
                          style: TextStyle(color: ColorConstants.mainBlack),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 11),
                // row 3
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Doctor : ",
                          style: TextStyle(
                            color: ColorConstants.mainBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Nithin MD",
                          style: TextStyle(color: ColorConstants.mainBlack),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Bill Date : ",
                          style: TextStyle(
                            color: ColorConstants.mainBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "07-04-2024",
                          style: TextStyle(color: ColorConstants.mainBlack),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: ColorConstants.mainBlack),
          ],
        ),
      ),
    );
  }
}
