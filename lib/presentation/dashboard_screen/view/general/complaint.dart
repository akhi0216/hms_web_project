import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/complaints_controller.dart';
import 'package:provider/provider.dart';

class Complaint extends StatefulWidget {
  const Complaint({super.key});

  @override
  State<Complaint> createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  final datecontroller = TextEditingController();
  final empcodecontroller = TextEditingController();
  final complaintcontroller = TextEditingController();
  final towhomcontroller = TextEditingController();

  String? _selectedDesignation;

  @override
  void dispose() {
    datecontroller.dispose();
    empcodecontroller.dispose();
    complaintcontroller.dispose();
    towhomcontroller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        datecontroller.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  fetchData() async {
    await Provider.of<ComplaintsController>(context, listen: false)
        .designations();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var functionprovider =
        Provider.of<ComplaintsController>(context, listen: false);
    var varprovider = Provider.of<ComplaintsController>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: ColorConstants.mainBlue),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Staff Complaint/Requirement Form",
                          style: MyTextStyle.highlandheading,
                        ),
                        SizedBox(height: 16),
                        Text("Employee Code:", style: MyTextStyle.normalText),
                        Container(
                          width: 200, // Set a specific width
                          child: TextFormField(
                            controller: empcodecontroller,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: ColorConstants.mainwhite),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text("To:", style: MyTextStyle.normalText),
                        // Container(
                        //   width: 200, // Set a specific width
                        //   child: DropdownButtonFormField<String>(
                        //     items: [
                        //       DropdownMenuItem(
                        //           child: Text('Option 1'), value: '1'),
                        //       DropdownMenuItem(
                        //           child: Text('Option 2'), value: '2'),
                        //     ],
                        //     onChanged: (value) {},
                        //     decoration: InputDecoration(
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(8),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // ------------------
                        Container(
                          constraints: BoxConstraints(maxWidth: 400),
                          child: DropdownButtonFormField(
                            value: _selectedDesignation,
                            hint: Text('Designations'),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                filled: true,
                                fillColor: ColorConstants.mainwhite,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                            items: varprovider.designationList.map(
                              (value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                            onTap: () {
                              print(varprovider.designationList);
                            },
                            onChanged: (value) {
                              setState(() {
                                _selectedDesignation = value;
                              });
                            },
                          ),
                        ),

                        // -----------------
                        SizedBox(height: 16),
                        Text("Date:", style: MyTextStyle.normalText),
                        TextFormField(
                          controller: datecontroller,
                          readOnly: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              suffixIcon: Icon(Icons.calendar_today),
                              filled: true,
                              fillColor: ColorConstants.mainwhite),
                          onTap: () => _selectDate(context),
                        ),
                        SizedBox(height: 16),
                        Text("Complaint/Requirement:",
                            style: MyTextStyle.normalText),
                        TextFormField(
                          controller: complaintcontroller,
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Center(
                            child: ElevatedButton(
                          onPressed: () async {
                            empcodecontroller.clear();
                            datecontroller.clear();
                            complaintcontroller.clear();
                            towhomcontroller.clear();

                            // Show a dialog box
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Success'),
                                  content: Text(
                                      'Your complaint has been successfully registered.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );

                            // --------------------------------------------------
                            // await functionprovider.complaintRegistering(
                            //     empid: empcodecontroller.text,
                            //     date: datecontroller.text,
                            //     towhom: towhomcontroller.text,
                            //     complaint: complaintcontroller.text);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                ColorConstants.mainBlue, // Set the button color
                          ),
                          child: Text(
                            'Submit',
                            style: MyTextStyle.appbartext,
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: Image.network(
                      'https://images.pexels.com/photos/6098052/pexels-photo-6098052.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
