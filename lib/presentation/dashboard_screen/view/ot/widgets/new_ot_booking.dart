import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/controller/staff_list_controller.dart';
import 'package:provider/provider.dart';

class NewOtBooking extends StatefulWidget {
  const NewOtBooking({super.key});

  @override
  State<NewOtBooking> createState() => _NewOtBookingState();
}

class _NewOtBookingState extends State<NewOtBooking> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController phnumbercontroller = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController patientidcontroller = TextEditingController();
  String? _selectedDoctor;
  String? _selectedOT;
  String? _selectedDoctorId;
  String? _selectedDepartment;
  String phoneNumber = "";
//
  int? selectedindex;
  List doctorDetails = [];

  callFuction() async {
    await Provider.of<BookingPatientController>(context, listen: false)
        .department();
    await Provider.of<StaffListController>(context, listen: false).department();
    await Provider.of<StaffListController>(context, listen: false)
        .staffListFunction();
  }

  @override
  void initState() {
    super.initState();
    callFuction();
  }

  @override
  void dispose() {
    patientidcontroller.dispose();
    _emailController.dispose();
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

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  List<Map<String, dynamic>> _filteredOptions = [];
  List<Map<String, dynamic>> doctorsList = [];

  void _showOverlay({required StaffListController listOfDoctorsProvider}) {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          width: MediaQuery.of(context).size.width - 32,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: const Offset(0.0, 40.0), // Position below the text field
            child: Material(
              elevation: 4.0,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 200,
                ),
                child: ListView.builder(
                  itemCount: _filteredOptions.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => ListTile(
                    leading: Icon(Icons.person),
                    title: Row(
                      children: [
                        Expanded(child: Text(_filteredOptions[index]['doc'])),
                        Expanded(child: Text(_filteredOptions[index]['dept'])),
                      ],
                    ),
                    onTap: () {
                      String currentText = _controller.text;
                      // If the current text contains a comma, keep only what's before the last comma
                      int lastCommaIndex = currentText.trim().lastIndexOf(',');
                      if (lastCommaIndex != -1) {
                        _controller.text =
                            currentText.substring(0, lastCommaIndex + 1);
                      } else {
                        _controller
                            .clear(); // If there's no comma, clear everything
                      }
                      // If the text field is not empty (i.e., previous selections), ensure the new option is added after a comma
                      if (_controller.text.isNotEmpty) {
                        if (!_controller.text.trim().endsWith(',')) { 
                          _controller.text += ', ';
                        }
                        _controller.text +=
                            ' ${_filteredOptions[index]['doc']}, ';
                      } else {
                        _controller.text +=
                            '${_filteredOptions[index]['doc']}, ';
                      }
                      // print(_filteredOptions[index]['doc']);
                      doctorsList.remove(_filteredOptions[index]);
                      _hideOverlay();
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _filterOptions(String input, StaffListController listOfDoctorsProvider) {
    setState(() {
      _filteredOptions = doctorsList
          .where((option) => option['doc']
              .toLowerCase()
              .contains(input.split(', ').removeLast().trim().toLowerCase()))
          .toList();
      _overlayEntry?.markNeedsBuild(); // Rebuild the overlay
    });
  }

  @override
  Widget build(BuildContext context) {
    var functionprovider =
        Provider.of<BookingPatientController>(context, listen: false);
    var varprovider = Provider.of<BookingPatientController>(context);

    var listOfDoctorsProvider = Provider.of<StaffListController>(context);

    fieldSubmitted() async {
      varprovider.doctorList.clear();
      varprovider.deptList[0];
      varprovider.timeList.clear();
      varprovider.patientBookingModel.list?.clear();
      await functionprovider.patientdata(patientidcontroller.text.trim());
      if (varprovider.patientBookingModel.list == null ||
          varprovider.patientBookingModel.list!.isEmpty) {
        _emailController.clear();
        _reasonController.clear();
        _dateController.clear();
        firstnamecontroller.clear();
        lastnamecontroller.clear();
        phnumbercontroller.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No patient found'),
            backgroundColor: ColorConstants.mainRed,
          ),
        );
      } else {
        doctorsList =
            Provider.of<StaffListController>(context, listen: false).staffList;
        setState(() {});

        firstnamecontroller.text =
            varprovider.patientBookingModel.list?[0].fname ?? "";
        lastnamecontroller.text =
            varprovider.patientBookingModel.list?[0].lname ?? "";
        _emailController.text =
            varprovider.patientBookingModel.list?[0].email ?? "";
        phoneNumber = varprovider.patientBookingModel.list?[0].phn ?? "";
        phnumbercontroller.text = varprovider.patientBookingModel.list?[0].phn
                ?.replaceRange(0, 6, "******") ??
            "";
        _selectedDepartment = varprovider.patientBookingModel.list?[0].dep;
        await functionprovider.doctors(_selectedDepartment);
        _selectedDoctor = varprovider.doctorList[0];
        _selectedDoctorId = varprovider.doctorIdList[0];
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * .7),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: patientidcontroller,
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
                          await fieldSubmitted();
                        },
                        icon: const Icon(
                          Icons.check,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    onFieldSubmitted: (value) async {
                      await fieldSubmitted();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter a Valid Patient Id';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  buildTextFormField(
                    label: 'First Name',
                    controller: firstnamecontroller,
                    icon: Icons.person_outline,
                    validate: (name) => name!.length < 3
                        ? "Name should be at least 3 characters"
                        : null,
                    onTap: () {},
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 20.0),
                  buildTextFormField(
                    label: 'Last Name',
                    controller: lastnamecontroller,
                    icon: Icons.person_outline,
                    validate: (name) => null, onTap: () {},
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 20.0),
                  buildTextFormField(
                    label: 'Email',
                    controller: _emailController,
                    icon: Icons.email,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    onTap: () {},
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 20.0),
                  buildDropDownButton(
                    value: _selectedDepartment,
                    label: 'Select Department',
                    icon: Icons.local_hospital,
                    suffixIcon: null,
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
                      int itemid = 0;
                      await functionprovider.doctors(_selectedDepartment);

                      _selectedDoctor = varprovider.doctorList.isNotEmpty
                          ? varprovider.doctorList[0]
                          : null;
                      _selectedDoctorId = varprovider.doctorList.isNotEmpty
                          ? varprovider.doctorIdList[0]
                          : null;
                      for (var i = 0; i < varprovider.doctorList.length; i++) {
                        if (varprovider.doctorList[i] == _selectedDoctor) {
                          itemid = i;
                        }
                      }
                      await functionprovider.doctorTime(
                          varprovider.doctorsmodelclass.list?[itemid].empcode);
                      await functionprovider.doctorTimeSlots(
                        empid:
                            varprovider.doctorsmodelclass.list?[itemid].empcode,
                        dept: _selectedDepartment,
                        // _dateController.text.trim()
                      );
                    },
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a department';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  buildDropDownButton(
                    value: _selectedDoctor,
                    label: 'Select Doctor',
                    icon: Icons.local_hospital,
                    suffixIcon: TextButton(
                        onPressed: () {},
                        child: const Text("check availability")),
                    items: varprovider.doctorList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) async {
                      int itemid = 0;
                      setState(() {
                        _selectedDoctor = newValue;
                      });
                      for (var i = 0; i < varprovider.doctorList.length; i++) {
                        if (varprovider.doctorList[i] == _selectedDoctor) {
                          itemid = i;
                        }
                      }
                      varprovider.timeList.clear();
                      await functionprovider.doctorTime(
                          varprovider.doctorsmodelclass.list?[itemid].empcode);
                      await functionprovider.doctorTimeSlots(
                        empid:
                            varprovider.doctorsmodelclass.list?[itemid].empcode,
                        dept: _selectedDepartment,
                        // _dateController.text.trim()
                      );
                      _selectedDoctorId = varprovider.doctorIdList[itemid];
                    },
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a doctor';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  CompositedTransformTarget(
                      link: _layerLink,
                      child: buildTextFormField(
                        label: 'Enter Assistant Doctors',
                        controller: _controller,
                        readOnly:
                            varprovider.patientBookingModel.list?[0].fname ==
                                    null
                                ? true
                                : false,
                        icon: Icons.people,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select doctors';
                          }
                          return null;
                        },
                        // onTapOutside: (event) {
                        //   _hideOverlay();
                        // },
                        onChanged: (value) {
                          setState(() {});
                          // print(value.trim().split(',').last.trim());
                          if (value.trim().split(',').last.trim().isNotEmpty) {
                            if (_overlayEntry == null) {
                              _showOverlay(
                                  listOfDoctorsProvider: listOfDoctorsProvider);
                            }
                            _filterOptions(value, listOfDoctorsProvider);
                          } else {
                            _hideOverlay();
                          }
                        },
                        onTap: () {
                          if (_controller.text.isNotEmpty &&
                              !_controller.text.trim().endsWith(',')) {
                            _showOverlay(
                                listOfDoctorsProvider: listOfDoctorsProvider);
                          }
                        },
                      )
                      // TextField(
                      //   controller: _controller,
                      //   focusNode: _focusNode,
                      //   decoration: InputDecoration(labelText: 'Enter name'),
                      // onChanged: (value) {
                      //   setState(() {});
                      //   print(value.trim().split(',').last.trim());

                      //   if (value.trim().split(',').last.trim().isNotEmpty) {
                      //     if (_overlayEntry == null) {
                      //       _showOverlay();
                      //     }
                      //     _filterOptions(value);
                      //   } else {
                      //     _hideOverlay();
                      //   }
                      // },
                      //   onTap: () {
                      //     if (_controller.text.isNotEmpty &&
                      //         !_controller.text.trim().endsWith(',')) {
                      //       _showOverlay();
                      //     }
                      //   },
                      // ),
                      ),
                  const SizedBox(height: 20.0),
                  buildDropDownButton(
                    label: 'OT Number',
                    value: _selectedOT,
                    icon: Icons.local_hospital,
                    suffixIcon: null,
                    items: ['OT 1', 'OT 2', 'OT 3', 'OT 4'].map((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedOT = newValue;
                      });
                    },
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a doctor';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  buildTextFormField(
                    label: 'Date',
                    controller: _dateController,
                    icon: Icons.timer,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a date';
                      }
                      return null;
                    },
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
                  const SizedBox(height: 20.0),
                  Wrap(
                    children: List.generate(
                      varprovider.timeList.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            //
                            // print(selectedindex);
                            // print(varprovider.selectedtimeList[selectedindex!]);
                            //
                            // ------------------------------------------
                            varprovider.selectedtimeList
                                    .contains(index.toString())
                                ? setState(() {
                                    selectedindex = index;
                                  })
                                : setState(() {
                                    selectedindex = null;
                                  });
                            log(varprovider.timeList[selectedindex!]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            child: Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                // color:
                                // index == selectedindex
                                //     ? Colors.grey
                                //     : Colors.green,
                                // color: isSelected
                                //     ? Colors.red[700] // Selected color
                                //     : Colors.green, // Default color
                                border: Border.all(
                                    width: 2,
                                    color: varprovider.selectedtimeList
                                            .contains(index.toString())
                                        ? selectedindex == index
                                            ? Colors.green
                                            : Colors.black
                                        : Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              child: Text(
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: varprovider.selectedtimeList
                                            .contains(index.toString())
                                        ? selectedindex == index
                                            ? Colors.green
                                            : Colors.black
                                        : Colors.grey),
                                varprovider.timeList[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // ------------------------------------------------------------------------------------------
                  const SizedBox(height: 20.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        print(_selectedDoctorId);
                        print(_selectedDoctor);
                        if (_formKey.currentState?.validate() ?? false) {
                          // await functionprovider.patientBooking(
                          //   patientId: patientidcontroller.text.trim(),
                          //   fName: firstnamecontroller.text.trim(),
                          //   lName: lastnamecontroller.text.trim(),
                          //   eMail: _emailController.text.trim(),
                          //   phNum: phoneNumber,
                          //   dept: _selectedDepartment!,
                          //   docId: _selectedDoctorId!,
                          //   reason: _reasonController.text.trim(),
                          //   date: _dateController.text.trim(),
                          //   // timeeee
                          //   time: varprovider.timeList[selectedindex!],
                          // );
                          varprovider.isSuccessful == true
                              ? showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                          "You are successfully appointed"),
                                      actions: [
                                        TextButton(
                                          child: Text("return"),
                                          onPressed: () {
                                            patientidcontroller.clear();
                                            _emailController.clear();
                                            _reasonController.clear();
                                            _dateController.clear();
                                            firstnamecontroller.clear();
                                            lastnamecontroller.clear();
                                            phnumbercontroller.clear();
                                            // varprovider.deptList.clear();
                                            varprovider.doctorIdList.clear();
                                            varprovider.doctorList.clear();
                                            varprovider.timeList.clear();
                                            varprovider.selectedtimeList
                                                .clear();
                                            _selectedDepartment = null;
                                            _selectedDoctor = null;
                                            _selectedDoctorId = null;
                                            selectedindex = null;

                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  },
                                )
                              : ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Appointment not Booked'),
                                    backgroundColor: ColorConstants.mainRed,
                                  ),
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

  Widget buildTextFormField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required FormFieldValidator<String?> validate,
    void Function()? onTap,
    ValueChanged? onChanged,
    TapRegionCallback? onTapOutside,
    FocusNode? focusNode,
    bool readOnly = true,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      focusNode: focusNode,
      onTap: onTap,
      onChanged: onChanged,
      onTapOutside: onTapOutside,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: ColorConstants.mainBlue,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: validate,
    );
  }

  buildDropDownButton({
    required String label,
    required String? value,
    required IconData icon,
    required Widget? suffixIcon,
    required List<DropdownMenuItem<String>>? items,
    required ValueChanged<String?> onChanged,
    required FormFieldValidator<String?> validate,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(label),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: ColorConstants.mainBlue,
        ),
        suffix: suffixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      items: items,
      onChanged: onChanged,
      validator: validate,
    );
  }
}
