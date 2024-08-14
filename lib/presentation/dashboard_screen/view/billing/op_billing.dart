import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/texts.dart';

class OpBilling extends StatefulWidget {
  const OpBilling({super.key});

  @override
  State<OpBilling> createState() => _OpBillingState();
}

class _OpBillingState extends State<OpBilling> {
  final TextEditingController _doctorNameController = TextEditingController();
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _wardRoomController = TextEditingController();

  // Boolean to track visibility of details
  bool _showDetails = false;

  @override
  void dispose() {
    _doctorNameController.dispose();
    _patientNameController.dispose();
    _wardRoomController.dispose();
    super.dispose();
  }

  void _toggleDetails() {
    setState(() {
      _showDetails = !_showDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "HIGHLAND HOSPITAL RESEARCH AND DIAGNOSTIC CENTRE",
                style: MyTextStyle.highlandheading.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                "Mother Theresa Rd, Highlands, Kankanady,",
                style: MyTextStyle.highlandaddress.copyWith(fontSize: 16),
              ),
            ),
            Center(
              child: Text(
                "Mangaluru, Karnataka 575002",
                style: MyTextStyle.highlandaddress.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                "RECEIPT",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            Divider(color: Colors.black, thickness: 2),
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
                ),
              ],
            ),
            Divider(color: Colors.black, thickness: 2),
            Text(
              "Doctor Name:",
              style: MyTextStyle.normalText,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _doctorNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // hintText: 'Enter Doctor Name',
                ),
              ),
            ),
            SizedBox(height: 15),
            Divider(color: Colors.black, thickness: 2),
            Text(
              "We have received Amount from",
              style: MyTextStyle.normalText,
            ),
            SizedBox(height: 5),
            Text(
              "Patient Name:",
              style: MyTextStyle.normalText,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _patientNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // hintText: 'Enter Patient Name',
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Ward/Room No:",
              style: MyTextStyle.normalText,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _wardRoomController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // hintText: 'Enter Ward/Room No',
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: _toggleDetails,
              child: Text(_showDetails ? "Hide Details" : "Show Details"),
            ),
            SizedBox(height: 20),
            // Show details based on _showDetails
            Visibility(
              visible: _showDetails,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lab Reports:",
                    style: MyTextStyle.normalText.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Test: Blood Test",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Date: 22 Dec 2019",
                            style: MyTextStyle.normalText,
                          ),
                          Text(
                            "Report: All values are within the normal range.",
                            style: MyTextStyle.normalText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Test: X-Ray",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Date: 22 Dec 2019",
                            style: MyTextStyle.normalText,
                          ),
                          Text(
                            "Report: No fractures observed.",
                            style: MyTextStyle.normalText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Pharmacy Details:",
                    style: MyTextStyle.normalText.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Medicine 1",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Price: Rs. 50.00",
                            style: MyTextStyle.normalText,
                          ),
                          Text(
                            "Quantity: 2",
                            style: MyTextStyle.normalText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Medicine 2",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Price: Rs. 30.00",
                            style: MyTextStyle.normalText,
                          ),
                          Text(
                            "Quantity: 1",
                            style: MyTextStyle.normalText,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Amount Received in Cash",
                      style: MyTextStyle.normalText.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "RS.100.00",
                      style: TextStyle(fontSize: 23, color: Colors.black),
                    ),
                    Text(
                      "Rupees One Hundred Only",
                      style: MyTextStyle.normalText,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "GST (18%)",
                      style: MyTextStyle.normalText.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "RS.18.00",
                      style: TextStyle(fontSize: 23, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
