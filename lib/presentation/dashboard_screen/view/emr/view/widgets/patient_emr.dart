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
  TextEditingController pidController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final sexController = TextEditingController();
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

  String calculateAge(TextSearchController patientDataProvider) {
    DateTime dob = DateFormat('dd-MM-yyyy')
        .parse(patientDataProvider.patientSearchModel.list?[0].dob ?? "");
    DateTime today = DateTime.now();

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
          onChanged: (value) async {
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
              });
            } else {
              setState(() {
                nameController.clear();
                ageController.clear();
                sexController.clear();
              });
            }
          },
          cancelButton: () {
            setState(() {
              pidController.clear();
              nameController.clear();
              ageController.clear();
              sexController.clear();

              ipIdVisible = false;
              opIdVisible = false;
              daycareIdVisible = false;
              ipVisible = false;
              opVisible = false;
              daycareVisible = false;
            });
          },
        ),
        SizedBox(height: size.height * .01),
        buildTextField(controller: nameController, label: "Patient name"),
        SizedBox(height: size.height * .01),
        buildTextField(controller: ageController, label: "Age"),
        SizedBox(height: size.height * .01),
        buildTextField(controller: sexController, label: "Gender"),
        SizedBox(height: size.height * .01),
        Visibility(
          visible: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton(text: "IP DETAILS"),
              buildButton(text: "OP DETAILS"),
              buildButton(text: "DAYCARE DETAILS"),
            ],
          ),
        ),
        SizedBox(height: size.height * .01),
        Visibility(
          visible: ipIdVisible,
          child: buildActionTextField(
            label: "Enter IP id",
            controller: ipIdController,
            onChanged: (value) {
              setState(() {
                ipVisible = true;
              });
            },
            cancelButton: () {
              setState(() {
                ipIdVisible = false;
                opIdVisible = false;
                daycareIdVisible = false;
                ipVisible = false;
                opVisible = false;
                daycareVisible = false;
                ipIdController.clear();
              });
            },
          ),
        ),
        Visibility(
          visible: opIdVisible,
          child: buildActionTextField(
            label: "Enter OP id",
            controller: opIdController,
            onChanged: (value) {},
            cancelButton: () {
              setState(() {
                ipIdVisible = false;
                opIdVisible = false;
                daycareIdVisible = false;
                ipVisible = false;
                opVisible = false;
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
            onChanged: (value) {},
            cancelButton: () {
              setState(() {
                ipIdVisible = false;
                opIdVisible = false;
                daycareIdVisible = false;
                ipVisible = false;
                opVisible = false;
                daycareVisible = false;
              });
            },
          ),
        ),
        SizedBox(height: size.height * .01),
        Visibility(
          visible: ipVisible,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("IP No :"),
                    Text("IP No :"),
                    Text("IP No :"),
                    Text("IP No :"),
                    Text("IP No :"),
                    Text("IP No :"),
                    Text("IP No :"),
                    Text("IP No :"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("IP No :"),
                    Text("IP No :"),
                    Text("IP No :"),
                    Text("IP No :"),
                    Text("IP No :"),
                    Text("IP No :"),
                    Text("IP No :"),
                    Text("IP No :"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildActionTextField({
    required String label,
    required TextEditingController controller,
    required ValueChanged<String>? onChanged,
    required GestureTapCallback? cancelButton,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(5),
        label: Text(label),
        suffixIcon: IconButton(
          onPressed: () => onChanged,
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
      onFieldSubmitted: onChanged,
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

  Widget buildButton({required String text}) {
    return InkWell(
      onTap: () {
        // buttonVisible = false;
        setState(() {
          if (text == 'IP DETAILS') {
            ipIdVisible = true;
            opIdVisible = false;
            daycareIdVisible = false;
          } else if (text == 'OP DETAILS') {
            opIdVisible = true;
            ipIdVisible = false;
            daycareIdVisible = false;
          } else if (text == 'DAYCARE DETAILS') {
            daycareIdVisible = true;
            opIdVisible = false;
            ipIdVisible = false;
          }
        });
      },
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
}
