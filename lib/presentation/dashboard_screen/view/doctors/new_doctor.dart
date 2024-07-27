import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_doctor_controller.dart';
import 'package:provider/provider.dart';

class NewDoctor extends StatefulWidget {
  const NewDoctor({super.key});

  @override
  State<NewDoctor> createState() => _NewDoctorState();
}

class _NewDoctorState extends State<NewDoctor> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
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
  final _preferredWorkHoursController = TextEditingController();
  final _availabilityOnCallController = TextEditingController();
  final _preferredLocationsController = TextEditingController();

  String _gender = 'Male';
  String _nationality = 'United States';
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
    _fullNameController.dispose();
    _dobController.dispose();
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
    _preferredWorkHoursController.dispose();
    _availabilityOnCallController.dispose();
    _preferredLocationsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var varProvider = Provider.of<NewDoctorController>(context);
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
                    'Full Name', Icons.person, _fullNameController),
                buildDatePickerFormField(
                    'Date of Birth', Icons.calendar_today, _dobController),
                buildGenderRadioButtons(),
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
                buildTextFormField('Preferred Work Hours', Icons.access_time,
                    _preferredWorkHoursController),
                buildTextFormField('Availability for On-call', Icons.call,
                    _availabilityOnCallController),
                buildTextFormField('Preferred Locations', Icons.location_on,
                    _preferredLocationsController),
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
