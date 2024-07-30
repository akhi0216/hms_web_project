import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_doctor_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/patients/new_patient_reg.dart';
import 'package:provider/provider.dart';

class NewDoctor extends StatefulWidget {
  const NewDoctor({super.key});

  @override
  State<NewDoctor> createState() => _NewDoctorState();
}

class _NewDoctorState extends State<NewDoctor> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dobController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _residentialAddressController = TextEditingController();
  final _medicalLicenseNumberController = TextEditingController();
  final _medicalSchoolController = TextEditingController();
  final _yearOfGraduationController = TextEditingController();
  final _residencyInfoController = TextEditingController();
  final _boardCertificationsController = TextEditingController();
  final _currentPositionController = TextEditingController();
  final _currentEmployerController = TextEditingController();
  final _previousPositionsController = TextEditingController();
  final _yearsOfExperienceController = TextEditingController();
  final _availabilityOnCallController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();

  String _gender = 'Male';
  String _nationality = 'India';
  String _onCall = "Yes";
  String _specialty = 'Cardiology'; // Default value for the dropdown

  @override
  void initState() {
    super.initState();
    callFuction();
  }

  callFuction() async {
    await Provider.of<NewDoctorController>(context, listen: false).department();
  }

  @override
  void dispose() {
    _dobController.dispose();
    _titleController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _contactNumberController.dispose();
    _emailController.dispose();
    _residentialAddressController.dispose();
    _medicalLicenseNumberController.dispose();
    _medicalSchoolController.dispose();
    _yearOfGraduationController.dispose();
    _residencyInfoController.dispose();
    _boardCertificationsController.dispose();
    _currentPositionController.dispose();
    _currentEmployerController.dispose();
    _previousPositionsController.dispose();
    _yearsOfExperienceController.dispose();
    _availabilityOnCallController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var varProvider = Provider.of<NewDoctorController>(context);
    var functionProvider =
        Provider.of<NewDoctorController>(context, listen: false);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
      child: Center(
        child: SizedBox(
          width: 600, // Adjust the width as needed
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                sectionHeader('Personal Information'),
                buildTextFormField(
                    'First Name', Icons.person, _firstNameController),
                buildTextFormField(
                    'Last Name', Icons.person, _lastNameController),
                buildDatePickerFormField(
                    'Date of Birth', Icons.calendar_today, _dobController),
                buildGenderRadioButtons(),
                buildDropdownFormField(
                  'Nationality',
                  _nationality,
                  [
                    'India',
                    'United States',
                    'Canada',
                    'United Kingdom',
                    'Australia'
                  ],
                  (String? newValue) {
                    setState(() {
                      _nationality = newValue!;
                    });
                  },
                  Icons.flag,
                ),
                buildTextFormField(
                    'Contact Number', Icons.phone, _contactNumberController),
                buildTextFormField(
                    'Email Address', Icons.email, _emailController),
                buildTextFormField('Residential Address', Icons.home,
                    _residentialAddressController),
                sectionHeader('Professional Information'),
                buildTextFormField('Medical License Number', Icons.article,
                    _medicalLicenseNumberController),
                buildDropdownFormField(
                  'Department',
                  _specialty,
                  varProvider.deptList,
                  (String? newValue) {
                    setState(() {
                      _specialty = newValue!;
                    });
                  },
                  Icons.local_hospital,
                ),
                buildTextFormField('Medical School Attended',
                    Icons.account_balance, _medicalSchoolController),
                buildTextFormField('Year of Graduation', Icons.calendar_today,
                    _yearOfGraduationController),
                buildTextFormField('Residency Information', Icons.work,
                    _residencyInfoController),
                buildTextFormField('Board Certifications', Icons.book,
                    _boardCertificationsController),
                sectionHeader('Work Experience'),
                buildTextFormField('Current Position/Title', Icons.badge,
                    _currentPositionController),
                buildTextFormField('Current Employer/Practice Name',
                    Icons.business, _currentEmployerController),
                buildTextFormField('Previous Positions/Employers',
                    Icons.work_history, _previousPositionsController),
                buildTextFormField('Years of Experience', Icons.access_time,
                    _yearsOfExperienceController),
                sectionHeader('Availability'),
                buildTextFormField(
                    'Starting time', Icons.access_time, _startTimeController),
                buildTextFormField(
                    'Ending time', Icons.access_time, _endTimeController),
                buildDropdownFormField(
                  'Availability on call',
                  _onCall,
                  ['Yes', 'No'],
                  (String? newValue) {
                    setState(() {
                      _onCall = newValue!;
                    });
                  },
                  Icons.call,
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        functionProvider.newDocReg(
                            title: _titleController.text
                                .trim()
                                .toString()
                                .toString(),
                            firstName: _firstNameController.text
                                .trim()
                                .toString()
                                .toString(),
                            lastName: _lastNameController.text.trim(),
                            dob: _dobController.text.trim().toString(),
                            gender: _gender.toString(),
                            nationality: _nationality.toString(),
                            mobile:
                                _contactNumberController.text.trim().toString(),
                            email: _emailController.text.trim().toString(),
                            resAddress: _residentialAddressController.text
                                .trim()
                                .toString(),
                            medLicNumber: _medicalLicenseNumberController.text
                                .trim()
                                .toString(),
                            department: _specialty.toString(),
                            medSchool:
                                _medicalSchoolController.text.trim().toString(),
                            gradYear: _yearOfGraduationController.text
                                .trim()
                                .toString(),
                            resInfo:
                                _residencyInfoController.text.trim().toString(),
                            board: _boardCertificationsController.text
                                .trim()
                                .toString(),
                            currentPos: _currentPositionController.text
                                .trim()
                                .toString(),
                            currentEmp: _currentEmployerController.text
                                .trim()
                                .toString(),
                            previousPos: _previousPositionsController.text
                                .trim()
                                .toString(),
                            yearOfExp: _yearsOfExperienceController.text
                                .trim()
                                .toString(),
                            startTime:
                                _startTimeController.text.trim().toString(),
                            endTime: _endTimeController.text.trim().toString(),
                            onCall: _onCall.toString());
                      }
                    },
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
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

  Widget buildTextFormField(
      String label, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
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

  Widget buildDatePickerFormField(
      String label, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
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
            setState(() {
              controller.text = "${pickedDate.toLocal()}".split(' ')[0];
            });
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select $label';
          }
          return null;
        },
      ),
    );
  }
}
