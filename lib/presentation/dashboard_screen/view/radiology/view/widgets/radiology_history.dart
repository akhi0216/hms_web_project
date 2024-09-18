import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/radiology/controller/radiology_controller.dart';
import 'package:provider/provider.dart';

class RadiologyHistory extends StatefulWidget {
  const RadiologyHistory({super.key});

  @override
  State<RadiologyHistory> createState() => _RadiologyHistoryState();
}

class _RadiologyHistoryState extends State<RadiologyHistory> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> searchList = [];
  // List<Map<String, String>> patientList = [
  //   {
  //     'id': '001',
  //     'patient': 'Nithin',
  //     'doctor': 'Hari',
  //     'time': '10.00',
  //     'ot': '3',
  //     'type': '3',
  //     'reason': '3',
  //   },
  //   {
  //     'id': '002',
  //     'patient': 'Hari',
  //     'doctor': 'Athulya',
  //     'time': '1.00',
  //     'ot': '2',
  //     'type': '3',
  //     'reason': '3',
  //   },
  //   {
  //     'id': '003',
  //     'patient': 'Athulya',
  //     'doctor': 'Nithin',
  //     'time': '12.00',
  //     'ot': '3',
  //     'type': '3',
  //     'reason': '3',
  //   },
  //   {
  //     'id': '004',
  //     'patient': 'Akhila',
  //     'doctor': 'Adharsh',
  //     'time': '3.00',
  //     'ot': '1',
  //     'type': '3',
  //     'reason': '3',
  //   },
  //   {
  //     'id': '005',
  //     'patient': 'Adharsh',
  //     'doctor': 'Nithin',
  //     'time': '9.00',
  //     'ot': '1',
  //     'type': '3',
  //     'reason': '3',
  //   },
  // ];

  // fetchData() async {
  //   await Provider.of<RadiologyController>(context, listen: false)
  //       .radiologyHistory();
  //   radiologyHistoryList = List.from(
  //       Provider.of<RadiologyController>(context, listen: false)
  //           .radiologyHistoryList);
  //   log(radiologyHistoryList.toString());
  // }

  // List radiologyHistoryList = [];

  @override
  void initState() {
    super.initState();
    // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var radiologyHistoryProvider = Provider.of<RadiologyController>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      alignLabelWithHint: true,
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey),
                      // suffixIcon: IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.search),
                      // ),
                    ),
                    onChanged: (value) {
                      // print(value);
                      searchList.clear();
                      // print(patientList[0]['id']?.contains(value));
                      if (value.isNotEmpty) {
                        for (var i = 0;
                            i <
                                radiologyHistoryProvider
                                    .radiologyHistoryList.length;
                            i++) {
                          if (radiologyHistoryProvider.radiologyHistoryList[i]
                                  ['id']!
                              .contains(value)) {
                            searchList.add(radiologyHistoryProvider
                                .radiologyHistoryList[i]);
                          }
                        }
                      }
                      setState(() {});
                      print(searchList);
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Container(
            width: MediaQuery.sizeOf(context).width * .7,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: DataTable(
              // columnSpacing: 20.0,
              headingRowColor: WidgetStateColor.resolveWith(
                (states) => ColorConstants.mainBlue,
              ),
              headingTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              columns: [
                DataColumn(
                  label: Text('Patient Id'),
                ),
                DataColumn(
                  label: Text('Patient Name'),
                ),
                DataColumn(
                  label: Text('Doctor Name'),
                ),
                DataColumn(
                  label: Text('Time'),
                ),
                DataColumn(
                  label: Text('Date'),
                ),
                DataColumn(
                  label: Text('Type'),
                ),
                DataColumn(
                  label: Text('Reason'),
                ),
              ],
              rows: List.generate(
                  searchList.isNotEmpty
                      ? searchList.length
                      : radiologyHistoryProvider.radiologyHistoryList.length,
                  (index) {
                String firstName = radiologyHistoryProvider
                        .radiologyHistoryList[index]['FirstName'] ??
                    "";
                String lastName = radiologyHistoryProvider
                        .radiologyHistoryList[index]['LastName'] ??
                    "";
                String fullName = "$firstName $lastName".trim();
                return searchList.isEmpty
                    ? DataRow(cells: [
                        DataCell(Text(radiologyHistoryProvider
                                .radiologyHistoryList[index]['patientid'] ??
                            "")),
                        DataCell(Text(fullName)),
                        DataCell(Text(radiologyHistoryProvider
                                .radiologyHistoryList[index]['doctor_name'] ??
                            "")),
                        DataCell(Text(
                            radiologyHistoryProvider.radiologyHistoryList[index]
                                    ['time_book_start'] ??
                                "")),
                        DataCell(Text(radiologyHistoryProvider
                                .radiologyHistoryList[index]['date_book'] ??
                            "")),
                        DataCell(Text(radiologyHistoryProvider
                                .radiologyHistoryList[index]['department'] ??
                            "")),
                        DataCell(Text(radiologyHistoryProvider
                                .radiologyHistoryList[index]['reason'] ??
                            "")),
                      ])
                    : DataRow(cells: [
                        DataCell(Text(searchList[index]['id'] ?? "")),
                        DataCell(Text(searchList[index]['patient'] ?? "")),
                        DataCell(Text(searchList[index]['doctor'] ?? "")),
                        DataCell(Text(searchList[index]['time'] ?? "")),
                        DataCell(Text(searchList[index]['ot'] ?? "")),
                        DataCell(Text(searchList[index]['type'] ?? "")),
                        DataCell(Text(searchList[index]['reason'] ?? "")),
                      ]);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
