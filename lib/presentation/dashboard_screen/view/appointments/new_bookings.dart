// import 'package:flutter/material.dart';
// import 'package:hms_web_project/constants/color_constants.dart';

// class NewBookings extends StatefulWidget {
//   const NewBookings({super.key});

//   @override
//   State<NewBookings> createState() => _NewBookingsState();
// }

// class _NewBookingsState extends State<NewBookings> {
//   final _formKey = GlobalKey<FormState>();
//   String _department = 'General Medicine';
//   String _doctor = 'Dr. Smith';
//   String _timeSlot = '09:00 AM - 10:00 AM';
//   DateTime _selectedDate = DateTime.now();
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
//       child: Center(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               sectionHeader('Booking Information'),
//               buildTextFormField('Patient ID', Icons.person),
//               buildTextFormField('First Name', Icons.person_outline),
//               buildTextFormField('Last Name', Icons.person_outline),
//               buildTextFormField('Address', Icons.home),
//               buildTextFormField('Phone Number', Icons.phone),
//               buildDropdownFormField(
//                 'Select Department',
//                 _department,
//                 ['General Medicine', 'Surgery', 'Pediatrics'],
//                 (String? newValue) {
//                   setState(() {
//                     _department = newValue!;
//                   });
//                 },
//                 Icons.local_hospital,
//               ),
//               buildDropdownFormField(
//                 'Select Doctor',
//                 _doctor,
//                 ['Dr. Smith', 'Dr. John', 'Dr. Doe'],
//                 (String? newValue) {
//                   setState(() {
//                     _doctor = newValue!;
//                   });
//                 },
//                 Icons.person_search,
//               ),
//               buildTextFormField('Reason (optional)', Icons.edit),
//               buildDatePickerFormField('Select Date', Icons.calendar_today),
//               buildDropdownFormField(
//                 'Select Time Slot',
//                 _timeSlot,
//                 [
//                   '09:00 AM - 10:00 AM',
//                   '10:00 AM - 11:00 AM',
//                   '11:00 AM - 12:00 PM'
//                 ],
//                 (String? newValue) {
//                   setState(() {
//                     _timeSlot = newValue!;
//                   });
//                 },
//                 Icons.access_time,
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Process data
//                     }
//                   },
//                   child: Text('Submit'),
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Colors.orange,
//                     padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                     textStyle: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget sectionHeader(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16.0),
//       child: Text(
//         title,
//         style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: ColorConstants.mainOrange),
//       ),
//     );
//   }

//   Widget buildTextFormField(String label, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: SizedBox(
//         width: 400, // Adjust the width as needed
//         child: TextFormField(
//           decoration: InputDecoration(
//             labelText: label,
//             border: OutlineInputBorder(),
//             prefixIcon: Icon(icon, color: Color(0xff0ea69f)),
//           ),
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please enter $label';
//             }
//             return null;
//           },
//         ),
//       ),
//     );
//   }

//   Widget buildDatePickerFormField(String label, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: SizedBox(
//         width: 400, // Adjust the width as needed
//         child: TextFormField(
//           readOnly: true,
//           decoration: InputDecoration(
//             labelText: label,
//             border: OutlineInputBorder(),
//             prefixIcon: Icon(icon, color: Color(0xff0ea69f)),
//           ),
//           onTap: () async {
//             DateTime? pickedDate = await showDatePicker(
//               context: context,
//               initialDate: _selectedDate,
//               firstDate: DateTime(1900),
//               lastDate: DateTime(2101),
//             );
//             if (pickedDate != null) {
//               setState(() {
//                 _selectedDate = pickedDate;
//               });
//             }
//           },
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please select $label';
//             }
//             return null;
//           },
//         ),
//       ),
//     );
//   }

//   Widget buildDropdownFormField(String label, String currentValue,
//       List<String> items, ValueChanged<String?> onChanged, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: SizedBox(
//         width: 400, // Adjust the width as needed
//         child: DropdownButtonFormField<String>(
//           decoration: InputDecoration(
//             labelText: label,
//             border: OutlineInputBorder(),
//             prefixIcon: Icon(icon, color: Color(0xff0ea69f)),
//           ),
//           value: currentValue,
//           items: items.map((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//           onChanged: onChanged,
//         ),
//       ),
//     );
//   }
// }
// ------------------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';

class NewBookings extends StatefulWidget {
  const NewBookings({super.key});

  @override
  State<NewBookings> createState() => _NewBookingsState();
}

class _NewBookingsState extends State<NewBookings> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController phnumbercontroller = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController patientidcontroller = TextEditingController();
  String? _selectedDoctor;
  String? _selectedTimeSlot;
  String? _selectedDepartment;

  final List<String> _doctorList = [
    'Dr. Smith',
    'Dr. Johnson',
    'Dr. Williams',
    'Dr. Brown',
    'Dr. Nithin'
  ];
  final List<String> _timeSlots = ['9-10 AM', '11-12 PM', '2-3 PM', '3-4 PM'];

  final List<String> _departmentList = [
    'Casuality',
    'Dermatology',
    'Neurology',
    'Pediatrics',
    'General Medicine'
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   callFuction();
  // }

  // callFuction() async {
  //   Provider.of<BookingPatientController>(context, listen: false).department();
  // }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _reasonController.dispose();
    _dateController.dispose();
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    phnumbercontroller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Patient ID",
              prefixIcon: Icon(
                Icons.person,
                color: ColorConstants.mainBlue,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.orange, width: 2.0),
              ),
              filled: true,
              fillColor: Colors.blue.withOpacity(0.1),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            ),
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "First Name",
              prefixIcon: Icon(
                Icons.person_outline,
                color: ColorConstants.mainBlue,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.orange, width: 2.0),
              ),
              filled: true,
              fillColor: Colors.blue.withOpacity(0.1),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            ),
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Last Name",
              prefixIcon: Icon(
                Icons.person_outline,
                color: ColorConstants.mainBlue,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.orange, width: 2.0),
              ),
              filled: true,
              fillColor: Colors.blue.withOpacity(0.1),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            ),
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Address",
              prefixIcon: Icon(
                Icons.home,
                color: ColorConstants.mainBlue,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.orange, width: 2.0),
              ),
              filled: true,
              fillColor: Colors.blue.withOpacity(0.1),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            ),
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Phn No.",
              prefixIcon: Icon(
                Icons.phone,
                color: ColorConstants.mainBlue,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.orange, width: 2.0),
              ),
              filled: true,
              fillColor: Colors.blue.withOpacity(0.1),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            ),
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          SizedBox(
            height: 15,
          ),
          DropdownButtonFormField<String>(
            value: _selectedDepartment,
            hint: const Text('Select Department'),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.local_hospital),
              filled: true,
              fillColor: Colors.blue.withOpacity(0.1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            items: _departmentList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedDepartment = newValue;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Please select a department';
              }
              return null;
            },
          ),
          SizedBox(
            height: 15,
          ),
          DropdownButtonFormField<String>(
            value: _selectedDoctor,
            hint: const Text('Select Doctor'),
            decoration: InputDecoration(
              suffix: TextButton(
                  onPressed: () {}, child: const Text("check availability")),
              filled: true,
              fillColor: Colors.blue.withOpacity(0.1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            items: _doctorList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedDoctor = newValue;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Please select a doctor';
              }
              return null;
            },
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Reason(optional)",
              prefixIcon: Icon(
                Icons.edit,
                color: ColorConstants.mainBlue,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.orange, width: 2.0),
              ),
              filled: true,
              fillColor: Colors.blue.withOpacity(0.1),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            ),
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Date",
              prefixIcon: Icon(
                Icons.calendar_today,
                color: ColorConstants.mainBlue,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.orange, width: 2.0),
              ),
              filled: true,
              fillColor: Colors.blue.withOpacity(0.1),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            ),
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          SizedBox(
            height: 15,
          ),
          DropdownButtonFormField<String>(
            value: _selectedTimeSlot,
            hint: const Text('Select Time Slot'),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.access_time,
                color: ColorConstants.mainBlue,
              ),
              filled: true,
              fillColor: Colors.blue.withOpacity(0.1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            items: _timeSlots.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedTimeSlot = newValue;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Please select a time slot';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
