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
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              _buildTextFormField(
                controller: patientidcontroller,
                label: "Patient ID",
                icon: Icons.person,
              ),
              SizedBox(height: 15),
              _buildTextFormField(
                controller: firstnamecontroller,
                label: "First Name",
                icon: Icons.person_outline,
              ),
              SizedBox(height: 15),
              _buildTextFormField(
                controller: lastnamecontroller,
                label: "Last Name",
                icon: Icons.person_outline,
              ),
              SizedBox(height: 15),
              _buildTextFormField(
                controller: _addressController,
                label: "Address",
                icon: Icons.home,
              ),
              SizedBox(height: 15),
              _buildTextFormField(
                controller: phnumbercontroller,
                label: "Phn No.",
                icon: Icons.phone,
              ),
              SizedBox(height: 15),
              _buildDropdownButtonFormField(
                value: _selectedDepartment,
                label: 'Select Department',
                icon: Icons.local_hospital,
                items: _departmentList,
                onChanged: (newValue) {
                  setState(() {
                    _selectedDepartment = newValue;
                  });
                },
              ),
              SizedBox(height: 15),
              _buildDropdownButtonFormField(
                value: _selectedDoctor,
                label: 'Select Doctor',
                icon: Icons.medical_services,
                items: _doctorList,
                onChanged: (newValue) {
                  setState(() {
                    _selectedDoctor = newValue;
                  });
                },
              ),
              SizedBox(height: 15),
              _buildTextFormField(
                controller: _reasonController,
                label: "Reason (optional)",
                icon: Icons.edit,
              ),
              SizedBox(height: 15),
              _buildTextFormField(
                controller: _dateController,
                label: "Preferred Date",
                icon: Icons.calendar_today,
                onTap: () => _selectDate(context),
                readOnly: true,
              ),
              SizedBox(height: 15),
              _buildDropdownButtonFormField(
                value: _selectedTimeSlot,
                label: 'Preferred Time Slot',
                icon: Icons.timer,
                items: _timeSlots,
                onChanged: (newValue) {
                  setState(() {
                    _selectedTimeSlot = newValue;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool readOnly = false,
    void Function()? onTap,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0),),
        prefixIcon: Icon(
          icon,
          color: ColorConstants.mainBlue,
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(12.0)),
        //    borderSide: BorderSide(color: ColorConstants.mainBlue, width: 2.0),
        //  ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(12.0)),
        //   borderSide: BorderSide(color: ColorConstants.mainBlue, width: 2.0),
        // ),
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      ),
      style: TextStyle(color: Colors.black, fontSize: 16.0),
    );
  }

  Widget _buildDropdownButtonFormField({
    required String? value,
    required String label,
    required IconData icon,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(label),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: ColorConstants.mainBlue,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return 'Please select a $label';
        }
        return null;
      },
    );
  }
}
