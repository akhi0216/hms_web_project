// import 'package:flutter/material.dart';

// class NewDoctor extends StatefulWidget {
//   const NewDoctor({super.key});

//   @override
//   State<NewDoctor> createState() => _NewDoctorState();
// }

// class _NewDoctorState extends State<NewDoctor> {
//   final _formKey = GlobalKey<FormState>();
//   String _gender = 'Male';
//   String _specialization = 'Cardiology';
//   String _department = 'General Medicine';
//   String _role = 'Consultant';
//   String _nationality = 'United States';
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'Personal Information',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'First Name'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Middle Name'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Last Name'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Date of Birth'),
//               onTap: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(1900),
//                   lastDate: DateTime(2101),
//                 );
//                 if (pickedDate != null) {
//                   // handle picked date
//                 }
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: Text('Gender'),
//             ),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: ListTile(
//                     title: const Text('Male'),
//                     leading: Radio<String>(
//                       value: 'Male',
//                       groupValue: _gender,
//                       onChanged: (String? value) {
//                         setState(() {
//                           _gender = value!;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: ListTile(
//                     title: const Text('Female'),
//                     leading: Radio<String>(
//                       value: 'Female',
//                       groupValue: _gender,
//                       onChanged: (String? value) {
//                         setState(() {
//                           _gender = value!;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: ListTile(
//                     title: const Text('Other'),
//                     leading: Radio<String>(
//                       value: 'Other',
//                       groupValue: _gender,
//                       onChanged: (String? value) {
//                         setState(() {
//                           _gender = value!;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Phone Number (Personal)'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Phone Number (Office)'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Email Address'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Residential Address'),
//             ),
//             TextFormField(
//               decoration:
//                   InputDecoration(labelText: 'Mailing Address (if different)'),
//             ),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(labelText: 'Nationality'),
//               value: _nationality,
//               items: ['United States', 'Canada', 'United Kingdom', 'Australia']
//                   .map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _nationality = newValue!;
//                 });
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Passport Number'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'National ID'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Driver\'s License'),
//             ),
//             // File upload widget should be implemented here

//             Text(
//               'Professional Information',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(labelText: 'Specialization'),
//               value: _specialization,
//               items: ['Cardiology', 'Neurology', 'Orthopedics']
//                   .map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _specialization = newValue!;
//                 });
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Qualifications'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Institution'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Previous Workplaces'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Positions Held'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Duration'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'License Number'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Issuing Authority'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Expiration Date'),
//             ),
//             // File upload widget should be implemented here

//             TextFormField(
//               decoration:
//                   InputDecoration(labelText: 'Professional Memberships'),
//             ),
//             TextFormField(
//               decoration:
//                   InputDecoration(labelText: 'Research and Publications'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Languages Spoken'),
//             ),

//             Text(
//               'Hospital-Specific Information',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(labelText: 'Department'),
//               value: _department,
//               items: ['General Medicine', 'Surgery', 'Pediatrics']
//                   .map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _department = newValue!;
//                 });
//               },
//             ),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(labelText: 'Role'),
//               value: _role,
//               items: ['Consultant', 'Resident', 'Surgeon'].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _role = newValue!;
//                 });
//               },
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Working Hours'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Days'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Shifts'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Employee ID'),
//             ),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Joining Date'),
//               onTap: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(1900),
//                   lastDate: DateTime(2101),
//                 );
//                 if (pickedDate != null) {
//                   // handle picked date
//                 }
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   // Process data
//                 }
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// 7777777777777777777777777777777777777777777777777777777777777777777777777777777777
import 'package:flutter/material.dart';

class NewDoctor extends StatefulWidget {
  const NewDoctor({super.key});

  @override
  State<NewDoctor> createState() => _NewDoctorState();
}

class _NewDoctorState extends State<NewDoctor> {
  final _formKey = GlobalKey<FormState>();
  String _gender = 'Male';
  String _specialization = 'Cardiology';
  String _department = 'General Medicine';
  String _role = 'Consultant';
  String _nationality = 'United States';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            sectionHeader('Personal Information'),
            buildTextFormField('First Name', Icons.person),
            buildTextFormField('Middle Name', Icons.person_outline),
            buildTextFormField('Last Name', Icons.person_outline),
            buildDatePickerFormField('Date of Birth', Icons.calendar_today),
            buildGenderRadioButtons(),
            buildTextFormField('Phone Number (Personal)', Icons.phone),
            buildTextFormField('Phone Number (Office)', Icons.phone),
            buildTextFormField('Email Address', Icons.email),
            buildTextFormField('Residential Address', Icons.home),
            buildTextFormField('Mailing Address (if different)', Icons.mail),
            buildDropdownFormField(
              'Nationality',
              _nationality,
              ['United States', 'Canada', 'United Kingdom', 'Australia'],
              (String? newValue) {
                setState(() {
                  _nationality = newValue!;
                });
              },
              Icons.flag,
            ),
            buildTextFormField('Passport Number', Icons.travel_explore),
            buildTextFormField('National ID', Icons.credit_card),
            buildTextFormField('Driver\'s License', Icons.drive_eta),
            sectionHeader('Professional Information'),
            buildDropdownFormField(
              'Specialization',
              _specialization,
              ['Cardiology', 'Neurology', 'Orthopedics'],
              (String? newValue) {
                setState(() {
                  _specialization = newValue!;
                });
              },
              Icons.local_hospital,
            ),
            buildTextFormField('Qualifications', Icons.school),
            buildTextFormField('Institution', Icons.account_balance),
            buildTextFormField('Previous Workplaces', Icons.work),
            buildTextFormField('Positions Held', Icons.business_center),
            buildTextFormField('Duration', Icons.access_time),
            buildTextFormField('License Number', Icons.article),
            buildTextFormField('Issuing Authority', Icons.account_balance),
            buildDatePickerFormField('Expiration Date', Icons.calendar_today),
            buildTextFormField('Professional Memberships', Icons.group),
            buildTextFormField('Research and Publications', Icons.book),
            buildTextFormField('Languages Spoken', Icons.language),
            sectionHeader('Hospital-Specific Information'),
            buildDropdownFormField(
              'Department',
              _department,
              ['General Medicine', 'Surgery', 'Pediatrics'],
              (String? newValue) {
                setState(() {
                  _department = newValue!;
                });
              },
              Icons.apartment,
            ),
            buildDropdownFormField(
              'Role',
              _role,
              ['Consultant', 'Resident', 'Surgeon'],
              (String? newValue) {
                setState(() {
                  _role = newValue!;
                });
              },
              Icons.badge,
            ),
            buildTextFormField('Working Hours', Icons.access_time),
            buildTextFormField('Days', Icons.calendar_today),
            buildTextFormField('Shifts', Icons.schedule),
            buildTextFormField('Employee ID', Icons.badge),
            buildDatePickerFormField('Joining Date', Icons.calendar_today),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process data
                  }
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
      ),
    );
  }

  Widget buildTextFormField(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          prefixIcon: Icon(icon, color: Colors.teal),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget buildDatePickerFormField(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          prefixIcon: Icon(icon, color: Colors.teal),
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2101),
          );
          if (pickedDate != null) {
            // handle picked date
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget buildGenderRadioButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Gender',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal)),
          Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text('Male'),
                  leading: Radio<String>(
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                    activeColor: Colors.teal,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Female'),
                  leading: Radio<String>(
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                    activeColor: Colors.teal,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Other'),
                  leading: Radio<String>(
                    value: 'Other',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                    activeColor: Colors.teal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDropdownFormField(String label, String currentValue,
      List<String> items, ValueChanged<String?> onChanged, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          prefixIcon: Icon(icon, color: Colors.teal),
        ),
        value: currentValue,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
