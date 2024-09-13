import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/concerns_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/controller/view_concerns_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/contoller/feedback_controller.dart';
import 'package:hms_web_project/presentation/login_page/controller/login_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FeedbackResponse extends StatefulWidget {
  const FeedbackResponse({
    super.key,
  });
  // final String designation;
  // final String empId;
  @override
  State<FeedbackResponse> createState() => _FeedbackResponseState();
}

class _FeedbackResponseState extends State<FeedbackResponse> {
  bool dropDownView = false;
  bool dateSelected = false;
  // bool isRejected = false;
  // bool isResolved = false;
  bool isLoading = false;
  // String? selectedDept;
  String? selectedDate;
  DateTime? datetime;

  final formKey = GlobalKey<FormState>();

  TextEditingController reasonController = TextEditingController();
  final responsebackController = TextEditingController();

  // closeAllExpansions(List<ExpansionTileController> expansionList) {
  //   for (var item in expansionList) {
  //     item.collapse();
  //   }
  // }

  Future<void> _selectDate(
      BuildContext context, FeedbackController datePassingProvider) async {
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
        selectedDate = DateFormat('dd-MM-yyyy').format(datetime!.toLocal());
        datePassingProvider.datePassing(date: selectedDate!);
      });
    }
  }

  fetchData() async {
    await Provider.of<FeedbackController>(context, listen: false);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var varloginprovider = Provider.of<LoginController>(context);
    var datepassingfunctionProvider =
        Provider.of<FeedbackController>(context, listen: false);

    var datepassingvarProvider = Provider.of<FeedbackController>(context);

    // var departmentfunctionProvider =
    //     Provider.of<BookingPatientController>(context, listen: false);
    // var departmentProvider = Provider.of<BookingPatientController>(context);
    // var viewConcernsProvider = Provider.of<ViewConcernsController>(context);
    // var viewConcernsFunctionProvider =
    //     Provider.of<ViewConcernsController>(context, listen: false);
    // List<ExpansionTileController> concernsExpansionController = List.generate(
    //   selectedDept != null || selectedDate != null
    //       ? viewConcernsProvider.departmentWiseConcernsList.length
    //       : viewConcernsProvider.concernsModel.list?.length ?? 0,
    //   (index) {
    //     return ExpansionTileController();
    //   },
    // );
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
                  SizedBox(height: 10),
                  LayoutBuilder(builder: (context, constraints) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          dropDownView = false;
                          // selectedDept = null;
                          selectedDate = null;
                          dateSelected = !dateSelected;
                        });

                        _selectDate(context, datepassingfunctionProvider);
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
                    visible: selectedDate != null ? dateSelected : false,
                    child: ListView.builder(
                      itemCount: datepassingvarProvider.viewfeedbackList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          LayoutBuilder(builder: (context, constraints) {
                        return ExpansionTile(
                          title: Text(selectedDate!.split(' ')[0]),
                          collapsedBackgroundColor: ColorConstants.mainBlue,
                          collapsedTextColor: ColorConstants.mainwhite,
                          childrenPadding: EdgeInsets.all(20),
                          expandedAlignment: Alignment.center,
                          children: [
                            LayoutBuilder(
                              builder: (context, constraints) {
                                return Container(
                                  width: constraints.maxWidth,
                                  child: DataTable(
                                      headingRowColor:
                                          WidgetStateColor.resolveWith(
                                        (states) => ColorConstants.mainOrange,
                                      ),
                                      columns: [
                                        DataColumn(label: Text("Name")),
                                        DataColumn(label: Text("Date")),
                                        DataColumn(label: Text("Mobile")),
                                        DataColumn(label: Text("Email-id")),
                                        DataColumn(label: Text("Feedback")),
                                      ],
                                      rows: [
                                        DataRow(cells: [
                                          DataCell(Text(datepassingvarProvider
                                                  .viewfeedbackList[index]
                                                  .name ??
                                              '')),
                                          DataCell(Text(datepassingvarProvider
                                                  .viewfeedbackList[index]
                                                  .date ??
                                              '')),
                                          DataCell(Text(datepassingvarProvider
                                                  .viewfeedbackList[index]
                                                  .mobile ??
                                              '')),
                                          DataCell(Text(datepassingvarProvider
                                                  .viewfeedbackList[index]
                                                  .mail ??
                                              '')),
                                          DataCell(Text(datepassingvarProvider
                                                  .viewfeedbackList[index]
                                                  .response ??
                                              ''))
                                        ])
                                      ]),
                                );
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("Response : "),
                                    Container(
                                        width: 300,
                                        child: TextFormField(
                                          controller: responsebackController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder()),
                                        ))
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    datepassingfunctionProvider
                                        .feedbackReturnresponse(
                                            date: selectedDate,
                                            response:
                                                responsebackController.text,
                                            feedbackid: datepassingvarProvider
                                                    .viewfeedbackList[index]
                                                    .feedbackid ??
                                                '',
                                            approvedby: varloginprovider.empId);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: ColorConstants.mainOrange),
                                    child: Text(
                                      "Respond",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        );
                        //  Container(
                        //   width: constraints.maxWidth,
                        //   padding: EdgeInsets.all(10),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: ColorConstants.mainBlue,
                        //   ),
                        //   child: Text(
                        //     selectedDate!.split(' ')[0],
                        //     style: MyTextStyle.normalWhiteText,
                        //   ),
                        // );
                      }),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
