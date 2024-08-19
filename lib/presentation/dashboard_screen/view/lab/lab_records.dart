import 'package:flutter/material.dart';

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
    return Container(
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
              children: testsDone.map(
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
              ).toList(),
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
