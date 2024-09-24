import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/repositories/api/services/app_utils.dart';
import 'dart:io';
import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class NewPatientRegistrationscreen extends StatefulWidget {
  const NewPatientRegistrationscreen({super.key});

  @override
  State<NewPatientRegistrationscreen> createState() =>
      _NewPatientRegistrationscreenState();
}

class _NewPatientRegistrationscreenState
    extends State<NewPatientRegistrationscreen> {
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
  TextEditingController contactController = TextEditingController();

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
  String? selectedRelationship;

  final List<String> relationshipList = [
    'Parent',
    'Sibling',
    'Spouse',
    'Child',
    'Relative',
    'Friend',
    'Other',
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

  List<String?> fileNames = [];
  List<Uint8List?> pickedFiles = [];
  Uint8List? profileImage;
  Future<void> pickImage({required bool allowMultiple}) async {
    // ---------------------------------------------File Picker
    // FilePickerResult? result =
    //     await FilePicker.platform.pickFiles();
    // if (result != null) {
    //   files = File(result.files.single.path!);
    // }
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: allowMultiple);

    if (result != null && result.files.isNotEmpty) {
      if (allowMultiple == true) {
        List<Uint8List?> fileBytes = result.files
            .map(
              (path) => path.bytes,
            )
            .toList();
        List<String?> fileName = result.files
            .map(
              (path) => path.name,
            )
            .toList();
        // final fileName = result.files.first.name;
        pickedFiles = List<Uint8List?>.from(fileBytes);
        fileNames = List<String?>.from(fileName);
        log(fileNames.toString());
        setState(() {
          visible = true;
        });
      } else {
        final fileBytes = result.files.single.bytes;
        final fileName = result.files.single.name;
        profileImage = fileBytes;
        log(fileName);
        setState(() {});
      }
      // upload file
      // await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes);
    }
  }

  Future<void> uploadImage(File image) async {
    final uri = Uri.parse("${AppUtils.baseURL}/test.php");
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
    final uri = Uri.parse("${AppUtils.baseURL}/testdoc.php");
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
      String uri = "${AppUtils.baseURL}/patientregisteration.php";
      var res = await http.post(Uri.parse(uri), body: {
        "firstnamecontroller": firstnamecontroller.text.trim(),
        "lastnamecontroller": lastnamecontroller.text.trim(),
        "dobController": dobController.text.trim(),
        "occupationController": occupationController.text.trim(),
        "fatherHusbandNameController": fatherHusbandNameController.text.trim(),
        "nationalityController": nationalityController.text.trim(),
        "addressController": addressController.text.trim(),
        "phoneNumberController": phoneNumberController.text.trim(),
        "mobileController": mobileController.text.trim(),
        "emailController": emailController.text.trim(),
        "empcode": _selectedDoctorEmpId,
        "idDocumentProvidedController":
            idDocumentProvidedController.text.trim(),
        "departmentController": departmentController.text.trim(),
        "genderController": genderController.text.trim(),
        "bloodGroupController": bloodGroupController.text.trim(),
        "maritalStatusController": maritalStatusController.text.trim(),
        "remarkscontroller": remarkscontroller.text.trim(),
        "imagecontroller": imageName,
        "relativetypecontroller": selectedRelationship,
        "relativecontactnumbercontroller": contactController.text.trim(),
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
    return
        // Scaffold(
        //   appBar: AppBar(
        //     title: const Text("New Patient Registration"),
        //   ),
        //   body:
        SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      await pickImage(allowMultiple: false);
                    },
                    child: Container(
                      height: 100, width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      // backgroundImage: profileImage != null
                      //     ?
                      //     : null,
                      clipBehavior: Clip.antiAlias,
                      child: profileImage == null
                          ? const Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                              size: 50,
                            )
                          : Image.memory(profileImage!, fit: BoxFit.scaleDown),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: firstnamecontroller,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'First Name',
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
                  validator: _validateNotEmpty,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: lastnamecontroller,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Last Name',
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
                  validator: _validateNotEmpty,
                ),
                const SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: dobController,
                      // decoration: const InputDecoration(
                      //   labelText: 'Date of Birth',
                      //   border: OutlineInputBorder(),
                      // ),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        labelText: 'DOB',
                        prefixIcon: Icon(
                          Icons.calendar_today,
                          color: ColorConstants.mainBlue,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: _validateNotEmpty,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  // decoration: const InputDecoration(
                  //   labelText: 'Gender',
                  //   border: OutlineInputBorder(),
                  // ),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Gender',
                    prefixIcon: Icon(
                      Icons.wc,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  items: _genders.map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                      genderController.text = newValue ?? '';
                    });
                  },
                  validator: _validateDropdown,
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: _selectedBloodGroup,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Blood Group',
                    prefixIcon: Icon(
                      Icons.invert_colors,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  items: _bloodGroups.map((String bloodGroup) {
                    return DropdownMenuItem<String>(
                      value: bloodGroup,
                      child: Text(bloodGroup),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedBloodGroup = newValue;
                      bloodGroupController.text = newValue ?? '';
                    });
                  },
                  validator: _validateDropdown,
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: _selectedMaritalStatus,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Marital status',
                    prefixIcon: Icon(
                      Icons.group,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  items: _maritalStatuses.map((String maritalStatus) {
                    return DropdownMenuItem<String>(
                      value: maritalStatus,
                      child: Text(maritalStatus),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedMaritalStatus = newValue;
                      maritalStatusController.text = newValue ?? '';
                    });
                  },
                  validator: _validateDropdown,
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                    value: _selectedDepartment,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      labelText: 'Department',
                      prefixIcon: Icon(
                        Icons.business_center,
                        color: ColorConstants.mainBlue,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
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
                      _doctors.clear();
                      await functionprovider.doctors(_selectedDepartment);
                      if (varprovider.doctorsmodelclass.list!.isNotEmpty) {
                        for (var i = 0;
                            i < varprovider.doctorsmodelclass.list!.length;
                            i++) {
                          _doctors.add(
                              varprovider.doctorsmodelclass.list?[i].name ??
                                  "");
                        }
                      }
                      _selectedDoctor = _doctors[0];
                      _selectedDoctorEmpId =
                          varprovider.doctorsmodelclass.list?[0].empcode ?? "";
                      print(_doctors);
                    }),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: _selectedDoctor,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Doctor',
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
                  items: _doctors.map((String doctor) {
                    return DropdownMenuItem<String>(
                      value: doctor,
                      child: Text(doctor),
                    );
                  }).toList(),
                  onChanged: (String? newValue) async {
                    setState(() {
                      _selectedDoctor = newValue;
                      // doctorToBeConsultedController.text = newValue ?? '';
                    });
                    int itemid = 0;
                    _doctors.clear();
                    await functionprovider.doctors(_selectedDepartment);
                    for (var i = 0; i < _doctors.length; i++) {
                      if (_doctors[i] == _selectedDoctor) {
                        itemid = i;
                      }
                    }
                    _selectedDoctorEmpId = _doctors[itemid];
                  },
                  validator: _validateDropdown,
                ),
                const SizedBox(height: 16.0),
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
                  validator: _validateNotEmpty,
                ),
                const SizedBox(height: 16.0),
                // TextFormField(
                //   controller: fatherHusbandNameController,
                //   decoration: InputDecoration(
                //     contentPadding:
                //         EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                //     labelText: 'Father/Husband Name/Relative',
                //     prefixIcon: Icon(
                //       Icons.family_restroom,
                //       color: ColorConstants.mainBlue,
                //     ),
                //     filled: true,
                //     fillColor: Colors.white.withOpacity(0.8),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8.0),
                //     ),
                //   ),
                //   validator: _validateNotEmpty,
                // ),
                // ------------------------------------------

                DropdownButtonFormField<String>(
                  value: selectedRelationship,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRelationship = newValue;
                    });
                  },
                  items: relationshipList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    border: OutlineInputBorder(),
                    labelText: 'Relationship',
                    prefixIcon: Icon(
                      Icons.family_restroom,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 16.0),

                TextFormField(
                  controller: contactController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'contact number',
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
                  validator: _validatePhoneNumber,
                ),
                const SizedBox(height: 16.0),
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
                  validator: _validateNotEmpty,
                ),
                const SizedBox(height: 16.0),
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
                  validator: _validateNotEmpty,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Phone Number',
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
                  validator: _validatePhoneNumber,
                ),
                const SizedBox(height: 16.0),
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
                  validator: _validatePhoneNumber,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Email',
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
                  validator: _validateEmail,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: idDocumentProvidedController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Identification Document provided',
                    prefixIcon: Icon(
                      Icons.badge,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: _validateNotEmpty,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: remarkscontroller,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    labelText: 'Remarks',
                    prefixIcon: Icon(
                      Icons.note,
                      color: ColorConstants.mainBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: _validateNotEmpty,
                ),
                Visibility(
                  visible: visible,
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/file.png",
                          height: MediaQuery.sizeOf(context).height * .1,
                        ),
                      ),
                      Text(fileNames.length > 1
                          ? "${fileNames[0]}.etc."
                          : fileNames.length > 0
                            ? fileNames[0] ?? ""
                              : ""),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: InkWell(
                    onTap: () async {
                      pickImage(allowMultiple: true);
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.sizeOf(context).width * .5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorConstants.mainBlue,
                      ),
                      alignment: Alignment.center,
                      child: const Text("Upload files"),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                CheckboxListTile(
                  title: const Text("I accept the terms and conditions"),
                  value: _termsAccepted,
                  onChanged: (bool? value) {
                    setState(() {
                      _termsAccepted = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        _termsAccepted
                            ? const Color(0xff0ea69f)
                            : const Color(0xff8d8d8d),
                      ),
                    ),
                    // onPressed:
                    // _termsAccepted
                    //     ? () async {
                    //         bool profile = false;
                    //         bool fileupload = false;
                    //         if (_formKey.currentState!.validate()) {
                    //           // Form is valid, proceed with submission
                    //           if (_profileImage != null) {
                    //             profile = true;
                    //           } else {
                    //             profile = false;
                    //             imageName = "0";
                    //           }
                    //           fileupload = files != null ? true : false;
                    //           await insertrecord();
                    //           if (profile) {
                    //             await uploadImage(_profileImage!);
                    //           }
                    //           if (fileupload) {
                    //             await uploadFile(files!);
                    //           }
                    //           //  print("Form submitted");
                    //         } else {
                    //           print("Form is invalid");
                    //         }
                    //       }
                    //     : null,
                    onPressed: () async {
                      await insertrecord();
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
              //   ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
