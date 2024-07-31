import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/repositories/api/model/patient_search_model.dart';
import 'package:http/http.dart' as http;

class ExistingPatientsPage extends StatefulWidget {
  ExistingPatientsPage({super.key});

  @override
  State<ExistingPatientsPage> createState() => _ExistingPatientsPageState();
}

class _ExistingPatientsPageState extends State<ExistingPatientsPage> {
  TextEditingController searchController = TextEditingController();

  Map<String, dynamic> ret = {};
  PatientSearchModel patientSearchModel = PatientSearchModel();

  searchPatient() async {
    ret.clear();
    String url = "https://cybot.avanzosolutions.in/hms/patientname.php";
    try {
      var res = await http.post(Uri.parse(url), body: {
        "patientnamecontroller": searchController.text.trim(),
      });
      setState(() {
        ret = jsonDecode(res.body);
      });
      print(ret);
      // patientSearchModel = PatientSearchModel.fromJson(ret);
    } on Exception catch (e) {
      print(e);
    }
    return ret;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: TextFormField(
              controller: searchController,
              onFieldSubmitted: (value) async {
                setState(() {});
                await searchPatient();
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: ColorConstants.mainBlue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: ColorConstants.mainBlue, width: 2),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    setState(() {});
                    await searchPatient();
                  },
                  icon: Icon(Icons.search),
                  color: ColorConstants.mainBlue,
                ),
                hintText: "Search patient by name/id/username",
                hintStyle: TextStyle(color: Colors.grey[400]),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
            ),
          ),
          SizedBox(
            height: 44,
          ),
          // detailsContainer(
          //     label: "Patient name : ",
          //     title: patientSearchModel.list?[0].fname ?? ""),
          // Container(
          //   height: 60,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(5))),
          //   child: Row(
          //     children: [
          //       Text("Last name : "),
          //       Text(patientSearchModel.list?[0].lname ?? "")
          //     ],
          //   ),
          // ),
          // detailsContainer(
          //     label: "Your id : ",
          //     title: patientSearchModel.list?[0].pid ?? ""),
          // detailsContainer(
          //     label: "date of birth",
          //     title: patientSearchModel.list?[0].lname ?? ""),
          // Container(
          //   height: 60,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(5))),
          //   child: Row(
          //     children: [Text("Email : ")],
          //   ),
          // ),
          // Container(
          //   height: 60,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(5))),
          //   child: Row(
          //     children: [Text("ph no : ")],
          //   ),
          // ),
          // Container(
          //   height: 60,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(5))),
          //   child: Row(
          //     children: [Text("Address : ")],
          //   ),
          // ),
          // Container(
          //   height: 60,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(5))),
          //   child: Row(
          //     children: [
          //       Text("Doctor name : "),
          //       Text(patientSearchModel.list?[0].doc ?? "")
          //     ],
          //   ),
          // ),
          // Container(
          //   height: 60,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(5))),
          //   child: Row(
          //     children: [
          //       Text("Prescription : "),
          //       Text(patientSearchModel.list?[0].presc ?? "")
          //     ],
          //   ),
          // ),
          // Container(
          //   height: 60,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(5))),
          //   child: Row(
          //     children: [Text("DEPT : ")],
          //   ),
          // ),
          // Container(
          //   height: 60,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.all(Radius.circular(5))),
          //   child: Row(
          //     children: [Text("Attachments : ")],
          //   ),
          // ),
        ],
      ),
    );
  }
}

Widget detailsContainer({required String label, required String title}) {
  return Container(
    height: 60,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
    child: Row(
      children: [Text(label), Text(title)],
    ),
  );
}
