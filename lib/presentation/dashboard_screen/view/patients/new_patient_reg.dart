// import 'package:flutter/material.dart';
// import 'package:hms_web_project/constants/color_constants.dart';

// class NewPatientReg extends StatefulWidget {
//   const NewPatientReg({super.key});

//   @override
//   State<NewPatientReg> createState() => _NewPatientRegState();
// }

// class _NewPatientRegState extends State<NewPatientReg> {
//   final _formKey = GlobalKey<FormState>();
//   // Gender? gender;

//   final TextEditingController patientNameController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController bloodGroupController = TextEditingController();
//   final TextEditingController occupationController = TextEditingController();
//   final TextEditingController maritalStatusController = TextEditingController();
//   final TextEditingController fatherHusbandNameController =
//       TextEditingController();
//   final TextEditingController nationalityController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController mobileController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController doctorsController = TextEditingController();
//   final TextEditingController idDocumentController = TextEditingController();
//   final TextEditingController departmentController = TextEditingController();
// //  void dispose() {
// //     patientNameController.dispose();
// //     dobController.dispose();
// //     bloodGroupController.dispose();
// //     occupationController.dispose();
// //     maritalStatusController.dispose();
// //     fatherHusbandNameController.dispose();
// //     nationalityController.dispose();
// //     addressController.dispose();
// //     phoneController.dispose();
// //     mobileController.dispose();
// //     emailController.dispose();
// //     doctorsController.dispose();
// //     idDocumentController.dispose();
// //     departmentController.dispose();
// //     super.dispose();
// //   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   controller: patientNameController,
//                   decoration: InputDecoration(
//                     labelText: 'Patient Name',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter Patient Name';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   controller: dobController,
//                   decoration: InputDecoration(
//                     labelText: 'Date of Birth',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter Date of Birth';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               _buildGenderField(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Blood Group',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter Blood Group';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   controller: occupationController,
//                   decoration: InputDecoration(
//                     labelText: 'Occupation',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter Occupation';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   controller: maritalStatusController,
//                   decoration: InputDecoration(
//                     labelText: 'Marital Status',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter Marital Status';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   controller: fatherHusbandNameController,
//                   decoration: InputDecoration(
//                     labelText: 'Father/Husband Name',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter Father/Husband Name';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   controller: nationalityController,
//                   decoration: InputDecoration(
//                     labelText: 'Nationality',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter Nationality';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   controller: addressController,
//                   decoration: InputDecoration(
//                     labelText: 'Address',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter Address';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   controller: phoneController,
//                   decoration: InputDecoration(
//                     labelText: 'Phone',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter Phone';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   controller: mobileController,
//                   decoration: InputDecoration(
//                     labelText: 'Mobile',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter Mobile';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter Email';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   controller: doctorsController,
//                   decoration: InputDecoration(
//                     labelText: 'Doctors to be Consulted',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter Doctors to be Consulted';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               _buildIdentificationField(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Aadhar(optional)',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'UHID(optional)',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'PAN(optional)',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextFormField(
//                   controller: departmentController,
//                   decoration: InputDecoration(
//                     labelText: 'Department',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter Department';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               SizedBox(height: 20),
//               _buildSubmitButton(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildGenderField() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: <Widget>[
//           Text('Gender: '),
//           Expanded(
//             child: ListTile(
//               title: Text('Male'),
//               leading: Radio(
//                 value: 'male',
//                 groupValue: 'gender',
//                 onChanged: (value) {},
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListTile(
//               title: Text('Female'),
//               leading: Radio(
//                 value: 'female',
//                 groupValue: 'gender',
//                 onChanged: (value) {},
//               ),
//             ),
//           ),
//           Expanded(
//               child: ListTile(
//             title: Text('others'),
//             leading: Radio(
//               value: 'others',
//               groupValue: 'gender',
//               onChanged: (value) {},
//             ),
//           ))
//         ],
//       ),
//     );
//   }

//   Widget _buildIdentificationField() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: <Widget>[
//           Text('Identification Document Provided: '),
//           Checkbox(
//             value: false,
//             onChanged: (value) {},
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSubmitButton() {
//     return ElevatedButton(
//       onPressed: () {
//         if (_formKey.currentState!.validate()) {
//           // Process data
//         }
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Color(0xff0ea69f),
//       ),
//       child: Text('Submit'),
//     );
//   }
// }

// ---------------------------------------------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:hms_web_project/constants/color_constants.dart';

// class NewPatientReg extends StatefulWidget {
//   const NewPatientReg({super.key});

//   @override
//   State<NewPatientReg> createState() => _NewPatientRegState();
// }

// enum Gender { male, female }

// class _NewPatientRegState extends State<NewPatientReg> {
//   final _formKey = GlobalKey<FormState>();
//   Gender? gender;

//   final TextEditingController patientNameController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController bloodGroupController = TextEditingController();
//   final TextEditingController occupationController = TextEditingController();
//   final TextEditingController maritalStatusController = TextEditingController();
//   final TextEditingController fatherHusbandNameController =
//       TextEditingController();
//   final TextEditingController nationalityController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController mobileController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController doctorsController = TextEditingController();
//   final TextEditingController idDocumentController = TextEditingController();
//   final TextEditingController departmentController = TextEditingController();

//   @override
//   void dispose() {
//     patientNameController.dispose();
//     dobController.dispose();
//     bloodGroupController.dispose();
//     occupationController.dispose();
//     maritalStatusController.dispose();
//     fatherHusbandNameController.dispose();
//     nationalityController.dispose();
//     addressController.dispose();
//     phoneController.dispose();
//     mobileController.dispose();
//     emailController.dispose();
//     doctorsController.dispose();
//     idDocumentController.dispose();
//     departmentController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16.0),
//       child: Center(
//         child: Container(
//           constraints: BoxConstraints(maxWidth: 600),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: <Widget>[
//                 _buildTitle('Personal Information'),
//                 _buildTextFormField(
//                     'Patient Name', Icons.person, patientNameController),
//                 _buildTextFormField(
//                     'Date of Birth', Icons.calendar_today, dobController),
//                 _buildGenderField(),
//                 _buildTextFormField(
//                     'Blood Group', Icons.bloodtype, bloodGroupController),
//                 _buildTextFormField(
//                     'Occupation', Icons.work, occupationController),
//                 _buildTextFormField('Marital Status', Icons.family_restroom,
//                     maritalStatusController),
//                 _buildTextFormField('Father/Husband Name', Icons.person_outline,
//                     fatherHusbandNameController),
//                 _buildTextFormField(
//                     'Nationality', Icons.flag, nationalityController),
//                 _buildTextFormField('Address', Icons.home, addressController),
//                 _buildTitle('Contact Information'),
//                 _buildTextFormField('Phone', Icons.phone, phoneController),
//                 _buildTextFormField(
//                     'Mobile', Icons.phone_android, mobileController),
//                 _buildTextFormField('Email', Icons.email, emailController),
//                 _buildTitle('Medical Information'),
//                 _buildTextFormField('Doctors to be Consulted',
//                     Icons.medical_services, doctorsController),
//                 _buildTextFormField('Identification Document Provided',
//                     Icons.description, idDocumentController),
//                 _buildTextFormField(
//                     'Department', Icons.local_hospital, departmentController),
//                 SizedBox(height: 20),
//                 _buildSubmitButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16.0),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: ColorConstants.mainBlue,
//         ),
//       ),
//     );
//   }

//   Widget _buildTextFormField(
//       String label, IconData icon, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(icon, color: ColorConstants.mainBlue),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           filled: true,
//           fillColor: Colors.white,
//         ),
//         validator: (value) {
//           if (value!.isEmpty) {
//             return 'Please enter $label';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   Widget _buildGenderField() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: <Widget>[
//           Text('Gender: '),
//           Expanded(
//             child: ListTile(
//               title: Text('Male'),
//               leading: Radio(
//                 value: Gender.male,
//                 groupValue: gender,
//                 onChanged: (value) {
//                   setState(() {
//                     gender = value;
//                   });
//                 },
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListTile(
//               title: Text('Female'),
//               leading: Radio(
//                 value: Gender.female,
//                 groupValue: gender,
//                 onChanged: (value) {
//                   setState(() {
//                     gender = value;
//                   });
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSubmitButton() {
//     return ElevatedButton(
//       onPressed: () {
//         if (_formKey.currentState!.validate()) {
//           // Process data
//         }
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: ColorConstants.mainBlue,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         padding: EdgeInsets.symmetric(vertical: 16.0),
//       ),
//       child: Text('Submit', style: TextStyle(color: ColorConstants.mainwhite)),
//     );
//   }
// }

// Widget buildDatePicker() {
//   return TextFormField();
// }
// =====================================================================================================

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';

class NewPatientReg extends StatefulWidget {
  const NewPatientReg({super.key});

  @override
  State<NewPatientReg> createState() => _NewPatientRegState();
}

class _NewPatientRegState extends State<NewPatientReg> {
  final _formKey = GlobalKey<FormState>();
  String? gender; // Changed from Gender? to String?

  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController maritalStatusController = TextEditingController();
  final TextEditingController fatherHusbandNameController =
      TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController doctorsController = TextEditingController();
  final TextEditingController idDocumentController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController aadharController = TextEditingController();
  final TextEditingController uhidController = TextEditingController();
  final TextEditingController panController = TextEditingController();
  final TextEditingController docprovidedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: patientNameController,
                  
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Patient Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: dobController,
              
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Date Of Birth',
                    prefixIcon: Icon(
                      Icons.calendar_view_day_rounded,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                _buildGenderField(), // Added gender field
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: bloodGroupController,
                 
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Blood Group',
                    prefixIcon: Icon(
                      Icons.bloodtype,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: occupationController,
                  
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Occupation',
                    prefixIcon: Icon(
                      Icons.work,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: maritalStatusController,
                 
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Marital Status',
                    prefixIcon: Icon(
                      Icons.family_restroom,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: fatherHusbandNameController,
                 
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Father/Husband name',
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: nationalityController,
                  
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Nationality',
                    prefixIcon: Icon(
                      Icons.flag,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: addressController,
                
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Address',
                    prefixIcon: Icon(
                      Icons.home,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: phoneController,
                  
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Phone',
                    prefixIcon: Icon(
                      Icons.phone,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: mobileController,
                  
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Mobile',
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: emailController,
                 
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'E-mail',
                    prefixIcon: Icon(
                      Icons.email,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: doctorsController,
                  
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Doctors to be consulted',
                    prefixIcon: Icon(
                      Icons.medical_services,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: idDocumentController,
                 
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Identification Document provided',
                    prefixIcon: Icon(
                      Icons.description,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: aadharController,
                
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Aadhar (optional)',
                    prefixIcon: Icon(
                      Icons.description,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: uhidController,
                 
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'UHID (optional)',
                    prefixIcon: Icon(
                      Icons.description,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: panController,
                  
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'PAN',
                    prefixIcon: Icon(
                      Icons.description,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: departmentController,
                 
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Department',
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process data
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.mainBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: Text('Submit',
                      style: TextStyle(color: ColorConstants.mainwhite)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: TextStyle(
            fontSize: 16,
            color: ColorConstants.mainBlue,
          ),
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Male',
              groupValue: gender,
              onChanged: (String? value) {
                setState(() {
                  gender = value;
                });
              },
              activeColor: ColorConstants.mainBlue,
            ),
            Text('Male'),
            Radio<String>(
              value: 'Female',
              groupValue: gender,
              onChanged: (String? value) {
                setState(() {
                  gender = value;
                });
              },
              activeColor: ColorConstants.mainBlue,
            ),
            Text('Female'),
            Radio<String>(
              value: 'Others',
              groupValue: gender,
              onChanged: (String? value) {
                setState(() {
                  gender = value;
                });
              },
              activeColor: ColorConstants.mainBlue,
            ),
            Text('Others'),
          ],
        ),
      ],
    );
  }
}
