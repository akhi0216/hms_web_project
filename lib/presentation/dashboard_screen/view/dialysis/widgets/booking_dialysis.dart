import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/image_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dialysis/controller/booking_dialysis_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DialysisBooking extends StatefulWidget {
  const DialysisBooking({super.key});

  @override
  State<DialysisBooking> createState() => _DialysisBookingState();
}

class _DialysisBookingState extends State<DialysisBooking> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController phnumbercontroller = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController patientidcontroller = TextEditingController();
  final TextEditingController departmentcontroller = TextEditingController();
  final TextEditingController doctorcontroller = TextEditingController();
  String? _selectedDoctor;
  String? _selectedOT;
  String? _selectedDoctorId;
  String? _selectedDepartment;
  String phoneNumber = "";

  bool isDateSelected = false;

  String? dates;
  int? selectedindex;

  callFuction() async {
    await Provider.of<BookingPatientController>(context, listen: false)
        .department();
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
    dateController.dispose();
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    phnumbercontroller.dispose();
    super.dispose();
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );
  //   if (picked != null) {
  //     setState(() {
  //       dateController.text = "${picked.toLocal()}".split(' ')[0];
  //     });
  //   }
  // }
  // Future<void> _selectDate(BuildContext context) async {
  //   DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );
  //   if (picked != null) {
  //     setState(() {
  //       functionproviderdialysis.departmentDialysis(DateFormat("dd-MM-yyyy").format(picked));
  //       // dateController.text = "${picked.toLocal()}".split(' ')[0];
  //     });
  //     // Provider.of<BookingDialysisController>(context)
  //     //     .departmentDialysis(dateController.text);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var functionproviderdialysis =
        Provider.of<BookingDialysisController>(context, listen: false);
    var varproviderdialysis = Provider.of<BookingDialysisController>(context);

    var functionprovider =
        Provider.of<BookingPatientController>(context, listen: false);
    var varprovider = Provider.of<BookingPatientController>(context);
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
        dateController.clear();
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
            varprovider.patientBookingModel.list?[0].fname ?? "";
        lastnamecontroller.text =
            varprovider.patientBookingModel.list?[0].lname ?? "";
        _emailController.text =
            varprovider.patientBookingModel.list?[0].email ?? "";

        doctorcontroller.text =
            varprovider.patientBookingModel.list?[0].doc ?? "";

        phoneNumber = varprovider.patientBookingModel.list?[0].phn ?? "";
        phnumbercontroller.text = varprovider.patientBookingModel.list?[0].phn
                ?.replaceRange(0, 6, "") ??
            "";
        _selectedDepartment = varprovider.patientBookingModel.list?[0].dep;
        await functionprovider.doctors(_selectedDepartment);
        _selectedDoctor = varprovider.doctorList[0];
        _selectedDoctorId = varprovider.doctorIdList[0];
      }
    }

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/dialysis.jpg",
            fit: BoxFit.cover,
            opacity: AlwaysStoppedAnimation(0.3),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * .7),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Container(
                      //       height: 300,
                      //       width: 300,
                      //       decoration: BoxDecoration(
                      //           image: DecorationImage(
                      //               image:
                      //                   AssetImage("assets/images/dialysis.jpg"))),
                      //     ),
                      //     Expanded(
                      //       child: Text(
                      //         "Manage and monitor dialysis sessions with ease. Track patient progress, schedule treatments, and ensure seamless care delivery.",
                      //         style: TextStyle(
                      //           fontSize: 24,
                      //           color: ColorConstants.mainOrange,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      // ----------------------
                      TextFormField(
                        controller: patientidcontroller,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          labelText: 'Patient Id',
                          prefixIcon: Icon(
                            Icons.person,
                            color: ColorConstants.mainBlue,
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
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
                      buildTextFormField(
                        label: 'Doctor',
                        controller: doctorcontroller,
                        icon: Icons.local_hospital,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                        onTap: () {},
                      ),
                      const SizedBox(height: 20.0),
                      // -------------------------------------------------------department
                      // buildTextFormField(
                      //   label: 'Dialysis',
                      //   readOnly: true,
                      //   controller: departmentcontroller,
                      //   icon: Icons.local_hospital,
                      //   validate: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter your address';
                      //     }
                      //     return null;
                      //   },
                      //   onTap: () {
                      //     // //////////////////////////////
                      //     //
                      //   },
                      // ),

                      const SizedBox(height: 20.0),
                      // buildTextFormField(
                      //   label: 'Date',
                      //   controller: dateController,
                      //   icon: Icons.calendar_today,
                      //   validate: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please select a date';
                      //     }
                      //     return null;
                      //   },
                      //   onTap: () => _selectDate(context),
                      // ),

                      // ----------------

                      // TextButton(
                      //     onPressed: () async {
                      //       DateTime? picked = await showDatePicker(
                      //         context: context,
                      //         initialDate: DateTime.now(),
                      //         firstDate: DateTime(2000),
                      //         lastDate: DateTime(2101),
                      //       );
                      //       if (picked != null) {
                      //         log("Selected date -> ${DateFormat("dd-MM-yyyy").format(picked)}");
                      //         functionproviderdialysis.departmentDialysis(
                      //             DateFormat("dd-MM-yyyy").format(picked));
                      //         // dateController.text = "${picked.toLocal()}".split(' ')[0];

                      //         // Provider.of<BookingDialysisController>(context)
                      //         //     .departmentDialysis(dateController.text);
                      //       }
                      //     },
                      //     child: Text("pick date")),

                      // ------------------------------------------

                      TextButton(
                        onPressed: () async {
                          DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (picked != null) {
                            log("Selected date -> ${DateFormat("dd-MM-yyyy").format(picked)}");
                            isDateSelected = true;
                            varproviderdialysis.selectedtimeList.clear();
                            await functionproviderdialysis.departmentDialysis(
                                DateFormat("dd-MM-yyyy").format(picked));
                            // dateController.text = "${picked.toLocal()}".split(' ')[0];
                          }
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: ColorConstants.mainBlue,
                          side: BorderSide(
                              color: ColorConstants.mainwhite, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text("Pick a Date"),
                      ),

                      // ------------------------------------------

                      const SizedBox(height: 20.0),

                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: List.generate(
                          isDateSelected
                              ? varproviderdialysis.timeList.length
                              : 0,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                varproviderdialysis.selectedtimeList.contains(
                                        varproviderdialysis.timeList[index])
                                    ? setState(() {
                                        selectedindex = index;
                                      })
                                    : setState(() {
                                        selectedindex = null;
                                      });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                child: Container(
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3,
                                          color: varproviderdialysis
                                                  .selectedtimeList
                                                  .contains(varproviderdialysis
                                                      .timeList[index])
                                              ? selectedindex == index
                                                  ? Colors.redAccent
                                                  : Colors.green
                                              : Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7))),
                                  child: Text(
                                      style: TextStyle(
                                          color: varproviderdialysis
                                                  .selectedtimeList
                                                  .contains(varproviderdialysis
                                                      .timeList[index])
                                              ? selectedindex == index
                                                  ? Colors.redAccent
                                                  : Colors.green
                                              : Colors.grey),
                                      varproviderdialysis.timeList[index]),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // buildDropDownButton(
                      //   label: 'Book Slots',
                      //   value: _selectedOT,
                      //   icon: Icons.local_hospital,
                      //   suffixIcon: null,
                      //   items: ['D 1', 'D 2', 'D 3', 'D 4'].map((String value) {
                      //     return DropdownMenuItem(
                      //         value: value, child: Text(value));
                      //   }).toList(),
                      //   onChanged: (newValue) {
                      //     setState(() {
                      //       _selectedOT = newValue;
                      //     });
                      //   },
                      //   validate: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please select a slot';
                      //     }
                      //     return null;
                      //   },
                      // ),

                      // ------------------------------------------------wrap

                      // ------------------------------------------------------------------------------------------
                      const SizedBox(height: 20.0),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isDateSelected = false;
                              varproviderdialysis.selectedtimeList.clear();
                              selectedindex = null;
                            });
                            if (_formKey.currentState?.validate() ?? false) {
                              // varproviderdialysis.isSuccessful == false
                              //     ?
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Dialysis slot booked"),
                                    actions: [
                                      TextButton(
                                        child: Text("return"),
                                        onPressed: () {
                                          firstnamecontroller.clear();
                                          patientidcontroller.clear();
                                          lastnamecontroller.clear();
                                          _emailController.clear();
                                          doctorcontroller.clear();
                                          // patientidcontroller.clear();
                                          // _emailController.clear();
                                          // _reasonController.clear();
                                          // dateController.clear();
                                          // firstnamecontroller.clear();
                                          // lastnamecontroller.clear();
                                          // phnumbercontroller.clear();

                                          // varprovider.doctorIdList
                                          //     .clear();
                                          // varprovider.doctorList.clear();
                                          // varprovider.timeList.clear();
                                          // varprovider.selectedtimeList
                                          //     .clear();
                                          // _selectedDepartment = null;
                                          // _selectedDoctor = null;
                                          // _selectedDoctorId = null;
                                          selectedindex = null;

                                          setState(() {});
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                },
                              );
                              // ----------------

                              // ---------------------
                              // : ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text('Dialysis not Booked'),
                              //       backgroundColor: ColorConstants.mainRed,
                              //     ),
                              //   );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Dialysis not Booked'),
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
        ),
      ],
    );
  }

// ----------------
  // Widget buildTextFormField({
  //   required String label,
  //   required TextEditingController controller,
  //   required IconData icon,
  //   required FormFieldValidator<String?> validate,
  //   required void Function()? onTap,
  //   // bool readOnly = false,
  // }) {
  //   var dialysisprovider = Provider.of<BookingDialysisController>(context);

  //   var dialysisfunction =
  //       Provider.of<BookingDialysisController>(context, listen: false);

  //   return TextFormField(
  //     controller: controller,
  //     // readOnly: false, // Make the field read-only if onTap is provided

  //     decoration: InputDecoration(
  //       contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
  //       labelText: label,
  //       prefixIcon: Icon(
  //         icon,
  //         color: ColorConstants.mainBlue,
  //       ),
  //       filled: true,
  //       fillColor: Colors.transparent,
  //       border: OutlineInputBorder(
  //         borderSide:
  //             BorderSide(color: const Color.fromARGB(255, 215, 210, 210)),
  //         borderRadius: BorderRadius.circular(8.0),
  //       ),
  //     ),
  //     validator: validate,
  //     // onTap: onTap,

  //     onChanged: (value) {
  //       print(value);
  //       // dialysisprovider.departmentDialysis(controller.text);
  //       dialysisfunction.departmentDialysis(controller.text);
  //     },
  //     // ----------
  //   );
  // }

// --------------
  Widget buildTextFormField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required String? Function(String?) validate,
    required VoidCallback onTap,
    bool readOnly = false,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: ColorConstants.mainBlue,
        ),
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: validate,
      onTap: onTap,
    );
  }

// ----------------------
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
        fillColor: Colors.transparent,
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
