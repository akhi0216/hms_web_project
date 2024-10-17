// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class AttendanceRegister extends StatefulWidget {
//   const AttendanceRegister({super.key});

//   @override
//   State<AttendanceRegister> createState() => _AttendanceRegisterState();
// }

// class _AttendanceRegisterState extends State<AttendanceRegister> {
//   TextEditingController currentdateController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     // Get the current date
//     DateTime now = DateTime.now();
//     // Format the date
//     String formattedDate = DateFormat('dd-MM-yyyy').format(now);
//     return Column(
//       children: [
//         Row(
//           children: [
//             Text("Emp ID : "),
//             SizedBox(
//               width: 250,
//               child: TextFormField(
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   // hintText: 'Enter contact number',
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 7),
//         Row(
//           children: [
//             Text("Name : "),
//             SizedBox(
//               width: 250,
//               child: TextFormField(
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   // hintText: 'Enter contact number',
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 7),
//         Row(
//           children: [
//             Text("Department : "),
//             SizedBox(
//               width: 250,
//               child: TextFormField(
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   // hintText: 'Enter contact number',
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 7),
//         Row(
//           children: [
//             Text("Time-in : "),
//             SizedBox(
//               width: 250,
//               child: TextFormField(
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   // hintText: 'Enter contact number',
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 7),
//         Row(
//           children: [
//             Text("Time-out : "),
//             SizedBox(
//               width: 250,
//               child: TextFormField(
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   // hintText: 'Enter contact number',
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 7),
//         Row(
//           children: [
//             Text("Date : "),
//             Container(
//               // height: 100,
//               width: 250,
//               child: Text(formattedDate),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }

// -------------
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceRegister extends StatefulWidget {
  const AttendanceRegister({super.key});

  @override
  State<AttendanceRegister> createState() => _AttendanceRegisterState();
}

class _AttendanceRegisterState extends State<AttendanceRegister> {
  TextEditingController currentdateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Get the current date
    DateTime now = DateTime.now();
    // Format the date
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Emp ID
            _buildCard(
              label: "Emp ID",
              child: _buildTextFormField("Enter Employee ID"),
            ),
            SizedBox(height: 15),
            // Name
            _buildCard(
              label: "Name",
              child: _buildTextFormField("Enter Employee Name"),
            ),
            SizedBox(height: 15),
            // Department
            _buildCard(
              label: "Department",
              child: _buildTextFormField("Enter Department"),
            ),
            SizedBox(height: 15),
            // Time-in
            _buildCard(
              label: "Time-in",
              child: _buildTextFormField("Enter Time-in"),
            ),
            SizedBox(height: 15),
            // Time-out
            _buildCard(
              label: "Time-out",
              child: _buildTextFormField("Enter Time-out"),
            ),
            SizedBox(height: 15),
            // Date
            _buildCard(
              label: "Date",
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  formattedDate,
                  style: TextStyle(fontSize: 16, color: Colors.teal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Card with label and input field
  Widget _buildCard({required String label, required Widget child}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$label : ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }

  // Common text field with custom design
  Widget _buildTextFormField(String hintText) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
    );
  }
}
