import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/billing_pharmacy/model/bill_pharmacy.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/billing_pharmacy/widgets/billing_pharmacy.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key, required this.value, this.givenScreen});
  final String value;
  final Widget? givenScreen;

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // String value = "Notifications";
  Widget? screen;
  @override
  void initState() {
    super.initState();
    screen = widget.givenScreen;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width * .2,
          height: size.height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: ColorConstants.mainBlue,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Column(
            children: [
              Container(
                width: size.width * .199,
                color: ColorConstants.mainwhite,
                child: Image.asset(
                  "assets/images/highlandlogo-removebg-preview.png",
                ),
              ),
              SizedBox(height: size.height * .01),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * .05),
                  buttonCall(
                    label: widget.value,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: screen,
          ),
        ),
      ],
    );
  }

  Widget buttonCall({required String label}) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: constraints.maxWidth * .6,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            // color: ColorConstants.mainOrange,
            color: ColorConstants.mainOrange,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(color: ColorConstants.mainwhite),
          ),
        ),
      );
    });
  }
}

class NotificationsScreenSample extends StatefulWidget {
  const NotificationsScreenSample({super.key});

  @override
  State<NotificationsScreenSample> createState() =>
      _NotificationsScreenSampleState();
}

class _NotificationsScreenSampleState extends State<NotificationsScreenSample> {
  List<Medicine> medicineList = [
    Medicine(name: 'Paracetamol', stock: 10, price: 10.0, gst: 12),
    Medicine(name: 'Ibuprofen', stock: 8, price: 15.0, gst: 18),
    Medicine(name: 'Amoxicillin', stock: 12, price: 20.0, gst: 5),
    Medicine(name: 'Aspirin', stock: 10, price: 12.0, gst: 18),
    Medicine(name: 'Ciprofloxacin', stock: 9, price: 18.0, gst: 12),
    Medicine(name: 'Cetirizine', stock: 2, price: 8.0, gst: 5),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      child: ListView.builder(
        itemCount: medicineList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              child: ExpansionTile(
                title: Text("Shortage in stock"),
                collapsedBackgroundColor: ColorConstants.mainBlue,
                collapsedTextColor: ColorConstants.mainwhite,
                childrenPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                children: [
                  Container(
                    width: size.width * .7,
                    child: DataTable(
                      headingRowColor: WidgetStateColor.resolveWith(
                        (states) => ColorConstants.mainBlue,
                      ),
                      headingTextStyle: TextStyle(
                        color: ColorConstants.mainwhite,
                        fontWeight: FontWeight.bold,
                      ),
                      columns: [
                        DataColumn(label: Text('Item name')),
                        DataColumn(label: Text('Store No.')),
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Current Stock')),
                        DataColumn(label: Text('Minimum Stock')),
                        DataColumn(label: Text('Priority')),
                      ],
                      rows: List.generate(1, (index2) {
                        return DataRow(
                          cells: [
                            DataCell(Text(medicineList[index].name)),
                            DataCell(Text("Store 1")),
                            DataCell(Text(DateFormat('d-mm-yyyy')
                                .format(DateTime.now())
                                .toString())),
                            DataCell(
                                Text(medicineList[index].stock.toString())),
                            DataCell(Text("15")),
                            DataCell(Text("Low")),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
