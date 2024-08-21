import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';

class LabDetailsPage extends StatelessWidget {
  final String patientName;
  final List<TestDetail> testsDone;
  final String doctorRemarks;

  LabDetailsPage({
    required this.patientName,
    required this.testsDone,
    required this.doctorRemarks,
  });

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
                  // buttonCall(label: "New Bookings", newScreen: NewBookings()),
                  // buttonCall(
                  //     label: "Current Bookings",
                  //     newScreen: CurrentBookingPage()),
                  // buttonCall(label: "Open Stock", newScreen: OpenStock()),
                  // buttonCall(label: "New Stock", newScreen: NewStock()),
                  // buttonCall(label: "Current Stock", newScreen: CurrentStock()),
                ],
              ),
            ],
          ),
        ),

        // ----------------------------------------------------------------------------
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Patient Name
                Text(
                  'Patient Name:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0ea69f), // mainBlue
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  initialValue: patientName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter patient name',
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                // Tests Done
                Text(
                  'Tests Done:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0ea69f), // mainBlue
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: ListView(
                    children: testsDone
                        .map(
                          (test) => ExpansionTile(
                            title: Text(
                              test.name,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              'Date: ${test.date}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  test.report,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(height: 16),
                // Doctor Remarks
                Text(
                  'Doctor Remarks:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0ea69f), // mainBlue
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    doctorRemarks,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TestDetail {
  final String name;
  final String date;
  final String report;

  TestDetail({
    required this.name,
    required this.date,
    required this.report,
  });
}
