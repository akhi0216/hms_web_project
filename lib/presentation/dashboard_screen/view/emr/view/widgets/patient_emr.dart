import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/search_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/emr/controller/emr_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/emr/model/emr_ip_model.dart';
import 'package:hms_web_project/presentation/login_page/controller/login_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PatientEmr extends StatefulWidget {
  const PatientEmr({super.key, required this.scrollController});
  final ScrollController scrollController;
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

  int? ipSelectedValue;
  int? opSelectedValue;
  String? firstName;
  String? lastName;

  _scrollToBottom() {
    widget.scrollController
        .jumpTo(widget.scrollController.position.maxScrollExtent);
  }

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
    print(date);
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
    var emrprovider = Provider.of<EmrScreenController>(context);
    var emrFunctionProvider =
        Provider.of<EmrScreenController>(context, listen: false);
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
              ipIdVisible = false;
              opIdVisible = false;
              daycareIdVisible = false;
              ipVisible = false;
              opVisible = false;
              daycareVisible = false;
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
                onTap: () async {
                  setState(() {
                    ipSelectedValue = null;
                    ipIdVisible = true;
                    opIdVisible = false;
                    daycareIdVisible = false;
                    opVisible = false;
                    daycareVisible = false;
                    opIdController.clear();
                    daycareIdController.clear();
                    ipFocusNode.requestFocus();
                  });
                  await emrFunctionProvider.ipidFetch(
                    pid: pidController.text.trim(),
                  );
                },
              ),
              buildButton(
                text: "OP DETAILS",
                onTap: () async {
                  setState(() {
                    opSelectedValue = null;
                    opIdVisible = true;
                    ipIdVisible = false;
                    daycareIdVisible = false;
                    ipVisible = false;
                    daycareVisible = false;
                    ipIdController.clear();
                    daycareIdController.clear();
                    opFocusNode.requestFocus();
                  });
                  await emrFunctionProvider.opidFetch(
                    pid: pidController.text.trim(),
                  );
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
          child: buildDropDownField(
            hint: "Select a ip id",
            items: List.generate(
              emrprovider.ipIdList.length,
              (index) => DropdownMenuItem(
                child: Text(emrprovider.ipIdList[index]),
                value: int.parse(emrprovider.ipIdList[index]),
              ),
            ),
            selectedValue: ipSelectedValue,
            onChanged: (value) async {
              setState(() {});
              ipSelectedValue = value;
              await emrprovider.ipEmrDetails(
                pid: pidController.text.trim(),
                ipid: ipSelectedValue.toString(),
              );
              await emrprovider.emrRadiologyDetails(
                  pid: pidController.text.trim());
              _scrollToBottom();
              if (emrprovider.emrIpModel.ipno == ipSelectedValue.toString()) {
                setState(() {
                  ipIdVisible = true;
                  ipVisible = true;
                  opIdVisible = false;
                  daycareIdVisible = false;
                  opVisible = false;
                  daycareVisible = false;
                });
              } else {
                setState(() {});
                ipSelectedValue = null;
                emrprovider.ipIdList.clear();
                ipVisible = false;
              }
            },
          ),
          // buildActionTextField(
          //   label: "Enter IP id",
          //   controller: ipIdController,
          //   focusNode: ipFocusNode,
          //   onChanged: () async {
          // await emrprovider.ipEmrDetails(
          //   pid: pidController.text.trim(),
          //   ipid: ipIdController.text.trim(),
          // );
          // _scrollToBottom();
          // if (emrprovider.emrIpModel.ipno == ipIdController.text.trim()) {
          //   setState(() {
          //     ipIdVisible = true;
          //     opIdVisible = false;
          //     daycareIdVisible = false;
          //     ipVisible = true;
          //     opVisible = false;
          //     daycareVisible = false;
          //   });
          // } else {
          //   setState(() {});
          //   ipIdController.clear();
          //   ipVisible = false;
          // }
          //   },
          // ),
        ),
        Visibility(
          visible: opIdVisible,
          child: buildDropDownField(
            hint: "Select a op id",
            items: List.generate(
              emrprovider.opIdList.length,
              (index) => DropdownMenuItem(
                child: Text(emrprovider.opIdList[index]),
                value: int.parse(emrprovider.opIdList[index]),
              ),
            ),
            selectedValue: opSelectedValue,
            onChanged: (value) async {
              setState(() {});
              opSelectedValue = value;
              await emrprovider.opEmrDetails(
                pid: pidController.text.trim(),
                opid: opSelectedValue.toString(),
              );

              _scrollToBottom();
              if (emrprovider.emrOpModel.opno == opSelectedValue.toString()) {
                setState(() {
                  opIdVisible = true;
                  opVisible = true;
                  ipIdVisible = false;
                  ipVisible = false;
                  daycareIdVisible = false;
                  daycareVisible = false;
                });
              } else {
                setState(() {});
                opSelectedValue = null;
                emrprovider.opIdList.clear();
                opVisible = false;
              }
            },
          ),
          // buildActionTextField(
          //   label: "Enter OP id",
          //   controller: opIdController,
          //   focusNode: opFocusNode,
          //   onChanged: () async {
          //     await emrprovider.opEmrDetails(
          //       pid: pidController.text.trim(),
          //       opid: ipIdController.text.trim(),
          //     );
          //     if (opIdController.text == emrprovider.emrOpModel.opno) {
          //       setState(() {
          // opIdVisible = true;
          // ipIdVisible = false;
          // daycareIdVisible = false;
          // opVisible = true;
          // ipVisible = false;
          // daycareVisible = false;
          //       });
          //     } else {
          //       setState(() {});
          //       opIdController.clear();
          //       opVisible = false;
          //     }
          //   },
          // ),
        ),
        Visibility(
          visible: daycareIdVisible,
          child: buildActionTextField(
            label: "Enter DayCare id",
            controller: daycareIdController,
            focusNode: daycareFocusNode,
            onChanged: () {
              if (emrprovider.emrIpModel.ipno ==
                  daycareIdController.text.trim()) {
                setState(() {
                  daycareIdVisible = true;
                  ipIdVisible = false;
                  opIdVisible = false;
                  daycareVisible = true;
                  ipVisible = false;
                  opVisible = false;
                });
              } else {
                setState(() {});
                daycareIdController.clear();
                daycareVisible = false;
              }
            },
          ),
        ),
        SizedBox(height: size.height * .01),
        // ----------------------------------------------------------------------------------------------
        patientEmrView(
          visibility: ipVisible,
          patientDetails: ipPatientDetails,
          emrDetails: {
            "id": emrprovider.emrIpModel.ipno,
            "date": emrprovider.emrIpModel.date,
            "issue": emrprovider.emrIpModel.sosIssue,
            "doc": emrprovider.emrIpModel.bookingDoctorName,
            "remarks": 'Remarks',
            "dept": emrprovider.emrIpModel.bookingDepartment,
            "status": 'Discharged',
            "roomno": "Room No",
            "wardno": "Ward No",
            "floor": "Floor",
          },
          labTests: emrprovider.emrIpModel.labTestName,
        ),
        patientEmrView(
          visibility: opVisible,
          patientDetails: opPatientDetails,
          emrDetails: {
            "id": emrprovider.emrOpModel.opno,
            "date": emrprovider.emrOpModel.date,
            "issue": emrprovider.emrOpModel.sosIssue,
            "doc": emrprovider.emrOpModel.bookingDoctorName,
            "remarks": emrprovider.emrOpModel.ambulanceDoctor,
            "dept": emrprovider.emrOpModel.bookingDepartment,
            "status": 'Discharged',
            "roomno": "Room No",
            "wardno": "Ward No",
            "floor": "Floor",
          },
          labTests: emrprovider.emrOpModel.labTestName,
        ),
        patientEmrView(
          visibility: daycareVisible,
          patientDetails: daycarePatientDetails,
        ),
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
        constraints: BoxConstraints(
            // maxWidth: 150,
            ),
        child: Text(
          text,
          style: MyTextStyle.normalWhiteText,
        ),
      ),
    );
  }

  bool ambulanceVisible = false;
  bool sosVisible = false;
  TextEditingController controller = TextEditingController();

  Widget patientEmrView(
      {required bool visibility,
      required Map<String, String> patientDetails,
      Map<String, dynamic>? emrDetails,
      List<LabTestName>? labTests}) {
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

                            // ----------------basic details
                            // Text('ambulance details'),
                            // SizedBox(height: 10),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text("  : ${emrDetails?['id'] ?? ''}"),
                            SizedBox(height: 10),
                            Text("  : ${emrDetails?['date'] ?? ''}"),
                            SizedBox(height: 10),
                            Text("  : ${emrDetails?['issue'] ?? ''}"),
                            SizedBox(height: 10),
                            Text("  : ${emrDetails?['doc'] ?? ''}"),
                            SizedBox(height: 10),
                            Text("  : ${emrDetails?['remarks'] ?? ''}"),
                            SizedBox(height: 10),
                            Text("  : ${emrDetails?['dept'] ?? ''}"),
                            SizedBox(height: 10),
                            // Text("  : "),
                            // SizedBox(height: 10),
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
                              Text("  : ${emrDetails?['status'] ?? ''}"),
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
          // ------------------------------------------------------------------------------------------------------------
          buildTable(
              rows: List.generate(
                labTests?.length ?? 0,
                (index) {
                  return DataRow(cells: [
                    DataCell(
                      Text(labTests?[index].testName ?? ''),
                    ),
                    DataCell(
                      Text(labTests?[index].duration ?? ''),
                    ),
                    DataCell(
                      Text(labTests?[index].staffAlloted ?? ''),
                    ),
                    DataCell(
                      Text(labTests?[index].price ?? ''),
                    ),
                  ]);
                },
              ),
              columns: [
                DataColumn(label: Text("Test")),
                DataColumn(label: Text("Duration")),
                DataColumn(label: Text("Staff Alloted")),
                DataColumn(label: Text("Price")),
              ]),
          SizedBox(height: MediaQuery.sizeOf(context).height * .01),
          buildTable(columns: [
            DataColumn(label: Text("Test")),
            DataColumn(label: Text("Time")),
            DataColumn(label: Text("Date")),
            DataColumn(label: Text("Reason")),
          ], rows: []),

          // ===============================================radiology table
          SizedBox(height: MediaQuery.sizeOf(context).height * .01),
          Visibility(
            visible: opVisible ? false : true,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton(
                        text: "Ambulance Details",
                        onTap: () {
                          setState(() {
                            sosVisible = false;
                            ambulanceVisible = !ambulanceVisible;
                          });
                        }),
                    buildButton(
                        text: "SOS Details",
                        onTap: () {
                          setState(() {
                            ambulanceVisible = false;
                            sosVisible = !sosVisible;
                          });
                        }),
                  ],
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * .01),
                additionalDetails(
                  visibility: ambulanceVisible,
                  labels: [
                    'ambulance_date',
                    'ambulance_issue_registered',
                    'ambulance_department',
                    'ambulance_id',
                    'ambulance_doctor',
                  ],
                  details: [
                    patientDetails['ambulance_date'] ?? '',
                    patientDetails['ambulance_issue_registered'] ?? '',
                    patientDetails['ambulance_department'] ?? '',
                    patientDetails['ambulance_id'] ?? '',
                    patientDetails['ambulance_doctor'] ?? '',
                  ],
                ),
                additionalDetails(
                  visibility: sosVisible,
                  labels: [
                    'sos_department',
                    'sos_issue',
                    'sos_date',
                    'sos_contact',
                    'sos_relative_contact',
                  ],
                  details: [
                    patientDetails['sos_department'] ?? '',
                    patientDetails['sos_issue'] ?? '',
                    patientDetails['sos_date'] ?? '',
                    patientDetails['sos_contact'] ?? '',
                    patientDetails['sos_relative_contact'] ?? '',
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget additionalDetails({
    required bool visibility,
    required List<String> labels,
    required List<String> details,
  }) {
    return Visibility(
      visible: visibility,
      child: Container(
        constraints:
            BoxConstraints(minWidth: MediaQuery.sizeOf(context).width * .9),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            labels.length,
            (index) =>
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(top: index == 0 ? 0 : 10),
                  child: Row(
                    children: [
                      Text(labels[index]),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(top: index == 0 ? 0 : 10),
                  child: Row(
                    children: [
                      Text(" : ${details[index]}"),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildDropDownField({
    required List<DropdownMenuItem<int>>? items,
    required ValueChanged<int?>? onChanged,
    required int? selectedValue,
    required String hint,
  }) {
    return DropdownButtonFormField(
      decoration: InputDecoration(border: OutlineInputBorder()),
      hint: Text(hint),
      value: selectedValue,
      items: items,
      onChanged: onChanged,
    );
    // return Autocomplete(
    //   optionsBuilder: (textEditingValue) {
    //     return items!.where(
    //       (element) {
    //         return element.value
    //             .toString()
    //             .contains(textEditingValue.text.toLowerCase());
    //       },
    //     );
    //   },
    //   displayStringForOption: (option) {
    //     return option.value.toString();
    //   },
    // );
  }

  Widget buildTable(
      {required List<DataColumn> columns, required List<DataRow> rows}) {
    return Row(
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
              columns: columns,
              rows: rows,
            ),
          ),
        ),
      ],
    );
  }
}
