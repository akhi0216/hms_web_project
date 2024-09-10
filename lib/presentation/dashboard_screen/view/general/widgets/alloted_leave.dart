import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/image_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/contoller/auth_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AllottedLeave extends StatefulWidget {
  const AllottedLeave({super.key});

  @override
  State<AllottedLeave> createState() => _AllottedLeaveState();
}

class _AllottedLeaveState extends State<AllottedLeave> {
  bool dropDownView = false;
  bool dateSelected = false;
  // bool isRejected = false;
  // bool isResolved = false;
  bool isLoading = false;
  String? selectedDept;
  String? selectedDate;
  @override
  Widget build(BuildContext context) {
    // var deptpassingProvider = Provider.of<AuthController>(context);
    // var deptpassingfunctionProvider =
    //     Provider.of<AuthController>(context, listen: false);

    var departmentProvider = Provider.of<BookingPatientController>(context);
    var departmentfunctionProvider =
        Provider.of<BookingPatientController>(context, listen: false);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 160,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  border: Border.all(color: ColorConstants.mainBlue, width: 2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Date : "), Text(formattedDate)],
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Search By"),
                      LayoutBuilder(builder: (context, constraints) {
                        return InkWell(
                          onTap: () async {
                            setState(() {
                              dropDownView = !dropDownView;
                              selectedDept = null;
                              // selectedDate = null;
                              // dateSelected = false;
                            });
                            await departmentfunctionProvider.department();
                          },
                          child: Container(
                            width: constraints.maxWidth * .8,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstants.mainBlue,
                            ),
                            child: Text(
                              "Department",
                              style: MyTextStyle.normalWhiteText,
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 10),
                      LayoutBuilder(builder: (context, constraints) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              dropDownView = false;
                              selectedDept = null;
                              selectedDate = null;
                              dateSelected = !dateSelected;
                            });
                            // _selectDate(context, viewConcernsFunctionProvider,
                            //     viewConcernsProvider);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: constraints.maxWidth * .8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstants.mainBlue,
                            ),
                            child: Text(
                              "Date ",
                              style: MyTextStyle.normalWhiteText,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Visibility(
                        visible: dropDownView,
                        child: DropdownButtonFormField(
                          hint: Text("Select department"),
                          value: selectedDept,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          items: departmentProvider.deptList
                              .map((element) => DropdownMenuItem<String>(
                                    child: Text(element),
                                    value: element,
                                  ))
                              .toList(),
                          onChanged: (value) async {
                            setState(() {
                              selectedDept = value;
                            });
                            // await deptpassingfunctionProvider.deptPassing(
                            //     dept: selectedDept!);
                          },
                        ),
                      ),
                      // -------------------------
                      SizedBox(
                        height: 20,
                      ),

                      ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            title: Text("aanju"),
                            collapsedBackgroundColor: ColorConstants.mainBlue,
                            collapsedTextColor: ColorConstants.mainwhite,
                            childrenPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            expandedAlignment: Alignment.center,
                          );
                        },
                      )

                      // --------------------------
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
// 