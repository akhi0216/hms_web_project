import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/model/lab_tests.dart';

// class LabTest {
//   final String testName;
//   final String description;
//   final double price; // Price in rupees
//   final String reportTime; // Time required to receive reports

//   LabTest({
//     required this.testName,
//     required this.description,
//     required this.price,
//     required this.reportTime,
//   });
// }

class LabTests extends StatefulWidget {
  @override
  _LabModuleState createState() => _LabModuleState();
}

class _LabModuleState extends State<LabTests> {
  List<LabTest> availableTests = [
    LabTest(
        testName: "Blood Test",
        description: "Complete blood count",
        price: 500,
        reportTime: "24 hours"),
    LabTest(
        testName: "X-Ray",
        description: "Chest X-Ray",
        price: 1000,
        reportTime: "2 hours"),
    LabTest(
        testName: "MRI",
        description: "Brain MRI",
        price: 15000,
        reportTime: "48 hours"),
    LabTest(
        testName: "Urine Test",
        description: "Routine urine analysis",
        price: 300,
        reportTime: "12 hours"),
    LabTest(
        testName: "CT Scan",
        description: "Abdomen CT Scan",
        price: 8000,
        reportTime: "6 hours"),
    LabTest(
        testName: "Liver Function Test",
        description: "Liver enzyme levels",
        price: 1200,
        reportTime: "24 hours"),
    LabTest(
        testName: "ECG",
        description: "Electrocardiogram",
        price: 700,
        reportTime: "30 minutes"),
    LabTest(
        testName: "Ultrasound",
        description: "Pelvic Ultrasound",
        price: 2000,
        reportTime: "1 hour"),
    LabTest(
        testName: "Thyroid Profile",
        description: "Thyroid hormone levels",
        price: 900,
        reportTime: "24 hours"),
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    List<LabTest> filteredTests = availableTests
        .where((test) =>
            test.testName.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Search Tests',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.teal[50],
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Text("Available Lab Tests",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal)),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: filteredTests.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        shadowColor: Colors.teal.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16),
                          leading: CircleAvatar(
                            backgroundColor: Colors.teal,
                            child: Icon(Icons.science, color: Colors.white),
                          ),
                          title: Text(filteredTests[index].testName,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8),
                              Text(filteredTests[index].description),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "₹${filteredTests[index].price.toStringAsFixed(2)}",
                                      style: TextStyle(color: Colors.teal)),
                                  Text(
                                      "Report Time: ${filteredTests[index].reportTime}",
                                      style: TextStyle(color: Colors.teal)),
                                ],
                              ),
                            ],
                          ),
                          trailing:
                              Icon(Icons.arrow_forward_ios, color: Colors.teal),
                          onTap: () => _bookTest(filteredTests[index]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _bookTest(LabTest test) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Book Test'),
          content: Text('Do you want to book the ${test.testName}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showBookingForm(test);
              },
              child: Text('Yes', style: TextStyle(color: Colors.teal)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No', style: TextStyle(color: Colors.teal)),
            ),
          ],
        );
      },
    );
  }

  void _showBookingForm(LabTest test) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Enter Details for ${test.testName}',
              style: TextStyle(color: Colors.teal)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Patient Id',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  filled: true,
                  fillColor: Colors.teal[50],
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  filled: true,
                  fillColor: Colors.teal[50],
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  filled: true,
                  fillColor: Colors.teal[50],
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('${test.testName} booked successfully!')),
                );
              },
              child: Text('Submit', style: TextStyle(color: Colors.teal)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: Colors.teal)),
            ),
          ],
        );
      },
    );
  }
}
