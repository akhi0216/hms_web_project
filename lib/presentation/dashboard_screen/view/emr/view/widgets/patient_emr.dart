import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/search_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PatientEmr extends StatefulWidget {
  const PatientEmr({super.key});

  @override
  State<PatientEmr> createState() => _PatientEmrState();
}

class _PatientEmrState extends State<PatientEmr> {
  late FocusNode ipFocusNode;
  late FocusNode opFocusNode;
  late FocusNode daycareFocusNode;

  TextEditingController pidController = TextEditingController();
  // Patient details controllers
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final genderController = TextEditingController();
  final emailController = TextEditingController();
  final relTypeController = TextEditingController();
  final relContactController = TextEditingController();
  final bloodController = TextEditingController();
  final sexController = TextEditingController();

  final Controller = TextEditingController();
  // id controllers
  final ipIdController = TextEditingController();
  final opIdController = TextEditingController();
  final daycareIdController = TextEditingController();

  bool buttonVisible = false;
  bool ipIdVisible = false;
  bool opIdVisible = false;
  bool daycareIdVisible = false;
  bool ipVisible = false;
  bool opVisible = false;
  bool daycareVisible = false;

  String? firstName;
  String? lastName;

  Map<String, String> ipPatientDetails = {
    "id": "IP No",
    "date": "Date",
    "issue": "Issue",
    "doc": "Consulted Doctor",
    "remarks": "Doctor Remarks",
    "dept": "Department",
    "lab": "Lab Tests",
    "status": "Ip Status",
    "roomno": "Room No",
    "wardno": "Ward No",
    "floor": "Floor",
  };
  Map<String, String> opPatientDetails = {
    "id": "Op No",
    "date": "Date",
    "issue": "Issue",
    "doc": "Consulted Doctor",
    "remarks": "Doctor Remarks",
    "dept": "Department",
    "lab": "Lab Tests",
  };
  Map<String, String> daycarePatientDetails = {
    "id": "Daycare No",
    "date": "Date",
    "issue": "Issue",
    "doc": "Consulted Doctor",
    "remarks": "Doctor Remarks",
    "dept": "Department",
    "lab": "Lab Tests",
    "status": "Daycare Status",
    "roomno": "Room No",
    "wardno": "Ward No",
    "floor": "Floor",
  };

  String calculateAge(TextSearchController patientDataProvider) {
    String? date = patientDataProvider.patientSearchModel.list?[0].dob;
    DateTime today = DateTime.now();
    DateTime dob = date != "" ? DateFormat('yyyy-MM-dd').parse(date!) : today;
    print(today);
    print(dob);
    var year = today.year - dob.year;
    var mth = today.month - dob.month;
    var days = today.day - dob.day;
    if (year <= 0) {
      year = 0;
    } else if (mth < 0) {
      year = year - 1;
    } else if (mth == 0 && days < 0) {
      year = year - 1;
    }
    return year.toString();
  }

  @override
  void initState() {
    super.initState();
    ipFocusNode = FocusNode();
    opFocusNode = FocusNode();
    daycareFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    ipFocusNode.dispose();
    opFocusNode.dispose();
    daycareFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var patientDataFunctionProvider =
        Provider.of<TextSearchController>(context, listen: false);
    var patientDataProvider = Provider.of<TextSearchController>(context);
    return Column(
      children: [
        SizedBox(height: 30),
        buildActionTextField(
          label: "Enter patient id",
          controller: pidController,
          onChanged: () async {
            await patientDataFunctionProvider
                .searchPatient(pidController.text.trim());
            if (patientDataProvider.patientSearchModel.list?.length != 0) {
              setState(() {
                firstName =
                    patientDataProvider.patientSearchModel.list?[0].fname ?? "";
                lastName =
                    patientDataProvider.patientSearchModel.list?[0].lname ?? "";
                nameController.text = firstName! + ' ' + lastName!;
                ageController.text = calculateAge(patientDataProvider);
                sexController.text =
                    patientDataProvider.patientSearchModel.list?[0].gender ??
                        "";
                bloodController.text =
                    patientDataProvider.patientSearchModel.list?[0].bldgrp ??
                        "";
                addressController.text =
                    patientDataProvider.patientSearchModel.list?[0].address ??
                        "";
                mobileController.text =
                    patientDataProvider.patientSearchModel.list?[0].mob ?? "";
                emailController.text =
                    patientDataProvider.patientSearchModel.list?[0].email ?? "";
                relTypeController.text =
                    patientDataProvider.patientSearchModel.list?[0].reltype ??
                        "";
                relContactController.text = patientDataProvider
                        .patientSearchModel.list?[0].relcontact ??
                    "";
                buttonVisible = true;
              });
            } else {
              setState(() {
                nameController.clear();
                ageController.clear();
                sexController.clear();
                bloodController.clear();
                addressController.clear();
                mobileController.clear();
                emailController.clear();
                relTypeController.clear();
                relContactController.clear();
              });
            }
          },
        ),
        SizedBox(height: size.height * .01),
        buildTextField(controller: nameController, label: "Patient name"),
        SizedBox(height: size.height * .01),
        buildTextField(controller: ageController, label: "Age"),
        SizedBox(height: size.height * .01),
        buildTextField(controller: sexController, label: "Gender"),
        SizedBox(height: size.height * .01),
        buildTextField(controller: bloodController, label: "Blood Group"),
        SizedBox(height: size.height * .01),
        buildTextField(controller: addressController, label: "Address"),
        SizedBox(height: size.height * .01),
        buildTextField(controller: mobileController, label: "Mobile"),
        SizedBox(height: size.height * .01),
        buildTextField(controller: emailController, label: "Email"),
        SizedBox(height: size.height * .01),
        buildTextField(controller: relTypeController, label: "Bystander"),
        SizedBox(height: size.height * .01),
        buildTextField(
            controller: relContactController, label: "Emergency contact"),
        SizedBox(height: size.height * .01),
        Visibility(
          visible: buttonVisible,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton(
                text: "IP DETAILS",
                onTap: () {
                  setState(() {
                    ipIdVisible = true;
                    opIdVisible = false;
                    daycareIdVisible = false;
                    opVisible = false;
                    daycareVisible = false;
                    opIdController.clear();
                    daycareIdController.clear();
                    ipFocusNode.requestFocus();
                  });
                },
              ),
              buildButton(
                text: "OP DETAILS",
                onTap: () {
                  setState(() {
                    opIdVisible = true;
                    ipIdVisible = false;
                    daycareIdVisible = false;
                    ipVisible = false;
                    daycareVisible = false;
                    ipIdController.clear();
                    daycareIdController.clear();
                    opFocusNode.requestFocus();
                  });
                },
              ),
              buildButton(
                text: "DAYCARE DETAILS",
                onTap: () {
                  setState(() {
                    daycareIdVisible = true;
                    opIdVisible = false;
                    ipIdVisible = false;
                    ipVisible = false;
                    opVisible = false;
                    ipIdController.clear();
                    opIdController.clear();
                    daycareFocusNode.requestFocus();
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(height: size.height * .01),
        Visibility(
          visible: ipIdVisible,
          child: buildActionTextField(
            label: "Enter IP id",
            controller: ipIdController,
            focusNode: ipFocusNode,
            onChanged: () {
              setState(() {
                ipIdVisible = true;
                opIdVisible = false;
                daycareIdVisible = false;
                ipVisible = true;
                opVisible = false;
                daycareVisible = false;
              });
            },
          ),
        ),
        Visibility(
          visible: opIdVisible,
          child: buildActionTextField(
            label: "Enter OP id",
            controller: opIdController,
            focusNode: opFocusNode,
            onChanged: () {
              setState(() {
                opIdVisible = true;
                ipIdVisible = false;
                daycareIdVisible = false;
                opVisible = true;
                ipVisible = false;
                daycareVisible = false;
              });
            },
          ),
        ),
        Visibility(
          visible: daycareIdVisible,
          child: buildActionTextField(
            label: "Enter DayCare id",
            controller: daycareIdController,
            focusNode: daycareFocusNode,
            onChanged: () {
              setState(() {
                daycareIdVisible = true;
                ipIdVisible = false;
                opIdVisible = false;
                daycareVisible = true;
                ipVisible = false;
                opVisible = false;
              });
            },
          ),
        ),
        SizedBox(height: size.height * .01),
        // ----------------------------------------------------------------------------------------------
        patientEmrView(visibility: ipVisible, patientDetails: ipPatientDetails),
        patientEmrView(visibility: opVisible, patientDetails: opPatientDetails),
        patientEmrView(
            visibility: daycareVisible, patientDetails: daycarePatientDetails),
        SizedBox(height: size.height * .01),
      ],
    );
  }

  Widget buildActionTextField({
    required String label,
    required TextEditingController controller,
    required VoidCallback? onChanged,
    FocusNode? focusNode,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onTap: () => controller.selection =
          TextSelection(baseOffset: 0, extentOffset: controller.text.length),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(5),
        label: Text(label),
        suffixIcon: IconButton(
          onPressed: onChanged,
          icon: Icon(
            Icons.check,
            color: ColorConstants.mainBlue,
          ),
        ),
        // suffix: Visibility(
        //   visible: label == 'Enter patient id' ? false : true,
        //   child: InkWell(
        //     onTap: cancelButton,
        //     child: Container(
        //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10),
        //         color: ColorConstants.mainBlue,
        //       ),
        //       child: Text("cancel"),
        //     ),
        //   ),
        // ),
      ),
      onFieldSubmitted: (value) => onChanged!(),
    );
  }

  Widget buildTextField(
      {required TextEditingController controller, required String label}) {
    return TextFormField(
      controller: controller,
      enabled: false,
      readOnly: true,
      style: TextStyle(
        color: Colors.grey[800],
      ),
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(
            color: Colors.grey[600]!,
          ),
        ),
        enabled: false,
        contentPadding: EdgeInsets.all(5),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey[600]!,
        )),
        labelStyle: TextStyle(
          color: Colors.grey[800],
        ),
      ),
    );
  }

  Widget buildButton(
      {required String text, required GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      // () {
      //   setState(() {
      //     if (text == 'IP DETAILS') {
      //       ipIdVisible = true;
      //       opIdVisible = false;
      //       daycareIdVisible = false;
      //     } else if (text == 'OP DETAILS') {
      // opIdVisible = true;
      // ipIdVisible = false;
      // daycareIdVisible = false;
      //     } else if (text == 'DAYCARE DETAILS') {
      // daycareIdVisible = true;
      // opIdVisible = false;
      // ipIdVisible = false;
      //     }
      //   });
      // },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: ColorConstants.mainBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: MyTextStyle.normalWhiteText,
        ),
      ),
    );
  }

  Widget patientEmrView(
      {required bool visibility, required Map<String, String> patientDetails}) {
    return Visibility(
      visible: visibility,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(patientDetails['id'] ?? ""),
                            SizedBox(height: 10),
                            Text(patientDetails['date'] ?? ""),
                            SizedBox(height: 10),
                            Text(patientDetails['issue'] ?? ""),
                            SizedBox(height: 10),
                            Text(patientDetails['doc'] ?? ""),
                            SizedBox(height: 10),
                            Text(patientDetails['remarks'] ?? ""),
                            SizedBox(height: 10),
                            Text(patientDetails['dept'] ?? ""),
                            SizedBox(height: 10),
                            // Text(patientDetails['lab'] ?? ""),
                            // SizedBox(height: 10),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text("  : "),
                            SizedBox(height: 10),
                            Text("  : "),
                            SizedBox(height: 10),
                            Text("  : "),
                            SizedBox(height: 10),
                            Text("  : "),
                            SizedBox(height: 10),
                            Text("  : "),
                            SizedBox(height: 10),
                            Text("  : "),
                            SizedBox(height: 10),
                            Text("  : "),
                            SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: opVisible ? false : true,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(patientDetails['status'] ?? ""),
                              SizedBox(height: 10),
                              Text(patientDetails['roomno'] ?? ""),
                              SizedBox(height: 10),
                              Text(patientDetails['wardno'] ?? ""),
                              SizedBox(height: 10),
                              Text(patientDetails['floor'] ?? ""),
                              SizedBox(height: 10),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text("  : "),
                              SizedBox(height: 10),
                              Text("  : "),
                              SizedBox(height: 10),
                              Text("  : "),
                              SizedBox(height: 10),
                              Text("  : "),
                              SizedBox(height: 10),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  // width: MediaQuery.sizeOf(context).width * .7,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: DataTable(
                      // border: TableBorder(),
                      headingRowColor: WidgetStateColor.resolveWith(
                        (states) => ColorConstants.mainBlue,
                      ),
                      headingTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      // clipBehavior: Clip.antiAlias,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.only(
                      //     topLeft: Radius.circular(10),
                      //     topRight: Radius.circular(10),
                      //   ),
                      // ),
                      columns: [
                        DataColumn(label: Text("Test")),
                        DataColumn(label: Text("Date")),
                        DataColumn(label: Text("Result")),
                        DataColumn(label: Text("Remarks")),
                      ],
                      rows: List.generate(
                        3,
                        (index) {
                          return DataRow(cells: [
                            DataCell(
                              Text("data"),
                            ),
                            DataCell(
                              Text("data"),
                            ),
                            DataCell(
                              Text("data"),
                            ),
                            DataCell(
                              Text("data"),
                            ),
                          ]);
                        },
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
