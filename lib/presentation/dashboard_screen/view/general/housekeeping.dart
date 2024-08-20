import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';

class Housekeeping extends StatefulWidget {
  const Housekeeping({super.key});

  @override
  State<Housekeeping> createState() => _HousekeepingState();
}

class _HousekeepingState extends State<Housekeeping> {
  final TextEditingController patientIdController = TextEditingController();
  final TextEditingController roomNoController = TextEditingController();
  final TextEditingController floorNoController = TextEditingController();
  String? selectedRequirement;

  final List<String> requirements = [
    'Bedsheet Change',
    'Electricity Issues',
    'Canteen Assistance',
    'Cleaning',
  ];

  void _submitForm() {
    if (patientIdController.text.isNotEmpty &&
        roomNoController.text.isNotEmpty &&
        floorNoController.text.isNotEmpty &&
        selectedRequirement != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Your requirement has been successfully registered.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Handle the case where not all fields are filled
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all the fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/shutterstock_1279052104-1024x683.webp',
                  height: 300,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: patientIdController,
                        // decoration: InputDecoration(
                        //   labelText: 'Patient ID',
                        //   border: OutlineInputBorder(),
                        // ),
                        decoration: InputDecoration(
                            labelText: 'Patient ID',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            filled: true,
                            fillColor: ColorConstants.mainwhite,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: roomNoController,
                        // decoration: InputDecoration(
                        //   labelText: 'Patient Room Number',
                        //   border: OutlineInputBorder(),
                        // ),
                        decoration: InputDecoration(
                            labelText: 'Patient Room Number',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            filled: true,
                            fillColor: ColorConstants.mainwhite,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: floorNoController,

                        // decoration: InputDecoration(
                        //   labelText: 'Floor Number',
                        //   border: OutlineInputBorder(),
                        // ),
                        decoration: InputDecoration(
                            labelText: 'Floor Number',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            filled: true,
                            fillColor: ColorConstants.mainwhite,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: selectedRequirement,
                        hint: Text('Select Requirement'),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            filled: true,
                            fillColor: ColorConstants.mainwhite,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                        items: requirements.map((requirement) {
                          return DropdownMenuItem<String>(
                            value: requirement,
                            child: Text(requirement),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedRequirement = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  _submitForm();
                  patientIdController.clear();
                  roomNoController.clear();
                  floorNoController.clear();
                  setState(() {
                    selectedRequirement = null;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.mainBlue,
                ),
                child: Text(
                  'Submit',
                  style: MyTextStyle.appbartext,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    patientIdController.dispose();
    roomNoController.dispose();
    floorNoController.dispose();
    super.dispose();
  }
}
