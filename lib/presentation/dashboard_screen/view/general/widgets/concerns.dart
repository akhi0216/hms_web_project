import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/concerns_controller.dart';
import 'package:hms_web_project/presentation/login_page/controller/login_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ConcernsScreen extends StatefulWidget {
  const ConcernsScreen({super.key});

  @override
  State<ConcernsScreen> createState() => _ConcernsScreenState();
}

class _ConcernsScreenState extends State<ConcernsScreen> {
  final datecontroller = TextEditingController();
  final empcodecontroller = TextEditingController();
  final complaintcontroller = TextEditingController();

  String? _selectedDesignation;


 

  @override
  void dispose() {
    datecontroller.dispose();
    empcodecontroller.dispose();
    complaintcontroller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        datecontroller.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  fetchData() async {
    await Provider.of<ConcernsController>(context, listen: false)
        .designations();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var functionprovider =
        Provider.of<ConcernsController>(context, listen: false);
    var varprovider = Provider.of<ConcernsController>(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //   width: size.width * .2,
        //   height: size.height,
        //   clipBehavior: Clip.antiAlias,
        //   decoration: BoxDecoration(
        //     color: ColorConstants.mainBlue,
        //     borderRadius: BorderRadius.only(
        //         topRight: Radius.circular(10),
        //         bottomRight: Radius.circular(10)),
        //   ),
        //   child: Column(
        //     children: [
        //       Container(
        //         width: size.width * .199,
        //         color: ColorConstants.mainwhite,
        //         child: Image.asset(
        //           "assets/images/highlandlogo-removebg-preview.png",
        //         ),
        //       ),
        //       SizedBox(height: size.height * .01),
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           SizedBox(height: size.height * .05),
        //           // buttonCall(label: "Billing", newScreen: StoreBilling()),
        //           // buttonCall(label: "New Store", newScreen: NewStore()),
        //           // buttonCall(label: "Open Stock", newScreen: OpenStock()),
        //           // buttonCall(label: "New Stock", newScreen: NewStock()),
        //           // buttonCall(label: "Current Stock", newScreen: CurrentStock()),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),

        // -------------------
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: ColorConstants.mainBlue),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Staff Concerns/Requirement Form",
                                style: MyTextStyle.highlandheading,
                              ),
                              SizedBox(height: 16),
                              Text("Employee Code:",
                                  style: MyTextStyle.normalText),
                              Container(
                                width: 200, // Set a specific width
                                child: TextFormField(
                                  controller: empcodecontroller,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      filled: true,
                                      fillColor: ColorConstants.mainwhite),
                                ),
                              ),
                              SizedBox(height: 16),
                              Text("To:", style: MyTextStyle.normalText),

                              Container(
                                constraints: BoxConstraints(maxWidth: 400),
                                child: DropdownButtonFormField(
                                  value: _selectedDesignation,
                                  hint: Text('Designations'),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20),
                                      filled: true,
                                      fillColor: ColorConstants.mainwhite,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      )),
                                  items: varprovider.designationList.map(
                                    (value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                  onTap: () {
                                    print(varprovider.designationList);
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedDesignation = value;
                                    });
                                  },
                                ),
                              ),

                              // -----------------
                              SizedBox(height: 16),
                              Text("Date:", style: MyTextStyle.normalText),
                              TextFormField(
                                controller: datecontroller,
                                readOnly: true,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    suffixIcon: Icon(Icons.calendar_today),
                                    filled: true,
                                    fillColor: ColorConstants.mainwhite),
                                onTap: () => _selectDate(context),
                              ),
                              SizedBox(height: 16),
                              Text("Complaint/Requirement:",
                                  style: MyTextStyle.normalText),
                              TextFormField(
                                controller: complaintcontroller,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              SizedBox(height: 24),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // -------------------------------
                                    await functionprovider
                                        .complaintRegistration(
                                            empcode: empcodecontroller.text,
                                            date: datecontroller.text,
                                            towhom: _selectedDesignation!,
                                            complaints:
                                                complaintcontroller.text);
                                    // clear all the textfields
                                    empcodecontroller.clear();
                                    datecontroller.clear();
                                    complaintcontroller.clear();
                                    _selectedDesignation = null;
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorConstants.mainBlue,
                                  ),
                                  child: Text(
                                    'Submit',
                                    style: MyTextStyle.appbartext,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: Image.network(
                            'https://images.pexels.com/photos/6098052/pexels-photo-6098052.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
