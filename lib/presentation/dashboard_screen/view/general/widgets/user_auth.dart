import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/image_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/contoller/auth_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UserAuth extends StatefulWidget {
  const UserAuth({super.key});

  @override
  State<UserAuth> createState() => _UserAuthState();
}

class _UserAuthState extends State<UserAuth> {
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

    var deptpassingProvider = Provider.of<AuthController>(context);
    var deptpassingfunctionProvider =
        Provider.of<AuthController>(context, listen: false);

    var departmentProvider = Provider.of<BookingPatientController>(context);
    var departmentfunctionProvider =
        Provider.of<BookingPatientController>(context, listen: false);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  border: Border.all(color: ColorConstants.mainBlue, width: 2)),
              child: Row(
                children: [Text("Date"), Text(formattedDate)],
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
                      // LayoutBuilder(builder: (context, constraints) {
                      //   return InkWell(
                      //     onTap: () {
                      //       setState(() {
                      //         dropDownView = false;
                      //         selectedDept = null;
                      //         selectedDate = null;
                      //         dateSelected = !dateSelected;
                      //       });
                      //       // _selectDate(context, viewConcernsFunctionProvider,
                      //       //     viewConcernsProvider);
                      //     },
                      //     child: Container(
                      //       padding: EdgeInsets.all(10),
                      //       width: constraints.maxWidth * .8,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10),
                      //         color: ColorConstants.mainBlue,
                      //       ),
                      //       child: Text(
                      //         "Date",
                      //         style: MyTextStyle.normalWhiteText,
                      //       ),
                      //     ),
                      //   );
                      // }),
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
                        itemCount: deptpassingProvider.authList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            title: Text(
                                deptpassingProvider.authList[index].fname ??
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
                                          DataColumn(label: Text('Empid')),
                                          DataColumn(label: Text('Name')),
                                          DataColumn(label: Text('Date')),
                                          DataColumn(label: Text('Des')),
                                          DataColumn(label: Text('mob')),
                                          DataColumn(label: Text('user_id')),
                                          DataColumn(label: Text('dept')),
                                          DataColumn(label: Text('to whom')),
                                        ],
                                        rows: [
                                          DataRow(cells: [
                                            DataCell(Text(deptpassingProvider
                                                    .authList[index].empcode ??
                                                '')),
                                            DataCell(Text(deptpassingProvider
                                                    .authList[index].fname ??
                                                '')),
                                            DataCell(Text(deptpassingProvider
                                                    .authList[index].date ??
                                                '')),
                                            DataCell(Text(deptpassingProvider
                                                    .authList[index].des ??
                                                '')),
                                            DataCell(Text(deptpassingProvider
                                                    .authList[index].mob ??
                                                '')),
                                            DataCell(Text(deptpassingProvider
                                                    .authList[index].userId ??
                                                '')),
                                            DataCell(Text(deptpassingProvider
                                                    .authList[index].dep ??
                                                '')),
                                            DataCell(Text(deptpassingProvider
                                                    .authList[index].towhom ??
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
                                          .deptempuseridpassing(
                                              empcode: deptpassingProvider
                                                      .authList[index]
                                                      .empcode ??
                                                  '',
                                              userid: deptpassingProvider
                                                      .authList[index].userId ??
                                                  '');
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
                                      deptpassingfunctionProvider
                                          .deptunauthpassing(
                                              empcode: deptpassingProvider
                                                      .authList[index]
                                                      .empcode ??
                                                  '',
                                              userid: deptpassingProvider
                                                      .authList[index].userId ??
                                                  '');
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
                                  InkWell(
                                    onTap: () {
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
                                        "Cancel",
                                        style: TextStyle(
                                            color: ColorConstants.mainwhite),
                                      ),
                                    ),
                                  ),
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