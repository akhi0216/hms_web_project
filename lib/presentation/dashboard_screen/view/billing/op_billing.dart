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
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "HIGHLAND HOSPITAL RESEARCH AND DIAGNOSTIC CENTRE",
                style: MyTextStyle.highlandheading
                    .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Mother Theresa Rd, Highlands, Kankanady,",
              style: MyTextStyle.highlandaddress.copyWith(fontSize: 16),
            ),
            Text(
              "Mangaluru, Karnataka 575002",
              style: MyTextStyle.highlandaddress.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "CASH BILL(Original)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // row 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("     Patient No : "),
                        Container(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: TextFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Department : "),
                        // Text("Doctor:"),
                        Container(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: TextFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                // row 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Patient Name : "),
                        Container(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: TextFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Bill No : "),
                        // Text("Doctor:"),
                        Container(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: TextFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 11,
                ),

                // row 3
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("            Doctor : "),
                        Container(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: TextFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Bill Date : "),
                        // Text("Doctor:"),
                        Container(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: TextFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                // row 4
              ],
            ),
            // Divider(
            //   color: ColorConstants.mainBlack,
            //   // width: 3,
            // )
          ],
        ),
      ),
    );
  }
}
