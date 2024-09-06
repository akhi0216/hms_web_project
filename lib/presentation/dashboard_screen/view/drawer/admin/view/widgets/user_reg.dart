import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/search_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UserReg extends StatefulWidget {
  const UserReg({super.key});

  @override
  State<UserReg> createState() => _UserRegState();
}

class _UserRegState extends State<UserReg> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    var varProvider = Provider.of<TextSearchController>(context);
    var functionProvider =
        Provider.of<TextSearchController>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                border: Border.all(color: ColorConstants.mainBlue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container(
                  //   height: 200,
                  //   width: 200,
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           image: AssetImage(
                  //               "assets/images/highlandlogo-removebg-preview.png"))),
                  // ),

                  Text(
                    "Staff Registration",
                    style: TextStyle(
                        color: ColorConstants.mainBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        // border:
                        //     Border.all(color: ColorConstants.mainBlue, width: 2),
                        // borderRadius: BorderRadius.circular(10),
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
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: searchController,
                          onFieldSubmitted: (value) async {
                            setState(() {});
                            await functionProvider
                                .searchDoctor(searchController.text.trim());
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter emp id',
                            helperStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.mainBlack),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                setState(() {});
                                await functionProvider
                                    .searchDoctor(searchController.text.trim());
                              },
                              icon: Icon(Icons.search),
                              color: ColorConstants.mainBlue,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      // buildTextField("Employee ID", "${varProvider.doctorSearchModel.fname ?? ""}"),
                      buildTextField(" Name",
                          "${varProvider.doctorSearchModel.fname ?? ""}"),
                      // buildTextField("Last Name", "Last Name"),
                      buildTextField("Department",
                          "${varProvider.doctorSearchModel.department ?? ""}"),
                      buildTextField("Phone No",
                          "${varProvider.doctorSearchModel.mob ?? ""}"),
                      buildTextField("E-mail",
                          "${varProvider.doctorSearchModel.email ?? ""}"),
                      // buildTextField("Username", "Username"),
                      // buildTextField("Password", "Password"),
                      Text("Username",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: searchController,
                          onFieldSubmitted: (value) async {
                            // setState(() {});
                            // await functionProvider
                            //     .searchDoctor(searchController.text.trim());
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter username',
                            helperStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.mainBlack),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                          ),
                        ),
                      ),
                      Text("Password",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: searchController,
                          onFieldSubmitted: (value) async {
                            // setState(() {});
                            // await functionProvider
                            //     .searchDoctor(searchController.text.trim());
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter username',
                            helperStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.mainBlack),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                // Expanded(
                //   child: Container(
                //     height: 300,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(15.0),
                //       image: DecorationImage(
                //         fit: BoxFit.cover,
                //         image: AssetImage(
                //           "assets/images/highlandlogo-removebg-preview.png",
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(
                  // flex: 2,
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 194, 214, 230)
                              .withOpacity(0.2),
                          // spreadRadius: 2,
                          // blurRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/highlandlogo-removebg-preview.png",
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

// Widget detailsContainer({required String label, required String title}) {
//   return Container(
//     height: 60,
//     decoration:
//         BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
//     child: Row(
//       children: [Text(label), Text(title)],
//     ),
//   );
// }
  Widget buildTextField(String label, String title) {
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
                hintText: title,
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(10.0),
                //   borderSide: BorderSide(color: ColorConstants.mainBlue),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(10.0),
                //   borderSide: BorderSide(
                //     color: ColorConstants.mainBlue,
                //     width: 2.0,
                //   ),
                // ),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(10.0),
                //   borderSide: BorderSide(
                //     color: ColorConstants.mainBlue,
                //     width: 1.5,
                //   ),
                // ),
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
