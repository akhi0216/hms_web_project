import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/controller/staff_list_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/radiology/controller/radiology_time_picker_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RadiologyBooking extends StatefulWidget {
  const RadiologyBooking({super.key});

  @override
  State<RadiologyBooking> createState() => _RadiologyBookingState();
}

class _RadiologyBookingState extends State<RadiologyBooking> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController phnumbercontroller = TextEditingController();
  final TextEditingController departmentcontroller = TextEditingController();
  final TextEditingController doctorcontroller = TextEditingController();
  final TextEditingController bookingCountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController patientidcontroller = TextEditingController();
  String? selectRadiologyType;
  String? docId;
  String phoneNumber = "";
  int? selectedindex;
  List doctorDetails = [];
  List<String> radiologyTypesList = [
    'CT Scan',
    'X-ray',
    'Ultra Sound',
  ];

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
    _dateController.dispose();
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    phnumbercontroller.dispose();
    super.dispose();
  }

  DateTime? picked;

  Future<void> _selectDate(
      {required BuildContext context,
      required RadiologyTimePickerController varprovider,
      required RadiologyTimePickerController functionprovider}) async {
    picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked!.toLocal()}".split(' ')[0];
      });
      if (selectRadiologyType != null) {
        await functionprovider.radiologyTimePicker(
            date: DateFormat("dd-MM-yyyy").format(picked!),
            dept: selectRadiologyType!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var bookingPatientFunctionController =
        Provider.of<BookingPatientController>(context, listen: false);
    var bookingPatientController =
        Provider.of<BookingPatientController>(context);

    var radiologyTimePickerProvider =
        Provider.of<RadiologyTimePickerController>(context);
    var radiologyTimePickerFunctionProvider =
        Provider.of<RadiologyTimePickerController>(context, listen: false);

    fieldSubmitted() async {
      bookingPatientController.doctorList.clear();
      bookingPatientController.deptList[0];
      bookingPatientController.patientBookingModel.list?.clear();
      await bookingPatientFunctionController
          .patientdata(patientidcontroller.text.trim());
      if (bookingPatientController.patientBookingModel.list == null ||
          bookingPatientController.patientBookingModel.list!.isEmpty) {
        _emailController.clear();
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
        setState(() {});

        firstnamecontroller.text =
            bookingPatientController.patientBookingModel.list?[0].fname ?? "";
        lastnamecontroller.text =
            bookingPatientController.patientBookingModel.list?[0].lname ?? "";
        _emailController.text =
            bookingPatientController.patientBookingModel.list?[0].email ?? "";
        phoneNumber =
            bookingPatientController.patientBookingModel.list?[0].phn ?? "";
        phnumbercontroller.text = bookingPatientController
                .patientBookingModel.list?[0].phn
                ?.replaceRange(0, 6, "******") ??
            "";
        departmentcontroller.text = 'Radiology';
        doctorcontroller.text =
            bookingPatientController.patientBookingModel.list?[0].doc ?? '';
        docId =
            bookingPatientController.patientBookingModel.list?[0].empid ?? '';
      }
      print(doctorcontroller.text);
      print(docId);
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
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                    onTap: () {},
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 20.0),
                  buildTextFormField(
                    controller: phnumbercontroller,
                    label: 'Mobile',
                    icon: Icons.phone,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter mobile number';
                      }
                      return null;
                    },
                    onTap: () {},
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 20.0),
                  buildTextFormField(
                    label: 'Department',
                    readOnly: true,
                    controller: departmentcontroller,
                    icon: Icons.local_hospital,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    onTap: () {
                      // //////////////////////////////
                      //
                    },
                  ),
                  const SizedBox(height: 20.0),
                  buildTextFormField(
                    label: 'Doctor',
                    readOnly: true,
                    controller: doctorcontroller,
                    icon: Icons.person,
                    validate: (value) {
                      return null;
                    },
                    onTap: () {},
                  ),
                  Visibility(
                    visible: selectRadiologyType != null ? true : false,
                    child: SizedBox(height: 20.0),
                  ),
                  Visibility(
                    visible: selectRadiologyType != null ? true : false,
                    child: buildTextFormField(
                      label: 'Booking Id',
                      readOnly: true,
                      controller: bookingCountController,
                      icon: Icons.numbers,
                      validate: (value) {
                        return null;
                      },
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  buildDropDownButton(
                    value: selectRadiologyType,
                    label: 'Select Type',
                    icon: Icons.scanner,
                    items: radiologyTypesList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) async {
                      setState(() {});
                      selectRadiologyType = newValue;
                      if (selectRadiologyType != null && picked != null) {
                        await radiologyTimePickerFunctionProvider
                            .radiologyTimePicker(
                                date: DateFormat("dd-MM-yyyy").format(picked!),
                                dept: selectRadiologyType!);
                      }
                      await radiologyTimePickerFunctionProvider.callBookingId(
                          dept: selectRadiologyType!);
                      setState(() {
                        bookingCountController.text =
                            radiologyTimePickerProvider.bookingId ?? '';
                      });
                    },
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a type';
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
                      _selectDate(
                          context: context,
                          varprovider: radiologyTimePickerProvider,
                          functionprovider:
                              radiologyTimePickerFunctionProvider);
                    },
                  ),
                  const SizedBox(height: 20.0),
                  Wrap(
                    children: List.generate(
                      picked != null && selectRadiologyType != null
                          ? radiologyTimePickerProvider.timeList.length
                          : 0,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            //
                            // print(selectedindex);
                            // print(varprovider.selectedtimeList[selectedindex!]);
                            //
                            // ------------------------------------------
                            radiologyTimePickerProvider.selectedtimeList
                                    .contains(index.toString())
                                ? setState(() {
                                    selectedindex = index;
                                  })
                                : setState(() {
                                    selectedindex = null;
                                  });
                            log(radiologyTimePickerProvider
                                .timeList[selectedindex!]);
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
                                    width: 3,
                                    color: radiologyTimePickerProvider
                                            .selectedtimeList
                                            .contains(index.toString())
                                        ? selectedindex == index
                                            ? ColorConstants.mainRed
                                            : ColorConstants.mainGreen
                                        : Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              child: Text(
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: radiologyTimePickerProvider
                                            .selectedtimeList
                                            .contains(index.toString())
                                        ? selectedindex == index
                                            ? ColorConstants.mainRed
                                            : ColorConstants.mainGreen
                                        : Colors.grey),
                                radiologyTimePickerProvider.timeList[index],
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
                        if (_formKey.currentState?.validate() ?? false) {
                          await bookingPatientFunctionController.patientBooking(
                            patientId: patientidcontroller.text.trim(),
                            fName: firstnamecontroller.text.trim(),
                            lName: lastnamecontroller.text.trim(),
                            eMail: _emailController.text.trim(),
                            phNum: phoneNumber,
                            dept: selectRadiologyType!,
                            docId: docId!,
                            reason: '',
                            date: _dateController.text.trim(),
                            time: radiologyTimePickerProvider
                                .timeList[selectedindex!],
                          );
                          bookingPatientController.isSuccessful == true
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
                                            _dateController.clear();
                                            firstnamecontroller.clear();
                                            lastnamecontroller.clear();
                                            phnumbercontroller.clear();
                                            // varprovider.deptList.clear();
                                            departmentcontroller.clear();
                                            selectRadiologyType = null;
                                            doctorcontroller.clear();
                                            bookingCountController.clear();
                                            bookingPatientController
                                                .doctorIdList
                                                .clear();
                                            bookingPatientController.doctorList
                                                .clear();
                                            bookingPatientController.timeList
                                                .clear();
                                            bookingPatientController
                                                .selectedtimeList
                                                .clear();
                                            selectedindex = null;
                                            picked = null;

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
