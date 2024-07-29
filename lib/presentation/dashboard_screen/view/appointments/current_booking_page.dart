// import 'package:flutter/material.dart';
// import 'package:hms_web_project/constants/color_constants.dart';
// import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// class CurrentBookingPage extends StatefulWidget {
//   const CurrentBookingPage({super.key});

//   @override
//   State<CurrentBookingPage> createState() => _CurrentBookingPageState();
// }

// class _CurrentBookingPageState extends State<CurrentBookingPage> {
//   // List of times
//   final List<String> times = [
//     '9-9.30',
//     '9.30-10',
//     '10-10.30',
//     '10.30-11',
//     '11-11.30',
//     '11.30-12',
//     '12-12.30',
//     '2-2.30',
//     '2.30-3',
//     '3-3.30',
//     '3.30-4'
//   ];

//   // List of doctor names
//   final List<String> doctors = [
//     'Dr. Smith',
//     'Dr. Johnson',
//     'Dr. Brown',
//     'Dr. Williams',
//     'Dr. Jones',
//     'Dr. Davis',
//     'Dr. Garcia'
//   ];

//   String? _selectedDepartment;

//   // Map to track selected times for each row
//   List<Map<String, bool>> selectedTimesList = List.generate(7, (_) => {});

//   callFuction() async {
//     await Provider.of<BookingPatientController>(context, listen: false)
//         .department();
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the maps with all times set to false (not selected)
//     callFuction();
//     for (int i = 0; i < selectedTimesList.length; i++) {
//       for (String time in times) {
//         selectedTimesList[i][time] = false;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Get the current date
//     DateTime now = DateTime.now();
//     // Format the date
//     String formattedDate = DateFormat('dd-MM-yyyy').format(now);
//     var functionprovider =
//         Provider.of<BookingPatientController>(context, listen: false);
//     var varprovider = Provider.of<BookingPatientController>(context);

//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             // First row
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: [
//             //     Container(
//             //       padding: EdgeInsets.all(10),
//             //       decoration: BoxDecoration(
//             //           // color: ColorConstants.mainOrange,
//             //           borderRadius: BorderRadius.all(Radius.circular(7)),
//             //           border: Border.all(color: Colors.black)),
//             //       child: Text(
//             //         "$formattedDate",
//             //         style: TextStyle(color: ColorConstants.mainBlue),
//             //       ),
//             //     ),
//             // Row(
//             //   children: [
//             //     Container(
//             //       padding: EdgeInsets.all(10),
//             //       decoration: BoxDecoration(
//             //           // color: ColorConstants.mainOrange,
//             //           borderRadius: BorderRadius.all(Radius.circular(7)),
//             //           border: Border.all(color: Colors.black)),
//             //       child: Text(
//             //         "Department",
//             //         style: TextStyle(color: ColorConstants.mainBlue),
//             //       ),
//             //     ),
//             //     IconButton(onPressed: () {}, icon: Icon(Icons.sync))
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       // color: ColorConstants.mainOrange,
//                       borderRadius: BorderRadius.all(Radius.circular(7)),
//                       border: Border.all(color: Colors.black)),
//                   child: Text(
//                     "$formattedDate",
//                     style: TextStyle(color: ColorConstants.mainBlue),
//                   ),
//                 ),
//                 // --------------
//                 Container(
//                   constraints: BoxConstraints(maxWidth: 400),
//                   child: DropdownButtonFormField<String>(
//                     value: _selectedDepartment,
//                     hint: const Text(' Department'),
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.local_hospital,
//                         color: ColorConstants.mainBlue,
//                       ),
//                       contentPadding:
//                           EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     items: varprovider.deptList.map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (newValue) async {
//                       setState(() {
//                         _selectedDepartment = newValue;
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select a department';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             //   ],
//             // )
//             //   ],
//             // ),
//             // SizedBox(
//             //   height: 10,
//             // ),

//             // End of first row

//             // Doctor rows
//             for (int i = 0; i < doctors.length; i++) ...[
//               SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(doctors[i]),
//                   // SizedBox(
//                   //   width: 20,
//                   // ),
//                   for (String time in times) ...[
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           selectedTimesList[i][time] =
//                               !selectedTimesList[i][time]!;
//                         });
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(7),
//                         decoration: BoxDecoration(
//                           color: selectedTimesList[i][time]!
//                               ? Colors.green
//                               : Colors.transparent,
//                           border: Border.all(color: ColorConstants.mainBlue),
//                           borderRadius: BorderRadius.all(Radius.circular(5)),
//                         ),
//                         child: Text(
//                           time,
//                           style: TextStyle(color: ColorConstants.mainBlack),
//                         ),
//                       ),
//                     )
//                   ],
//                 ],
//               ),
//               Divider(),
//               SizedBox(height: 15),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
// 999999999999999999999999999999999999999

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CurrentBookingPage extends StatefulWidget {
  const CurrentBookingPage({super.key});

  @override
  State<CurrentBookingPage> createState() => _CurrentBookingPageState();
}

class _CurrentBookingPageState extends State<CurrentBookingPage> {
  // List of doctor names
  final List<String> doctorslist = [];

  String? _selectedDepartment;

  // Map of doctor name and his/her times
  List doctorsList = [];

  // Map to track selected times for each row
  List<Map<String, bool>> selectedTimesList = List.generate(7, (_) => {});

  callFuction() async {
    await Provider.of<BookingPatientController>(context, listen: false)
        .department();
  }

  @override
  void initState() {
    super.initState();
    // Initialize the maps with all times set to false (not selected)
    callFuction();
    // for (int i = 0; i < selectedTimesList.length; i++) {
    //   for (String time in times) {
    //     selectedTimesList[i][time] = false;
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    // Get the current date
    DateTime now = DateTime.now();
    // Format the date
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    var functionprovider =
        Provider.of<BookingPatientController>(context, listen: false);
    var varprovider = Provider.of<BookingPatientController>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      border: Border.all(color: Colors.black)),
                  child: Text(
                    "$formattedDate",
                    style: TextStyle(color: ColorConstants.mainBlue),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: DropdownButtonFormField<String>(
                    value: _selectedDepartment,
                    hint: const Text(' Department'),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.local_hospital,
                        color: ColorConstants.mainBlue,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    items: varprovider.deptList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) async {
                      setState(() {
                        _selectedDepartment = newValue;
                      });
                      //
                      await functionprovider.doctors(_selectedDepartment);
                      print(doctorslist);
                      if (varprovider.doctorsmodelclass.list!.isNotEmpty) {
                        for (var i = 0;
                            i < varprovider.doctorsmodelclass.list!.length;
                            i++) {
                          doctorslist.add(
                              varprovider.doctorsmodelclass.list?[i].name ??
                                  "");
                        }
                      }
                      print(doctorslist);
                      // -------------------------------------------------------------

                      //  ---------------------------------------------------------------------
                      for (int i = 0; i < doctorslist.length; i++) {
                        await functionprovider.doctorTime(
                            varprovider.doctorsmodelclass.list?[i].empcode);
                        Map entries = <String, dynamic>{
                          "doctor_name":
                              varprovider.doctorsmodelclass.list?[i].name!,
                          "doctor_time": varprovider.timeList
                        };
                        doctorsList.add(entries);
                      }
                      print(doctorsList);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a department';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            // for (int i = 0; i < doctors.length; i++) ...[
            //   SizedBox(
            //     height: 30,
            //   ),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(doctors[i]),
            //       for (String time in times) ...[
            //         InkWell(
            //           onTap: () {
            //             setState(() {
            //               selectedTimesList[i][time] =
            //                   !selectedTimesList[i][time]!;
            //             });
            //           },
            //           child: Container(
            //             padding: EdgeInsets.all(7),
            //             decoration: BoxDecoration(
            //               color: selectedTimesList[i][time]!
            //                   ? Colors.red
            //                   : Colors.green,
            //               border: Border.all(color: ColorConstants.mainBlue),
            //               borderRadius: BorderRadius.all(Radius.circular(5)),
            //             ),
            //             child: Text(
            //               time,
            //               style: TextStyle(color: ColorConstants.mainBlack),
            //             ),
            //           ),
            //         )
            //       ],
            //       ],
            //     ),
            //     Divider(),
            //     SizedBox(height: 15),
            //   ],
            SizedBox(
              height: 20,
            ),

            // Row(
            //   children: [
            //     Text(doctorsList.isNotEmpty
            //         ? doctorsList[0]['doctor_name']
            //         : ""),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Wrap(
            //         spacing: 8.0, // gap between adjacent chips
            //         runSpacing: 4.0, // gap between lines
            //         children: List.generate(
            //           10,
            //           (index) {
            // return Container(

            //   child: Text(doctorsList.isNotEmpty?doctorsList[index]['doctor_time']:""),
            // );
            //           },
            //         ))
            //   ],
            // )

            ListView.builder(
              itemCount: doctorsList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text(doctorsList.isNotEmpty
                        ? doctorsList[index]['doctor_name']
                        : ""),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.more_vert_outlined),
                    Wrap(
                      children: List.generate(
                        doctorsList[index]['doctor_time'].length,
                        (index2) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 6),
                          child: Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                            child: Text(doctorsList.isNotEmpty
                                ? doctorsList[index]['doctor_time'][index2]
                                : ""),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
