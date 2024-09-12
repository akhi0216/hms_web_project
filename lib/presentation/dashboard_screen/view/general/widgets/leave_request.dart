import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/image_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/contoller/auth_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/contoller/leave_req.dart';
import 'package:hms_web_project/presentation/login_page/controller/login_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LeaveRequest extends StatefulWidget {
  const LeaveRequest({super.key});

  @override
  State<LeaveRequest> createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {
  bool dropDownView = false;
  bool dateSelected = false;
  // bool isRejected = false;
  // bool isResolved = false;
  bool isLoading = false;
  String? selectedDept;
  String? selectedDate;
  @override
  Widget build(BuildContext context) {
//  List<ExpansionTileController> concernsExpansionController = List.generate(
//       selectedDept != null || selectedDate != null
//           ? viewConcernsProvider.departmentWiseConcernsList.length
//           : viewConcernsProvider.concernsModel.list?.length ?? 0,
//       (index) {
//         return ExpansionTileController();
//       },
//     );

    var varloginprovider = Provider.of<LoginController>(context);
    var deptpassingProvider = Provider.of<LeaveReqControllers>(context);
    var deptpassingfunctionProvider =
        Provider.of<LeaveReqControllers>(context, listen: false);

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
                            await deptpassingfunctionProvider.deptPassing(
                                dept: selectedDept!);
                          },
                        ),
                      ),
                      // -------------------------
                      SizedBox(
                        height: 20,
                      ),

                      ListView.builder(
                        itemCount: deptpassingProvider.leavereqList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            title: Text(
                                deptpassingProvider.leavereqList[index].name ??
                                    ''),
                            collapsedBackgroundColor: ColorConstants.mainBlue,
                            collapsedTextColor: ColorConstants.mainwhite,
                            childrenPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            expandedAlignment: Alignment.center,
                            children: [
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  return Container(
                                    width: constraints.maxWidth,
                                    child: DataTable(
                                        headingRowColor:
                                            WidgetStateColor.resolveWith(
                                                (states) =>
                                                    ColorConstants.mainBlue),
                                        headingTextStyle: TextStyle(
                                            color: ColorConstants.mainwhite,
                                            fontWeight: FontWeight.bold),
                                        columns: [
                                          DataColumn(label: Text('Name')),
                                          DataColumn(label: Text('Date')),
                                          DataColumn(label: Text('Dept')),
                                          DataColumn(label: Text('End date')),
                                          DataColumn(label: Text('Reason')),
                                          DataColumn(label: Text('Leave_ID')),
                                        ],
                                        rows: [
                                          DataRow(cells: [
                                            DataCell(Text(deptpassingProvider
                                                    .leavereqList[index].name ??
                                                '')),
                                            DataCell(Text(deptpassingProvider
                                                    .leavereqList[index].date ??
                                                '')),
                                            DataCell(Text(deptpassingProvider
                                                    .leavereqList[index].dep ??
                                                '')),
                                            DataCell(Text(deptpassingProvider
                                                    .leavereqList[index]
                                                    .enddate ??
                                                '')),
                                            DataCell(Text(deptpassingProvider
                                                    .leavereqList[index]
                                                    .reason ??
                                                '')),
                                            DataCell(Text(deptpassingProvider
                                                    .leavereqList[index]
                                                    .leaveid ??
                                                '')),
                                          ])
                                        ]),
                                  );
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      deptpassingfunctionProvider
                                          .deptAuthpassing(
                                              date: formattedDate,
                                              leaveid: deptpassingProvider
                                                      .leavereqList[index]
                                                      .leaveid ??
                                                  '',
                                              empid: varloginprovider.empId);
                                      dropDownView = false;
                                      // print(varloginprovider.empId);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: ColorConstants.lightBlue,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: ColorConstants.mainBlue,
                                              width: 2)),
                                      child: Text(
                                        "Authorise",
                                        style: TextStyle(
                                            color: ColorConstants.mainwhite),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // deptpassingfunctionProvider
                                      //     .deptunauthpassing(
                                      //         empcode: deptpassingProvider
                                      //                 .authList[index]
                                      //                 .empcode ??
                                      //             '',
                                      //         userid: deptpassingProvider
                                      //                 .authList[index].userId ??
                                      // -------------------------------------------------

                                      //             '');
                                      deptpassingfunctionProvider
                                          .deptUnauthpassing(
                                              date: formattedDate,
                                              leaveid: deptpassingProvider
                                                      .leavereqList[index]
                                                      .leaveid ??
                                                  '',
                                              empid: varloginprovider.empId);

                                      dropDownView = false;
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: ColorConstants.lightBlue,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: ColorConstants.mainBlue,
                                              width: 2)),
                                      child: Text(
                                        "Unauthorise",
                                        style: TextStyle(
                                            color: ColorConstants.mainwhite),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  // InkWell(
                                  //   onTap: () {
                                  //     dropDownView = false;
                                  //   },
                                  //   child: Container(
                                  //     padding: EdgeInsets.all(5),
                                  //     decoration: BoxDecoration(
                                  //         color: ColorConstants.lightBlue,
                                  //         borderRadius:
                                  //             BorderRadius.circular(5),
                                  //         border: Border.all(
                                  //             color: ColorConstants.mainBlue,
                                  //             width: 2)),
                                  //     child: Text(
                                  //       "Cancel",
                                  //       style: TextStyle(
                                  //           color: ColorConstants.mainwhite),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              )
                            ],
                          );
                        },
                      ),

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