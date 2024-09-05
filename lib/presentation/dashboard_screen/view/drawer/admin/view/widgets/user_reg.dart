import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:intl/intl.dart';

class UserReg extends StatefulWidget {
  const UserReg({super.key});

  @override
  State<UserReg> createState() => _UserRegState();
}

class _UserRegState extends State<UserReg> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: ColorConstants.mainBlue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Date:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(formattedDate, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextField("Employee ID", "Emp ID"),
                      buildTextField("First Name", "First Name"),
                      buildTextField("Last Name", "Last Name"),
                      buildTextField("Department", "Department"),
                      buildTextField("Phone No", "Phone No"),
                      buildTextField("E-mail", "Email"),
                      buildTextField("Username", "Username"),
                      buildTextField("Password", "Password"),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.pexels.com/photos/1081685/pexels-photo-1081685.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton("Apply", Colors.greenAccent),
                SizedBox(width: 20),
                buildButton("Cancel", Colors.redAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hintText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Container(
            constraints: const BoxConstraints(maxWidth: 300),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: ColorConstants.mainBlue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: ColorConstants.mainBlue,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: ColorConstants.mainBlue,
                    width: 1.5,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      child: Text(text, style: TextStyle(color: ColorConstants.mainwhite)),
    );
  }
}
