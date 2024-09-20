import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_web_project/repositories/api/services/app_utils.dart';
import 'package:http/http.dart' as http;

class NewDoctorController with ChangeNotifier {
  List<String> deptList = [];

  department() async {
    String uri = "${AppUtils.baseURL}/departments.php";
    try {
      var res = await http.get(Uri.parse(uri));
      deptList = List<String>.from(await jsonDecode(res.body));
      print(deptList);
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  // newDoctorRegistration({
  //   required String title,
  //   required String firstName,
  //   required String lastName,
  //   required String dob,
  //   required String gender,
  //   required String nationality,
  //   required String mobile,
  //   required String email,
  //   required String resAddress,
  //   required String medLicNumber,
  //   required String department,
  //   required String medSchool,
  //   required String gradYear,
  //   required String resInfo,
  //   required String board,
  //   required String currentPos,
  //   required String currentEmp,
  //   required String previousPos,
  //   required String yearOfExp,
  //   required String startTime,
  //   required String endTime,
  //   required String onCall,
  // }) async {
  //   String uri = "${AppUtils.baseURL}/newdoctorbooking.php";
  //   var res = await http.post(
  //     Uri.parse(uri),
  //     //  body: {
  //     //   'titlecontroller': title,
  //     //   'FirstNamecontroller': firstName,
  //     //   'LastNamecontroller': lastName,
  //     //   'dobcontroller': dob,
  //     //   'gendercontroller': gender,
  //     //   'nationalitycontroller': nationality,
  //     //   'empcodecontroller': 100,
  //     //   'mobilecontroller': mobile,
  //     //   'emailcontroller': email,
  //     //   'resaddresscontroller': resAddress,
  //     //   'medlicnumbercontroller': medLicNumber,
  //     //   'departmentcontroller': department,
  //     //   'medschoolcontroller': medSchool,
  //     //   'gradyearcontroller': gradYear,
  //     //   'resinfocontroller': resInfo,
  //     //   'boardcontroller': board,
  //     //   'currentposcontroller': currentPos,
  //     //   'currentempcontroller': currentEmp,
  //     //   'previousposcontroller': previousPos,
  //     //   'yearofexpcontroller': yearOfExp,
  //     //   'starttimecontroller': startTime,
  //     //   'endtimecontroller': endTime,
  //     //   'oncallcontroller': onCall,
  //     // }
  //   );
  //   print(res.body);
  //   notifyListeners();
  // }

//

  newDocReg({
    required String title,
    required String firstName,
    required String lastName,
    required String dob,
    required String gender,
    required String nationality,
    required String mobile,
    required String email,
    required String resAddress,
    required String medLicNumber,
    required String department,
    required String medSchool,
    required String gradYear,
    required String resInfo,
    required String board,
    required String currentPos,
    required String currentEmp,
    required String previousPos,
    required String yearOfExp,
    required String startTime,
    required String endTime,
    required String onCall,
  }) async {
    String uri = "${AppUtils.baseURL}/newdoctorbooking.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        'titlecontroller': title,
        'FirstNamecontroller': firstName,
        'LastNamecontroller': lastName,
        'dobcontroller': dob,
        'gendercontroller': gender,
        'nationalitycontroller': nationality,
        'mobilecontroller': mobile,
        'emailcontroller': email,
        'resaddresscontroller': resAddress,
        'medlicnumbercontroller': medLicNumber,
        'departmentcontroller': department,
        'medschoolcontroller': medSchool,
        'gradyearcontroller': gradYear,
        'resinfocontroller': resInfo,
        'boardcontroller': board,
        'currentposcontroller': currentPos,
        'currentempcontroller': currentEmp,
        'previousposcontroller': previousPos,
        'yearofexpcontroller': yearOfExp,
        'starttimecontroller': startTime,
        'endtimecontroller': endTime,
        'oncallcontroller': onCall,

        





      });
      print(res.body);
    } catch (e) {
      log(e.toString());
    }
  }

  notifyListeners();
}
