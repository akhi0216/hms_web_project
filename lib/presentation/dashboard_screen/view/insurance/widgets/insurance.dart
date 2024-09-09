import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:provider/provider.dart';

class Insurance extends StatefulWidget {
  const Insurance({super.key});

  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  String? selectedInsurance;

  bool isDropdownVisible = false;

  final List<String> insuranceTypes = [
    'Individual Health Insurance',
    'Family Floater Health Insurance',
    'Critical Illness Insurance',
    'Senior Citizen Health Insurance',
    'Group Health Insurance',
    'Maternity Health Insurance',
    'Personal Accident Insurance',
    'Top-Up Health Insurance',
    'Disease-Specific Health Insurance',
    'Preventive Healthcare Plans',
    'Unit Linked Health Plans (ULHP)',
    'Arogya Sanjeevani Policy',
    'Corona Kavach Policy',
    'Ayushman Bharat Yojana',
    'Mediclaim Insurance',
  ];
  TextEditingController patientidcontroller = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phnController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  callFuction() async {
    await Provider.of<BookingPatientController>(context, listen: false)
        .department();
  }

  @override
  void initState() {
    super.initState();
    callFuction();
  }

  @override
  Widget build(BuildContext context) {
    var functionprovider =
        Provider.of<BookingPatientController>(context, listen: false);
    var varprovider = Provider.of<BookingPatientController>(context);

    fieldSubmitted() async {
      varprovider.doctorList.clear();
      varprovider.deptList[0];
      varprovider.timeList.clear();
      varprovider.patientBookingModel.list?.clear();
      await functionprovider.patientdata(patientidcontroller.text.trim());
      if (varprovider.patientBookingModel.list == null ||
          varprovider.patientBookingModel.list!.isEmpty) {
        firstnameController.clear();
        lastnameController.clear();
        phnController.clear();
        mailController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No patient found'),
            backgroundColor: ColorConstants.mainRed,
          ),
        );
      } else {
        setState(() {});
        firstnameController.text =
            varprovider.patientBookingModel.list?[0].fname ?? "";
        lastnameController.text =
            varprovider.patientBookingModel.list?[0].lname ?? "";
        mailController.text =
            varprovider.patientBookingModel.list?[0].email ?? "";
        isDropdownVisible = true;

        // phoneNumber = varprovider.patientBookingModel.list?[0].phn ?? "";
        phnController.text = varprovider.patientBookingModel.list?[0].phn ?? "";
      }

      // print(departmentcontroller.text);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // color: Colors.amberAccent,
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/healthinusrance.png"),
                          fit: BoxFit.contain)),
                ),
                // Text(
                //   "Patient ID : ",
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: patientidcontroller,
                    decoration: InputDecoration(
                      hintText: 'Enter patient ID',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorConstants.majenta),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorConstants.majenta,
                          width: 2.0,
                        ),
                      ),
                    ),
                    onFieldSubmitted: (value) async {
                      await fieldSubmitted();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter a Valid Patient Id';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),

            SizedBox(
              width: 30,
            ),

            // VerticalDivider(
            //   thickness: 3,
            //   color: ColorConstants.lightOrange,
            // ),
            Container(
              height: 380,
              width: 2,
              color: ColorConstants.majenta,
            ),
            SizedBox(
              width: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Patient Details",
                  style: TextStyle(color: ColorConstants.majenta, fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "First Name : ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: firstnameController,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Last Name : ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: lastnameController,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Phn no : ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: phnController,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "E - mail : ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: mailController,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
              ],
            ),

            SizedBox(
              width: 50,
            ),
            Container(
              height: 380,
              width: 2,
              color: ColorConstants.majenta,
            ),

            SizedBox(
              width: 15,
            ),
            Visibility(
                visible: isDropdownVisible,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 110,
                      width: 110,
                      // color: ColorConstants.lightBlue,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: AssetImage("assets/images/hlt.jpg"),
                              fit: BoxFit.contain)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DropdownButton<String>(
                      hint: Text(
                        'Select Insurance Type',
                        style: TextStyle(color: ColorConstants.mainBlack),
                      ),
                      value: selectedInsurance,
                      items: insuranceTypes.map((String insurance) {
                        return DropdownMenuItem<String>(
                          value: insurance,
                          child: Text(insurance),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedInsurance = newValue;
                        });
                      },
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter UHID',
                          // border: OutlineInputBorder(
                          //   borderSide: BorderSide(color: ColorConstants.majenta),
                          // ),
                          // focusedBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: ColorConstants.majenta,
                          //     width: 2.0,
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Aadhar ID',
                          // border: OutlineInputBorder(
                          //   borderSide: BorderSide(color: ColorConstants.majenta),
                          // ),
                          // focusedBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: ColorConstants.majenta,
                          //     width: 2.0,
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: ' Registered phn no.',
                          // border: OutlineInputBorder(
                          //   borderSide: BorderSide(color: ColorConstants.majenta),
                          // ),
                          // focusedBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: ColorConstants.majenta,
                          //     width: 2.0,
                          //   ),
                          // ),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        )
      ],
    );
  }
}
