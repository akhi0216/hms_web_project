import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:intl/intl.dart';

class Emergency extends StatefulWidget {
  const Emergency({super.key});

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  String? _selectedItem = 'OP';
  final List<String> _items = ['OP', 'Casuality', 'Room', 'Ward', 'Mortuary'];

  bool _isMale = false;
  bool _isFemale = false;
  bool _isOther = false;

  String? medLegalCase = 'No';

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    // Format the date
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: ColorConstants.mainBlue),
                  child: Center(
                    child: Text(
                      "Date : ${formattedDate} ",
                      style: TextStyle(color: ColorConstants.mainwhite),
                    ),
                  ),
                ),
                Row(
                  children: [
                    // Container(
                    //   width: 100,
                    //   padding: EdgeInsets.all(10),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.all(Radius.circular(7)),
                    //       color: ColorConstants.mainBlue),
                    //   child: Center(
                    //     child: Text(
                    //       "Add",
                    //       style: TextStyle(color: ColorConstants.mainwhite),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(width: 11),
                    Container(
                      width: 150,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          color: ColorConstants.mainBlue),
                      child: Center(
                        child: Text(
                          "View",
                          style: TextStyle(color: ColorConstants.mainwhite),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 7),
            Row(
              children: [
                Text(
                  "Name : ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ],
            ),
            SizedBox(height: 7),
            Row(
              children: [
                Text(
                  "Contact No : ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // hintText: 'Enter contact number',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 7),
            Row(
              children: [
                Text(
                  "Age : ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // hintText: 'Enter age',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 7),
            Row(
              children: [
                Text(
                  "Place : ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ],
            ),
            SizedBox(height: 7),
            Row(
              children: [
                Text(
                  "Situation : ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ],
            ),
            SizedBox(height: 7),
            Row(
              children: [
                Text(
                  "Consulted Doctor : ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ],
            ),
            SizedBox(height: 7),
            Row(
              children: [
                Text(
                  "Doctor notes : ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ],
            ),
            SizedBox(height: 7),
            Row(
              children: [
                Text(
                  "Risk type : ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ],
            ),
            SizedBox(height: 7),
            SizedBox(height: 7),
            Row(
              children: [
                Text(
                  "Shift Required : ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 250,
                  child: DropdownButtonFormField<String>(
                    value: _selectedItem,
                    icon: Icon(Icons.arrow_downward),
                    decoration: InputDecoration(
                      labelText: "Select Type",
                      border: OutlineInputBorder(),
                    ),
                    items: _items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Text("Medical Legal Case (Yes/No) : "),
            Row(
              children: [
                Text(
                  "Medical legal case   : ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Yes"),
                    value: 'Yes',
                    groupValue: medLegalCase,
                    onChanged: (String? value) {
                      setState(() {
                        medLegalCase = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("No"),
                    value: 'No',
                    groupValue: medLegalCase,
                    onChanged: (String? value) {
                      setState(() {
                        medLegalCase = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: ColorConstants.mainBlue,
                    borderRadius: BorderRadius.circular(7)),
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
