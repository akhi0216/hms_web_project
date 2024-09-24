import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/search_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/controller/user_pswdgenerating.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UserReg extends StatefulWidget {
  const UserReg({super.key});

  @override
  State<UserReg> createState() => _UserRegState();
}

class _UserRegState extends State<UserReg> {
  TextEditingController searchController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController pswdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController phnController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  String? selectedRole;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    var varProvider = Provider.of<TextSearchController>(context);
    var functionProvider =
        Provider.of<TextSearchController>(context, listen: false);
    var userpswdvarprovider =
        Provider.of<UserpswdgeneratingController>(context);
    var userpswdfunctionprovider =
        Provider.of<UserpswdgeneratingController>(context, listen: false);
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
                            nameController.text =
                                varProvider.doctorSearchModel.fname ?? "";
                            deptController.text =
                                varProvider.doctorSearchModel.department ?? "";
                            phnController.text =
                                varProvider.doctorSearchModel.mob ?? "";
                            mailController.text =
                                varProvider.doctorSearchModel.email ?? "";
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
                      buildTextField(
                        label: " Name",
                        controller: nameController,
                      ),
                      // "${varProvider.doctorSearchModel.fname ?? ""}"),
                      // buildTextField("Last Name", "Last Name"),
                      buildTextField(
                          label: "Department", controller: deptController),
                      // "${varProvider.doctorSearchModel.department ?? ""}"),
                      buildTextField(
                          label: "Phone No", controller: phnController),
                      // "${varProvider.doctorSearchModel.mob ?? ""}"),
                      buildTextField(
                          label: "E-mail", controller: mailController),
                      // "${varProvider.doctorSearchModel.email ?? ""}"),
                      // buildTextField("Username", "Username"),
                      // buildTextField("Password", "Password"),
                      Text("Username",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: usernameController,
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
                      SizedBox(
                        height: 10,
                      ),
                      Text("Password",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: pswdController,
                          onFieldSubmitted: (value) async {
                            // setState(() {});
                            // await functionProvider
                            //     .searchDoctor(searchController.text.trim());
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter password',
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
                      SizedBox(
                        height: 10,
                      ),
                      Text("Designation",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),

                      SizedBox(
                        width: 300,
                        child: DropdownButtonFormField<String>(
                          value: selectedRole,
                          hint: Text("Select des"),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                          ),
                          items: ["admin", "staff", "pharmacist"]
                              .map((role) => DropdownMenuItem<String>(
                                    value: role,
                                    child: Text(role),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedRole = value;
                            });
                          },
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
                // buildButton("Apply", Colors.greenAccent),
                // SizedBox(width: 20),
                // buildButton("Cancel", Colors.redAccent),

                InkWell(
                  onTap: () async {
                    await userpswdfunctionprovider.userpswdsaving(
                        empid: searchController.text,
                        username: usernameController.text,
                        password: pswdController.text,
                        // mob: varProvider.doctorSearchModel.mob ?? "",
                        mob: phnController.text,
                        des: selectedRole.toString(),
                        // name: varProvider.doctorSearchModel.fname ?? "");
                        name: nameController.text);

                    searchController.clear();
                    selectedRole = null;
                    usernameController.clear();
                    pswdController.clear();
                    phnController.clear();
                    nameController.clear();
                    deptController.clear();
                    mailController.clear();
                  },
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(color: Colors.greenAccent),
                    child: Text("Apply"),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(color: Colors.red),
                  child: Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      {required String label, required TextEditingController controller}) {
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
              controller: controller,
              decoration: InputDecoration(
                // hintText: title,
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
