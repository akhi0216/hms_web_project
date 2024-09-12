import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/search_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/contoller/leave_req.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController empidController = TextEditingController();
  TextEditingController empnameController = TextEditingController();
  TextEditingController empdeptController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var staffDetailsFunctionProvider =
        Provider.of<TextSearchController>(context, listen: false);
    var staffDetailsProvider = Provider.of<TextSearchController>(context);
    var leaveSubmitProvider =
        Provider.of<LeaveReqControllers>(context, listen: false);
    var leaveProvider = Provider.of<LeaveReqControllers>(context);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.sizeOf(context).width * .02,
                top: 20,
                bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: ColorConstants.lightBlue,
                // ),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorConstants.lightBlue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * .4,
                    // maxHeight: MediaQuery.sizeOf(context).height * .6
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Request Leave",
                        style: TextStyle(
                          color: ColorConstants.lightBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * .01),
                      buildActionTextFormField(
                        label: "Emplyee id",
                        controller: empidController,
                        onChanged: () async {
                          await staffDetailsFunctionProvider
                              .searchDoctor(empidController.text.trim());
                          empnameController.text =
                              staffDetailsProvider.doctorSearchModel.fname ??
                                  '';
                          empdeptController.text = staffDetailsProvider
                                  .doctorSearchModel.department ??
                              '';
                        },
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * .01),
                      buildTextFormField(
                        label: "Name",
                        readOnly: true,
                        controller: empnameController,
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * .01),
                      buildTextFormField(
                        label: "Department",
                        readOnly: true,
                        controller: empdeptController,
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * .01),
                      buildDatePickerFormField(
                        label: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: "Start Date",
                            ),
                            TextSpan(
                              text: " *",
                              style: TextStyle(color: ColorConstants.mainRed),
                            ),
                          ]),
                        ),
                        controller: startDateController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Select Date';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * .01),
                      buildDatePickerFormField(
                        label: Text("End Date (Optional)"),
                        controller: endDateController,
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * .01),
                      buildTextFormField(
                        label: "Reason",
                        controller: reasonController,
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * .01),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await leaveSubmitProvider.leaveRequestFunction(
                                eid: empidController.text.trim(),
                                currentDate: DateFormat('dd-MM-yyyy')
                                    .format(DateTime.now())
                                    .toString(),
                                reason: reasonController.text.trim(),
                                startDate: startDateController.text.trim(),
                                endDate: endDateController.text.trim(),
                                dept: empdeptController.text.trim());
                            if (leaveProvider.leaveRequest == 200) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Leave Request"),
                                    content: Text(
                                        "Please wait for the conformation"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Back"),
                                      )
                                    ],
                                  );
                                },
                              );
                            }
                            empidController.clear();
                            empnameController.clear();
                            empdeptController.clear();
                            startDateController.clear();
                            endDateController.clear();
                            reasonController.clear();
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(ColorConstants.lightBlue),
                        ),
                        child: Text(
                          "Request",
                          style: TextStyle(color: ColorConstants.mainwhite),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildActionTextFormField(
      {required String label,
      required TextEditingController controller,
      required VoidCallback onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: label,
            ),
            TextSpan(
              text: " *",
              style: TextStyle(color: ColorConstants.mainRed),
            ),
          ]),
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  // label: Text(label),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: onChanged,
                    icon: Icon(
                      Icons.check,
                      color: ColorConstants.lightBlue,
                    ),
                  ),
                ),
                onChanged: (value) => onChanged(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter $label';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDatePickerFormField(
      {required Widget label,
      required TextEditingController controller,
      FormFieldValidator? validate}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label,
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            // labelText: label,
            border: OutlineInputBorder(),
            // prefixIcon: Icon(Icons.check, color: Colors.teal),
          ),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              setState(() {
                controller.text =
                    "${DateFormat('dd-MM-yyyy').format(pickedDate)}"
                        .split(' ')[0];
              });
            }
          },
          validator: validate,
        ),
      ],
    );
  }

  Widget buildTextFormField(
      {required String label,
      required TextEditingController controller,
      bool readOnly = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: label,
            ),
            TextSpan(
              text: " *",
              style: TextStyle(color: ColorConstants.mainRed),
            ),
          ]),
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                readOnly: readOnly,
                decoration: InputDecoration(
                  // label: Text(label),
                  border: OutlineInputBorder(),
                ),
                controller: controller,
                minLines: 1,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter $label';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
