// import 'package:flutter/material.dart';
// import 'package:hms_web_project/constants/color_constants.dart';
// import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
// import 'package:provider/provider.dart';

// class AdmissionEmergency extends StatefulWidget {
//   const AdmissionEmergency({super.key});

//   @override
//   State<AdmissionEmergency> createState() => _AdmissionEmergencyState();
// }

// class _AdmissionEmergencyState extends State<AdmissionEmergency> {
//   String? _selectedDoctor;
//   String? _selectedDoctorId;
//   String? _selectedDepartment;
//   callFuction() async {
//     await Provider.of<BookingPatientController>(context, listen: false)
//         .department();
//   }

//   @override
//   void initState() {
//     super.initState();
//     callFuction();
//   }

//   String? _selectedItem = 'IP';

//   final List<String> _items = ['IP', 'OP', 'Daycare'];
//   @override
//   Widget build(BuildContext context) {
//     var functionprovider =
//         Provider.of<BookingPatientController>(context, listen: false);
//     var varprovider = Provider.of<BookingPatientController>(context);
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Text(
//                 "Patient ID :  ",
//                 style:
//                     TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Row(
//             children: [
//               Text(
//                 "Select type : ",
//                 style:
//                     TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//               ),
//               Container(
//                 height: 60,
//                 width: 150,
//                 child: DropdownButtonFormField<String>(
//                     value: _selectedItem,
//                     icon: Icon(Icons.arrow_downward),
//                     decoration: InputDecoration(
//                       // labelText: "Select Type",
//                       border: OutlineInputBorder(),
//                     ),
//                     items: _items.map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         _selectedItem = newValue;
//                       });
//                     }),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Row(
//             children: [
//               Text(
//                 "Name :  ",
//                 style:
//                     TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//               SizedBox(
//                 width: 250,
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                       // labelText: 'Enter your name',
//                       // border: OutlineInputBorder(),
//                       border: InputBorder.none),
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Row(
//             children: [
//               Text(
//                 "Age :  ",
//                 style:
//                     TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//               SizedBox(
//                 width: 250,
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                       // labelText: 'Enter your name',
//                       // border: OutlineInputBorder(),
//                       border: InputBorder.none),
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Row(
//             children: [
//               Text(
//                 "Phn no :  ",
//                 style:
//                     TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//               SizedBox(
//                 width: 250,
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                       // labelText: 'Enter your name',
//                       // border: OutlineInputBorder(),
//                       border: InputBorder.none),
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Row(
//             children: [
//               Text(
//                 "Address :  ",
//                 style:
//                     TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//               SizedBox(
//                 width: 250,
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                       // labelText: 'Enter your name',
//                       // border: OutlineInputBorder(),
//                       border: InputBorder.none),
//                 ),
//               )
//             ],
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: DropdownButtonFormField<String>(
//                   value: _selectedDepartment,
//                   hint: const Text(
//                     'Select Department',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(
//                       Icons.local_hospital,
//                       color: ColorConstants.mainBlue,
//                     ),
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   items: varprovider.deptList.map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (newValue) async {
//                     setState(() {
//                       _selectedDepartment = newValue;
//                     });
//                     await functionprovider.doctors(_selectedDepartment);

//                     _selectedDoctor = varprovider.doctorList.isNotEmpty
//                         ? varprovider.doctorList[0]
//                         : null;
//                     _selectedDoctorId = varprovider.doctorList.isNotEmpty
//                         ? varprovider.doctorIdList[0]
//                         : null;
//                     // selectingTimeslots(
//                     //     varprovider: varprovider,
//                     //     functionprovider: functionprovider);
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please select a department';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               const SizedBox(width: 40.0),
//               Expanded(
//                 child: DropdownButtonFormField<String>(
//                   value: _selectedDoctor,
//                   hint: const Text(
//                     'Select Doctor',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(
//                       Icons.medical_services,
//                       color: ColorConstants.mainBlue,
//                     ),
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                     // suffix: TextButton(
//                     //     onPressed: () {},
//                     //     child: const Text("check availability")),
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   items: varprovider.doctorList.map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (newValue) async {
//                     setState(() {
//                       _selectedDoctor = newValue;
//                     });
//                     int itemid = 0;
//                     for (var i = 0; i < varprovider.doctorList.length; i++) {
//                       if (varprovider.doctorList[i] == _selectedDoctor) {
//                         itemid = i;
//                       }
//                     }
//                     _selectedDoctorId = varprovider.doctorIdList[itemid];
//                     // selectingTimeslots(
//                     //     varprovider: varprovider, functionprovider: functionprovider);
//                     // _dateController.clear();
//                     // picked = null;
//                     // varprovider.timeList.clear();
//                     // varprovider.selectedtimeList.clear();
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please select a doctor';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// --------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:provider/provider.dart';

class AdmissionEmergency extends StatefulWidget {
  const AdmissionEmergency({super.key});

  @override
  State<AdmissionEmergency> createState() => _AdmissionEmergencyState();
}

class _AdmissionEmergencyState extends State<AdmissionEmergency> {
  String? _selectedDoctor;
  String? _selectedDoctorId;
  String? _selectedDepartment;

  // String? _selectedItem = 'IP';
  String? _selectedItem;

  final List<String> _items = ['IP', 'OP', 'Daycare'];

  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _opController = TextEditingController();
  final TextEditingController _daycareController = TextEditingController();

  callFuction() async {
    await Provider.of<BookingPatientController>(context, listen: false)
        .department();
  }

  @override
  void initState() {
    super.initState();
    callFuction();
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    _ipController.dispose();
    _opController.dispose();
    _daycareController.dispose();
    super.dispose();
  }

  String? medLegalCase = 'No';
  @override
  Widget build(BuildContext context) {
    var functionprovider =
        Provider.of<BookingPatientController>(context, listen: false);
    var varprovider = Provider.of<BookingPatientController>(context);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Temporary ID :  ",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Text(
                "Select type : ",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 60,
                width: 150,
                child: DropdownButtonFormField<String>(
                  value: _selectedItem,
                  icon: const Icon(Icons.arrow_downward),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  items: _items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue;
                    });
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          // IP Field
          Visibility(
            visible: _selectedItem == 'IP',
            child: Row(
              children: [
                const Text(
                  "IP Number : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    controller: _ipController,
                    decoration: const InputDecoration(
                      hintText: 'Enter IP number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          // OP Field
          Visibility(
            visible: _selectedItem == 'OP',
            child: Row(
              children: [
                const Text(
                  "OP Number : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    controller: _opController,
                    decoration: const InputDecoration(
                      hintText: 'Enter OP number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          // Daycare Field
          Visibility(
            visible: _selectedItem == 'Daycare',
            child: Row(
              children: [
                const Text(
                  "Daycare Number : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    controller: _daycareController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Daycare number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                "Name :  ",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    // hintText: 'Enter your name',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "Age :  ",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                      // labelText: 'Enter your name',
                      // border: OutlineInputBorder(),
                      border: InputBorder.none),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Phn no :  ",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                      // labelText: 'Enter your name',
                      // border: OutlineInputBorder(),
                      border: InputBorder.none),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Address :  ",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                      // labelText: 'Enter your name',
                      // border: OutlineInputBorder(),
                      border: InputBorder.none),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedDepartment,
                  hint: const Text(
                    'Select Department',
                    style: TextStyle(color: Colors.black),
                  ),
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
                    await functionprovider.doctors(_selectedDepartment);

                    _selectedDoctor = varprovider.doctorList.isNotEmpty
                        ? varprovider.doctorList[0]
                        : null;
                    _selectedDoctorId = varprovider.doctorList.isNotEmpty
                        ? varprovider.doctorIdList[0]
                        : null;
                    // selectingTimeslots(
                    //     varprovider: varprovider,
                    //     functionprovider: functionprovider);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a department';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 40.0),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedDoctor,
                  hint: const Text(
                    'Select Doctor',
                    style: TextStyle(color: Colors.black),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.medical_services,
                      color: ColorConstants.mainBlue,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    // suffix: TextButton(
                    //     onPressed: () {},
                    //     child: const Text("check availability")),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  items: varprovider.doctorList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) async {
                    setState(() {
                      _selectedDoctor = newValue;
                    });
                    int itemid = 0;
                    for (var i = 0; i < varprovider.doctorList.length; i++) {
                      if (varprovider.doctorList[i] == _selectedDoctor) {
                        itemid = i;
                      }
                    }
                    _selectedDoctorId = varprovider.doctorIdList[itemid];
                    // selectingTimeslots(
                    //     varprovider: varprovider, functionprovider: functionprovider);
                    // _dateController.clear();
                    // picked = null;
                    // varprovider.timeList.clear();
                    // varprovider.selectedtimeList.clear();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a doctor';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),

          SizedBox(
            height: 21,
          ),
          Row(
            children: [
              Text(
                "Medical legal case   : ",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: RadioListTile<String>(
                  title: Text("Yes"),
                  value: 'Yes',
                  groupValue: medLegalCase,
                  onChanged: (String? value) {
                    setState(() {
                      medLegalCase = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  title: Text("No"),
                  value: 'No',
                  groupValue: medLegalCase,
                  onChanged: (String? value) {
                    setState(() {
                      medLegalCase = value;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 11,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: ColorConstants.mainBlue,
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Text(
                "Submit",
                style: TextStyle(color: ColorConstants.mainwhite),
              ),
            ),
          )
        ],
      ),
    );
  }
}
