import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/controller/view_concerns_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ViewConcerns extends StatefulWidget {
  const ViewConcerns(
      {super.key, required this.designation, required this.empId});
  final String designation;
  final String empId;
  @override
  State<ViewConcerns> createState() => _ViewConcernsState();
}

class _ViewConcernsState extends State<ViewConcerns> {
  bool dropDownView = false;
  bool dateSelected = false;
  String? selectedDept;
  String? selectedDate;
  DateTime? datetime;

  Future<void> _selectDate(
      BuildContext context,
      ViewConcernsController concernsProvider,
      ViewConcernsController varProvider) async {
    datetime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (datetime != null) {
      setState(() {
        // datecontroller.text = "${selectedDate.toLocal()}".split(' ')[0];
        dateSelected = true;
        // varProvider.departmentWiseConcernsList.clear();
        concernsProvider.dateWiseConcerns(
            // date: "${selectedDate?.toLocal()}".split(' ')[0]);
            date:
                "${DateFormat('yyyy-MM-dd HH:mm:ss').format(datetime!.toLocal())}");
        selectedDate =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(datetime!.toLocal());
      });
    }
  }

  fetchData() async {
    await Provider.of<ViewConcernsController>(context, listen: false)
        .concernsListFunction(
      des: widget.designation,
      empcode: widget.empId,
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var departmentfunctionProvider =
        Provider.of<BookingPatientController>(context, listen: false);
    var departmentProvider = Provider.of<BookingPatientController>(context);
    var viewConcernsProvider = Provider.of<ViewConcernsController>(context);
    var viewConcernsFunctionProvider =
        Provider.of<ViewConcernsController>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorConstants.mainwhite,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(-1, 2),
                ),
              ]),
          padding: EdgeInsets.all(10),
          child: Text(DateFormat('dd-MM-yyyy').format(DateTime.now())),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Search By"),
                  LayoutBuilder(builder: (context, constraints) {
                    return InkWell(
                      onTap: () async {
                        setState(() {
                          dropDownView = !dropDownView;
                          selectedDept = null;
                          selectedDate = null;
                          dateSelected = false;
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
                        _selectDate(context, viewConcernsFunctionProvider,
                            viewConcernsProvider);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: constraints.maxWidth * .8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorConstants.mainBlue,
                        ),
                        child: Text(
                          "Date",
                          style: MyTextStyle.normalWhiteText,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Expanded(
              flex: 7,
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
                        await viewConcernsFunctionProvider
                            .departmentWiseConcerns(dept: selectedDept!);
                      },
                    ),
                  ),
                  Visibility(
                    visible: selectedDate != null ? dateSelected : false,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Container(
                        width: constraints.maxWidth,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorConstants.mainBlue,
                        ),
                        child: Text(
                          selectedDate!.split(' ')[0],
                          style: MyTextStyle.normalWhiteText,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    itemCount: selectedDept != null || selectedDate != null
                        ? viewConcernsProvider.departmentWiseConcernsList.length
                        : viewConcernsProvider.concernsModel.list?.length ?? 0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      // return Padding(
                      //   padding: const EdgeInsets.only(bottom: 10),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       color: ColorConstants.mainBlue,
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     padding: EdgeInsets.all(10),
                      // child: selectedDept != null
                      //     ? Text(varProvider
                      //             .departmentWiseConcernsList[index]
                      //             ?.fname ??
                      //         "")
                      //     : Text(varProvider
                      //             .concernsModel.list?[index].fname ??
                      //         ""),
                      //   ),
                      // );

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ExpansionTile(
                          title: selectedDept != null || selectedDate != null
                              ? Text(viewConcernsProvider
                                      .departmentWiseConcernsList[index]
                                      ?.fname ??
                                  "")
                              : Text(viewConcernsProvider
                                      .concernsModel.list?[index].fname ??
                                  ""),
                          collapsedBackgroundColor: ColorConstants.mainBlue,
                          collapsedTextColor: ColorConstants.mainwhite,
                          childrenPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          expandedAlignment: Alignment.center,
                          children: [
                            LayoutBuilder(builder: (context, constraints) {
                              return Container(
                                width: constraints.maxWidth,
                                child: DataTable(
                                    headingRowColor:
                                        WidgetStateColor.resolveWith(
                                      (states) => ColorConstants.mainBlue,
                                    ),
                                    headingTextStyle: TextStyle(
                                      color: ColorConstants.mainwhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    columns: [
                                      DataColumn(label: Text("Empid")),
                                      DataColumn(label: Text("Date")),
                                      DataColumn(label: Text("Department")),
                                      DataColumn(label: Text("Reported to")),
                                    ],
                                    rows: [
                                      DataRow(cells: [
                                        DataCell(
                                          Text(selectedDept != null ||
                                                  selectedDate != null
                                              ? viewConcernsProvider
                                                      .departmentWiseConcernsList[
                                                          index]
                                                      ?.empcode ??
                                                  ""
                                              : viewConcernsProvider
                                                      .concernsModel
                                                      .list?[index]
                                                      .empcode ??
                                                  ""),
                                        ),
                                        DataCell(
                                          Text(selectedDept != null ||
                                                  selectedDate != null
                                              ? viewConcernsProvider
                                                      .departmentWiseConcernsList[
                                                          index]
                                                      ?.date
                                                      .toString() ??
                                                  ""
                                              : viewConcernsProvider
                                                      .concernsModel
                                                      .list?[index]
                                                      .date
                                                      .toString() ??
                                                  ""),
                                        ),
                                        DataCell(
                                          Text(selectedDept != null ||
                                                  selectedDate != null
                                              ? viewConcernsProvider
                                                      .departmentWiseConcernsList[
                                                          index]
                                                      ?.dep ??
                                                  ""
                                              : viewConcernsProvider
                                                      .concernsModel
                                                      .list?[index]
                                                      .dep ??
                                                  ""),
                                        ),
                                        DataCell(
                                          Text(selectedDept != null ||
                                                  selectedDate != null
                                              ? viewConcernsProvider
                                                      .departmentWiseConcernsList[
                                                          index]
                                                      ?.towhom ??
                                                  ""
                                              : viewConcernsProvider
                                                      .concernsModel
                                                      .list?[index]
                                                      .towhom ??
                                                  ""),
                                        ),
                                      ]),
                                    ]),
                              );
                            }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Concerns : "),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: ColorConstants.mainwhite,
                                        border: Border.all(
                                            color: ColorConstants.mainBlack),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(-1, 2))
                                        ]),
                                    child: Text(selectedDept != null ||
                                            selectedDate != null
                                        ? viewConcernsProvider
                                                .departmentWiseConcernsList[
                                                    index]
                                                ?.compl ??
                                            ""
                                        : viewConcernsProvider.concernsModel
                                                .list?[index].compl ??
                                            ""),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Visibility(
                                  visible: viewConcernsFunctionProvider
                                          .concernsModel.list?[index].remarks !=
                                      "",
                                  child: Text(
                                      "Remarks : ${viewConcernsFunctionProvider.concernsModel.list?[index].remarks}"),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Spacer(),
                                InkWell(
                                  onTap: () async {
                                    await viewConcernsFunctionProvider
                                        .resolveController(
                                            complaintId: viewConcernsProvider
                                                    .concernsModel
                                                    .list?[index]
                                                    .complId ??
                                                "0",
                                            modeController: '1');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: ColorConstants.mainBlue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "Rejected",
                                      style: MyTextStyle.normalWhiteText,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Visibility(
                                  visible: viewConcernsFunctionProvider
                                              .concernsModel
                                              .list?[index]
                                              .remarks ==
                                          "" ||
                                      viewConcernsFunctionProvider.concernsModel
                                              .list?[index].remarks ==
                                          "Pending",
                                  child: InkWell(
                                    onTap: () async {
                                      await viewConcernsFunctionProvider
                                          .resolveController(
                                              complaintId: viewConcernsProvider
                                                      .concernsModel
                                                      .list?[index]
                                                      .complId ??
                                                  "0",
                                              modeController: '2');
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: ColorConstants.mainBlue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "On hold",
                                        style: MyTextStyle.normalWhiteText,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () async {
                                    await viewConcernsFunctionProvider
                                        .resolveController(
                                            complaintId: viewConcernsProvider
                                                    .concernsModel
                                                    .list?[index]
                                                    .complId ??
                                                "0",
                                            modeController: '3');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: ColorConstants.mainBlue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "Resolved",
                                      style: MyTextStyle.normalWhiteText,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
