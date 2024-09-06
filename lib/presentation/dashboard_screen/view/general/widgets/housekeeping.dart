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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all the fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Housekeeping Request",
                    style: TextStyle(
                      color: ColorConstants.mainBlack,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24),
                  _buildInputField(
                    controller: patientIdController,
                    labelText: 'Patient ID',
                  ),
                  SizedBox(height: 16),
                  _buildInputField(
                    controller: roomNoController,
                    labelText: 'Patient Room Number',
                  ),
                  SizedBox(height: 16),
                  _buildInputField(
                    controller: floorNoController,
                    labelText: 'Floor Number',
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: selectedRequirement,
                    hint: Text('Select Requirement'),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      filled: true,
                      fillColor: ColorConstants.mainwhite,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
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
          ),
          SizedBox(
            width: 100,
          ),
          // Expanded(
          // flex: 3,
          // child:
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: ColorConstants.mainBlue)),
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                image: DecorationImage(
                    image: AssetImage("assets/images/5253089.jpg"),
                    fit: BoxFit.fill
                    // fit: BoxFit.cover,s
                    ),
              ),
            ),
          ),
          // ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        filled: true,
        fillColor: ColorConstants.mainwhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
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
