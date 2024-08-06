import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/model/doctor_search.dart';
import 'package:http/http.dart' as http;

class DoctorSearchScreen extends StatefulWidget {
  const DoctorSearchScreen({super.key});

  @override
  State<DoctorSearchScreen> createState() => _DoctorSearchScreenState();
}

class _DoctorSearchScreenState extends State<DoctorSearchScreen> {
  DoctorSearchModel doctorSearchModel = DoctorSearchModel();

  TextEditingController searchController = TextEditingController();
  Map<String, dynamic> ret = {};

  searchDoctor() async {
    ret.clear();
    String url = "https://cybot.avanzosolutions.in/hms/doctorsearch.php";
    try {
      var res = await http.post(Uri.parse(url), body: {
        "patientnamecontroller": searchController.text.trim(),
      });
      print(res.body);
      setState(() {
        ret = jsonDecode(res.body);
      });
      print(ret);
      doctorSearchModel = DoctorSearchModel.fromJson(ret);
    } on Exception catch (e) {
      print(e);
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                    await searchDoctor();
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
                        await searchDoctor();
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
              detailsContainer(
                  label: "Doctor name : ",
                  title: doctorSearchModel.fname ?? ""),
              detailsContainer(
                  label: "Employee id : ", title: doctorSearchModel.eid ?? ""),
              detailsContainer(
                  label: "Medical licence number : ",
                  title: doctorSearchModel.medlic ?? ""),
              detailsContainer(
                  label: "Address : ", title: doctorSearchModel.addr ?? ""),
              detailsContainer(
                  label: "Mobile : ", title: doctorSearchModel.mob ?? ""),
              detailsContainer(
                  label: "Year of graduation : ",
                  title: doctorSearchModel.yrofgrad ?? ""),
              detailsContainer(
                  label: "Current position : ",
                  title: doctorSearchModel.curpos ?? ""),
              detailsContainer(
                  label: "Available starting time : ",
                  title: doctorSearchModel.availabilitystart ?? ""),
              detailsContainer(
                  label: "Available ending time : ",
                  title: doctorSearchModel.availabilityend ?? ""),
              detailsContainer(
                  label: "Date of birth : ",
                  title: doctorSearchModel.dob.toString()),
              detailsContainer(
                  label: "School : ", title: doctorSearchModel.school ?? ""),
              detailsContainer(
                  label: "Department : ",
                  title: doctorSearchModel.department ?? ""),
              detailsContainer(
                  label: "Email : ", title: doctorSearchModel.email ?? ""),
            ],
          ),
        ),
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
