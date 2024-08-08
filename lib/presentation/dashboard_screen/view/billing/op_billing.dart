import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "HIGHLAND HOSPITAL RESEARCH AND DIAGNOSTIC CENTRE",
              style: MyTextStyle.highlandheading,
            ),
          ),
          Center(
            child: Text(
              "Mother Theresa Rd, Highlands, Kankanady,",
              style: MyTextStyle.highlandaddress,
            ),
          ),
          Center(
            child: Text(
              "Mangaluru, Karnataka 575002",
              style: MyTextStyle.highlandaddress,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              "RECEIPT",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Receipt No : 5",
                style: MyTextStyle.normalText,
              ),
              Text(
                "Receipt Date : 23 Dec 2019",
                style: MyTextStyle.normalText,
              )
            ],
          ),
          Divider(
            color: Colors.black,
            thickness: 2,
          ),
          Text(
            "Doctor Name: Dr Nithin",
            style: MyTextStyle.normalText,
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.black,
            thickness: 2,
          ),
          Text(
            "We have received Amount from",
            style: MyTextStyle.normalText,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Patient Name:Adharsh",
            style: MyTextStyle.normalText,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Amount Received in Cash",
            style: MyTextStyle.normalText,
          ),
          Text(
            "RS.100.00",
            style: TextStyle(fontSize: 23, color: Colors.black),
          ),
          Text(
            "Rupees One Hundred Only",
            style: MyTextStyle.normalText,
          )
        ],
      ),
    );
  }
}
