import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/image_constants.dart';
import 'package:intl/intl.dart';

class UserAuth extends StatefulWidget {
  const UserAuth({super.key});

  @override
  State<UserAuth> createState() => _UserAuthState();
}

class _UserAuthState extends State<UserAuth> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Container(
              //   height: 100,
              //   width: 150,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15),
              //       border:
              //           Border.all(color: ColorConstants.mainBlue, width: 2),
              //       image: DecorationImage(
              //           image:
              //               AssetImage(ImageConstants.highlandlogonobackground),
              //           fit: BoxFit.fill)),
              // ),
              Container(
                // padding: EdgeInsets.all(7),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(15),
                //   border: Border.all(color: ColorConstants.mainBlue, width: 2),
                // ),
                child: Row(
                  children: [
                    Text(
                      "Date : ",
                      style: TextStyle(
                          color: ColorConstants.mainBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(
                        color: ColorConstants.mainBlack,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text("Emp ID : "),
              SizedBox(width: 300, child: TextFormField())
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Text("Name  : "),
              SizedBox(width: 300, child: TextFormField())
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Text("Phn no : "),
              SizedBox(width: 300, child: TextFormField())
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Text("Email  : "),
              SizedBox(width: 300, child: TextFormField())
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Text("Date Of Registration : "),
              SizedBox(width: 220, child: TextFormField())
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Text("Created by : "),
              SizedBox(width: 280, child: TextFormField())
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.mainBlue,
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  textStyle: TextStyle(fontSize: 16),
                ),
                onPressed: () {},
                child: Text(
                  'Authorise',
                  style: TextStyle(color: ColorConstants.mainwhite),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.mainBlue,
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  textStyle: TextStyle(fontSize: 16),
                ),
                onPressed: () {},
                child: Text(
                  'Unauthorise',
                  style: TextStyle(color: ColorConstants.mainwhite),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.mainBlue,
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  textStyle: TextStyle(fontSize: 16),
                ),
                onPressed: () {},
                child: Text(
                  'Cancel',
                  style: TextStyle(color: ColorConstants.mainwhite),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
// 