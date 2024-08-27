import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dashboardscreen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/user_dashboard.dart';
import 'package:hms_web_project/repositories/api/model/user_details_model.dart';
import 'package:http/http.dart' as http;

class LoginController with ChangeNotifier {
  String isLoggined = "";
  String empId = "";
  String designation = "";
  String userName = "";
  UserDetailsModel userDetailsModel = UserDetailsModel();
  Map<String, dynamic> json = {};
  void login(
      {required String username,
      required String password,
      required BuildContext context}) async {
    try {
      var url = "https://cybot.avanzosolutions.in/hms/loginverify.php";
      var res = await http.post(Uri.parse(url), body: {
        "loginusernamecontroller": username,
        "loginpasswordcontroller": password,
      });
      isLoggined = res.body;
    } on Exception catch (e) {
      print(e);
    }

    print(isLoggined);
    if (isLoggined == "success") {
      try {
        var url = "https://cybot.avanzosolutions.in/hms/loginname.php";
        var res = await http.post(Uri.parse(url), body: {
          "loginusernamecontroller": username,
          "loginpasswordcontroller": password,
        });
        print(res.body);
        json = jsonDecode(res.body);
        userDetailsModel = UserDetailsModel.fromJson(json);
        userName = userDetailsModel.uname ?? "";
        designation = userDetailsModel.des ?? "";
        empId = userDetailsModel.eid ?? "";

        print(username);
        print(designation);
        print(empId);
      } on Exception catch (e) {
        print(e);
      }
      print(userDetailsModel.uname);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login Successful"),
          backgroundColor: ColorConstants.mainGreen,
          duration: Duration(milliseconds: 1500),
        ),
      );
      Future.delayed(
        Duration(milliseconds: 1500),
        () {
          if (userDetailsModel.des == "Admin") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Dashboardsecondscreen(
                  userName: userDetailsModel.uname ?? "",
                  empId: userDetailsModel.eid ?? "",
                  des: userDetailsModel.des ?? "",
                ),
              ),
            );
          } else if (userDetailsModel.des == "user") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => UserDashBoardScreen(
                  userName: userDetailsModel.uname ?? "",
                  empId: userDetailsModel.eid ?? "",
                  des: userDetailsModel.des ?? "",
                ),
              ),
            );
          }
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Enter valid username and password"),
          backgroundColor: ColorConstants.mainRed,
        ),
      );
    }
    notifyListeners();
  }
}
