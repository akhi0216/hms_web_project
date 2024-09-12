import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/concerns_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/controller/view_concerns_controller.dart';
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

  // closeAllExpansions(List<ExpansionTileController> expansionList) {
  //   for (var item in expansionList) {
  //     item.collapse();
  //   }
  // }

  // Future<void> _selectDate(
  //     BuildContext context,
  //     ViewConcernsController concernsProvider,
  //     ViewConcernsController varProvider) async {
  //   datetime = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );
  //   if (datetime != null) {
  //     setState(() {
  //       // datecontroller.text = "${selectedDate.toLocal()}".split(' ')[0];
  //       dateSelected = true;
  //       // varProvider.departmentWiseConcernsList.clear();
  //       concernsProvider.dateWiseConcerns(
  //           // date: "${selectedDate?.toLocal()}".split(' ')[0]);
  //           date:
  //               "${DateFormat('yyyy-MM-dd HH:mm:ss').format(datetime!.toLocal())}");
  //       selectedDate =
  //           DateFormat('yyyy-MM-dd HH:mm:ss').format(datetime!.toLocal());
  //     });
  //   }
  // }

  // fetchData() async {
  //   await Provider.of<ViewConcernsController>(context, listen: false)
  //       .concernsListFunction(
  //     des: widget.designation,
  //     empcode: widget.empId,
  //   );
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  //   isRejected = false;
  //   isResolved = false;
  // }

  @override
  Widget build(BuildContext context) {
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
                        // setState(() {
                        //   dropDownView = false;
                        //   // selectedDept = null;
                        //   selectedDate = null;
                        //   dateSelected = !dateSelected;
                        // });
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
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
