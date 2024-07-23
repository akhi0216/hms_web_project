// ------------------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:provider/provider.dart';

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

  List<String> _doctorList = [];

  final List<String> _timeSlots = [];

  @override
  void initState() {
    super.initState();
    callFuction();
  }

  callFuction() async {
    await Provider.of<BookingPatientController>(context, listen: false)
        .department();
  }

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
    var functionprovider =
        Provider.of<BookingPatientController>(context, listen: false);
    var varprovider = Provider.of<BookingPatientController>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 600),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      labelText: 'Patient Id',
                      prefixIcon: Icon(
                        Icons.person,
                        color: ColorConstants.mainBlue,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          await functionprovider
                              .patientdata(_nameController.text.trim());
                          firstnamecontroller.text =
                              varprovider.patientBookingModel.list?[0].fname ??
                                  "";
                          lastnamecontroller.text =
                              varprovider.patientBookingModel.list?[0].lname ??
                                  "";
                          _addressController.text =
                              varprovider.patientBookingModel.list?[0].addr ??
                                  "";
                          phnumbercontroller.text =
                              varprovider.patientBookingModel.list?[0].phn ??
                                  "";
                          _selectedDepartment =
                              varprovider.patientBookingModel.list?[0].dep ??
                                  "";
                          _selectedDoctor =
                              varprovider.patientBookingModel.list?[0].doc ??
                                  "";
                          _reasonController.text =
                              varprovider.patientBookingModel.list?[0].presc ??
                                  "";
                        },
                        icon: const Icon(
                          Icons.check,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter a Valid Patient Id';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
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
                    validator: (name) => name!.length < 3
                        ? "Name should be at least 3 characters"
                        : null,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 20.0),
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
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      labelText: 'Address',
                      prefixIcon: Icon(
                        Icons.home,
                        color: ColorConstants.mainBlue,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: phnumbercontroller,
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
                    validator: (value) {
                      if (value != null && value.length >= 7) {
                        return null;
                      } else {
                        return "Mobile number is required";
                      }
                    },
                  ),
                  const SizedBox(height: 20.0),
                  DropdownButtonFormField<String>(
                    value: _selectedDepartment,
                    hint: const Text('Select Department'),
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
                      await Provider.of<BookingPatientController>(context,
                              listen: false)
                          .doctors(_selectedDepartment);
                      _doctorList.clear();
                      if (varprovider.doctorsmodelclass.list!.isNotEmpty) {
                        for (var i = 0;
                            i < varprovider.doctorsmodelclass.list!.length;
                            i++) {
                          _doctorList.add(
                              varprovider.doctorsmodelclass.list?[i].name ??
                                  "");
                        }
                      } else {
                        _doctorList.add("no doctors found");
                      }
                      _selectedDoctor = _doctorList[0];
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a department';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  DropdownButtonFormField<String>(
                    value: _selectedDoctor,
                    hint: const Text('Select Doctor'),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.medical_services,
                        color: ColorConstants.mainBlue,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      suffix: TextButton(
                          onPressed: () {},
                          child: const Text("check availability")),
                      filled: true,
                      fillColor: Colors.white,
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
                    onChanged: (newValue) async {
                      setState(() {
                        _selectedDoctor = newValue;
                      });
                      await Provider.of<BookingPatientController>(context,
                              listen: false)
                          .doctors(_selectedDepartment);
                      _timeSlots.clear();
                      _timeSlots.add(
                          varprovider.doctorsmodelclass.list?[0].time ?? ""); 
                      // for (var i = 0;
                      //     i < _doctorList.length;
                      //     i++) {
                      //   _timeSlots.add(
                      //       varprovider.doctorsmodelclass.list?[i].time ??
                      //           "");
                      // }
                      setState(() {
                        _selectedTimeSlot = _timeSlots[0];
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a doctor';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _reasonController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      labelText: 'Reason (Optional)',
                      prefixIcon: Icon(
                        Icons.edit,
                        color: ColorConstants.mainBlue,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      labelText: 'Date',
                      prefixIcon: Icon(
                        Icons.timer,
                        color: ColorConstants.mainBlue,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    readOnly: true,
                    onTap: () => _selectDate(context),
                  ),
                  const SizedBox(height: 20.0),
                  DropdownButtonFormField<String>(
                    value: _selectedTimeSlot,
                    hint: const Text('Select Time Slot'),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      filled: true,
                      fillColor: Colors.white,
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
                  const SizedBox(height: 20.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Implement appointment booking functionality here
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Appointment Booked')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0ea69f),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 15.0),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
