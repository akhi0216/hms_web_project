import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/concerns_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
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
      ConcernsController concernsProvider,
      ConcernsController varProvider) async {
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
    await Provider.of<ConcernsController>(context, listen: false)
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
    var varProvider = Provider.of<ConcernsController>(context);
    var concernsProvider =
        Provider.of<ConcernsController>(context, listen: false);
    var departmentfunctionProvider =
        Provider.of<BookingPatientController>(context, listen: false);
    var departmentProvider = Provider.of<BookingPatientController>(context);
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
                        _selectDate(context, concernsProvider, varProvider);
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
                        await concernsProvider.departmentWiseConcerns(
                            dept: selectedDept!);
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
                        ? varProvider.departmentWiseConcernsList.length
                        : varProvider.concernsModel.list?.length ?? 0,
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
                              ? Text(varProvider
                                      .departmentWiseConcernsList[index]
                                      ?.fname ??
                                  "")
                              : Text(varProvider
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
                                              ? varProvider
                                                      .departmentWiseConcernsList[
                                                          index]
                                                      ?.empcode ??
                                                  ""
                                              : varProvider.concernsModel
                                                      .list?[index].empcode ??
                                                  ""),
                                        ),
                                        DataCell(
                                          Text(selectedDept != null ||
                                                  selectedDate != null
                                              ? varProvider
                                                      .departmentWiseConcernsList[
                                                          index]
                                                      ?.date ??
                                                  ""
                                              : varProvider.concernsModel
                                                      .list?[index].date ??
                                                  ""),
                                        ),
                                        DataCell(
                                          Text(selectedDept != null ||
                                                  selectedDate != null
                                              ? varProvider
                                                      .departmentWiseConcernsList[
                                                          index]
                                                      ?.dep ??
                                                  ""
                                              : varProvider.concernsModel
                                                      .list?[index].dep ??
                                                  ""),
                                        ),
                                        DataCell(
                                          Text(selectedDept != null ||
                                                  selectedDate != null
                                              ? varProvider
                                                      .departmentWiseConcernsList[
                                                          index]
                                                      ?.towhom ??
                                                  ""
                                              : varProvider.concernsModel
                                                      .list?[index].towhom ??
                                                  ""),
                                        ),
                                      ]),
                                    ]),
                              );
                            }),
                            Row(
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
                                        ? varProvider
                                                .departmentWiseConcernsList[
                                                    index]
                                                ?.compl ??
                                            ""
                                        : varProvider.concernsModel.list?[index]
                                                .compl ??
                                            ""),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Spacer(),
                                InkWell(
                                  onTap: () {},
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
                                InkWell(
                                  onTap: () {},
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
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () {},
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
                            )
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
