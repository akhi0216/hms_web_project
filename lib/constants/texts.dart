import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';

class MyTextStyle {
  static TextStyle appbartext = TextStyle(
    color: ColorConstants.mainwhite,
  );

  static TextStyle appbartitle =
      TextStyle(color: ColorConstants.mainwhite, fontWeight: FontWeight.bold);

  static TextStyle highlandheading = TextStyle(
      color: ColorConstants.mainBlue,
      fontWeight: FontWeight.bold,
      fontSize: 20);
  static TextStyle highlandaddress =
      TextStyle(color: ColorConstants.mainBlue, fontSize: 15);

  static TextStyle normalText = TextStyle(color: Colors.black, fontSize: 15);
}
