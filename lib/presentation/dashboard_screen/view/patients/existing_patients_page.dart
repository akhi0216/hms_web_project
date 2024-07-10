import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:http/http.dart' as http;

class ExistingPatientsPage extends StatelessWidget {
  ExistingPatientsPage({super.key});
  TextEditingController searchController = TextEditingController();
  String ret = "";
  Future<String> searchPatient() async {
    String url = "https://cybot.avanzosolutions.in/hms/patientname.php";
    try {
      var res = await http.post(Uri.parse(url), body: {
        "patientnamecontroller": searchController.text.trim(),
      });
      print(res.body);
      ret = res.body;
    } on Exception catch (e) {
      print(e);
    }
    return ret;
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
              onFieldSubmitted: (value) {
                searchPatient();
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
                  onPressed: () {
                    searchPatient();
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
          Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [Text("Name : ")],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [Text("Email : ")],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [Text("ph no : ")],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [Text("Address : ")],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [Text("Doctor name : ")],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [Text("DEPT : ")],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [Text("Attachments : ")],
            ),
          ),
          SizedBox(
            height: 7,
          ),
        ],
      ),
    );
  }
}
