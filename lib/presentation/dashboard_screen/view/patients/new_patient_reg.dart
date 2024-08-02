
// =====================================================================================================

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


class NewPatientReg extends StatefulWidget {
  const NewPatientReg({super.key});

  @override
  State<NewPatientReg> createState() => _NewPatientRegState();
}

class _NewPatientRegState extends State<NewPatientReg> {
  // final _formKey = GlobalKey<FormState>();
  String? gender; // Changed from Gender? to String?

  // final TextEditingController patientNameController = TextEditingController();
  // final TextEditingController dobController = TextEditingController();
  // final TextEditingController bloodGroupController = TextEditingController();
  // final TextEditingController occupationController = TextEditingController();
  // final TextEditingController maritalStatusController = TextEditingController();
  // final TextEditingController fatherHusbandNameController =
  //     TextEditingController();
  // final TextEditingController nationalityController = TextEditingController();
  // final TextEditingController addressController = TextEditingController();
  // final TextEditingController phoneController = TextEditingController();
  // final TextEditingController mobileController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController doctorsController = TextEditingController();
  // final TextEditingController idDocumentController = TextEditingController();
  // final TextEditingController departmentController = TextEditingController();
  // final TextEditingController aadharController = TextEditingController();
  // final TextEditingController uhidController = TextEditingController();
  // final TextEditingController panController = TextEditingController();
  // final TextEditingController docprovidedController = TextEditingController();



  final _formKey = GlobalKey<FormState>();

  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController fatherHusbandNameController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController doctorToBeConsultedController = TextEditingController();
  TextEditingController idDocumentProvidedController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController remarkscontroller = TextEditingController();

  String? _selectedGender;
  String? _selectedBloodGroup;
  String? _selectedMaritalStatus;
  String? _selectedDepartment;
  String? _selectedDoctor;
  String? _selectedDoctorEmpId;
  String? imageName;

  bool _termsAccepted = false;

  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];
  final List<String> _maritalStatuses = [
    'Single',
    'Married',
    'Divorced',
    'Widowed'
  ];

  final List<String> _doctors = [];

  bool visible = false;

  callFuction() async {
    await Provider.of<BookingPatientController>(context, listen: false)
        .department();
  }

  @override
  void initState() {
    super.initState();
    callFuction();
  }

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  File? files;
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
    imageName = _profileImage?.path.split('/').last;
    print(_profileImage?.path.split('/').last);
  }

  Future<void> uploadImage(File image) async {
    final uri = Uri.parse("https://cybot.avanzosolutions.in/hms/test.php");
    var request = http.MultipartRequest('POST', uri);

    var pic = await http.MultipartFile.fromPath("image", image.path);
    request.files.add(pic);

    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Image Uploaded');
    } else {
      print('Image Not Uploaded');
    }
  }

  Future<void> uploadFile(File receipt) async {
    print("xjhhhc");
    final uri = Uri.parse("https://cybot.avanzosolutions.in/hms/testdoc.php");
    var request = http.MultipartRequest('POST', uri);

    var pic = await http.MultipartFile.fromPath("receipt", receipt.path);
    request.files.add(pic);

    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('File Uploaded');
    } else {
      print('File Not Uploaded');
    }
  }

  Future<void> insertrecord() async {
    try {
      String uri =
          "https://cybot.avanzosolutions.in/hms/patientregisteration.php";
      var res = await http.post(Uri.parse(uri), body: {
        "firstnamecontroller": firstnamecontroller.text,
        "lastnamecontroller": lastnamecontroller.text,
        "dobController": dobController.text,
        "occupationController": occupationController.text,
        "fatherHusbandNameController": fatherHusbandNameController.text,
        "nationalityController": nationalityController.text,
        "addressController": addressController.text,
        "phoneNumberController": phoneNumberController.text,
        "mobileController": mobileController.text,
        "emailController": emailController.text,
        "empcode": _selectedDoctorEmpId,
        "idDocumentProvidedController": idDocumentProvidedController.text,
        "departmentController": departmentController.text,
        "genderController": genderController.text,
        "bloodGroupController": bloodGroupController.text,
        "maritalStatusController": maritalStatusController.text,
        "remarkscontroller": remarkscontroller.text,
        "imagecontroller": imageName,
      });

      if (res.statusCode == 200) {
        print("Record inserted");
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => const HomePage()),
        //     (route) => false);
      } else {
        print("false");
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => const HomePage()),
        //     (route) => false);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  String? _validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (value.length < 7) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? _validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }



  @override
  Widget build(BuildContext context) {

var functionprovider =
        Provider.of<BookingPatientController>(context, listen: false);
    var varprovider = Provider.of<BookingPatientController>(context);



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
                  controller: firstnamecontroller,
                  
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'First Name',
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
                  controller: lastnamecontroller,
                  
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Last Name',
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
                  controller: phoneNumberController,
                  
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
                  controller: doctorToBeConsultedController,
                  
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
                  controller: idDocumentProvidedController,
                 
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
                // TextFormField(
                //   controller: ,
                
                //   decoration: InputDecoration(
                //     contentPadding:
                //         EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                //     labelText: 'Aadhar (optional)',
                //     prefixIcon: Icon(
                //       Icons.description,
                //       color: ColorConstants.mainBlue,
                //     ),
                //     filled: true,
                //     fillColor: Colors.white.withOpacity(0.8),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8.0),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 20.0),
                // TextFormField(
                //   controller: uhidController,
                 
                //   decoration: InputDecoration(
                //     contentPadding:
                //         EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                //     labelText: 'UHID (optional)',
                //     prefixIcon: Icon(
                //       Icons.description,
                //       color: ColorConstants.mainBlue,
                //     ),
                //     filled: true,
                //     fillColor: Colors.white.withOpacity(0.8),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8.0),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 20.0),
                // TextFormField(
                //   controller: panController,
                  
                //   decoration: InputDecoration(
                //     contentPadding:
                //         EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                //     labelText: 'PAN',
                //     prefixIcon: Icon(
                //       Icons.description,
                //       color: ColorConstants.mainBlue,
                //     ),
                //     filled: true,
                //     fillColor: Colors.white.withOpacity(0.8),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8.0),
                //     ),
                //   ),
                // ),
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
