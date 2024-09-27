import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dashboardscreen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewBookings extends StatefulWidget {
  const NewBookings({super.key});

  @override
  State<NewBookings> createState() => _NewBookingsState();
}

class _NewBookingsState extends State<NewBookings> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController phnumbercontroller = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController patientidcontroller = TextEditingController();
  String? _selectedDoctor;
  String? _selectedDoctorId;
  String? _selectedDepartment;
  String phoneNumber = "";
//
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
    _dateController.dispose();
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    phnumbercontroller.dispose();
    super.dispose();
  }

  DateTime? picked;

  Future<void> _selectDate(
      {required BuildContext context,
      required BookingPatientController varprovider,
      required BookingPatientController functionprovider}) async {
    picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text =
            DateFormat("yyyy-MM-dd").format(picked!.toLocal());
      });
    }
    selectingTimeslots(
        varprovider: varprovider, functionprovider: functionprovider);
  }

  selectingTimeslots(
      {required BookingPatientController varprovider,
      required BookingPatientController functionprovider}) async {
    int itemid = 0;
    for (var i = 0; i < varprovider.doctorList.length; i++) {
      if (varprovider.doctorList[i] == _selectedDoctor) {
        itemid = i;
      }
    }
    varprovider.timeList.clear();
    if (_dateController.text.isNotEmpty) {
      await functionprovider
          .doctorTime(varprovider.doctorsmodelclass.list?[itemid].empcode);
      await functionprovider.doctorTimeSlots(
        empid: varprovider.doctorsmodelclass.list?[itemid].empcode,
        dept: _selectedDepartment,
        date: DateFormat("dd-MM-yyyy").format(picked!.toLocal()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
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
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
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
                    await functionprovider.doctors(_selectedDepartment);

                    _selectedDoctor = varprovider.doctorList.isNotEmpty
                        ? varprovider.doctorList[0]
                        : null;
                    _selectedDoctorId = varprovider.doctorList.isNotEmpty
                        ? varprovider.doctorIdList[0]
                        : null;
                    selectingTimeslots(
                        varprovider: varprovider,
                        functionprovider: functionprovider);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
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
                  items: varprovider.doctorList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) async {
                    setState(() {
                      _selectedDoctor = newValue;
                    });
                    int itemid = 0;
                    for (var i = 0; i < varprovider.doctorList.length; i++) {
                      if (varprovider.doctorList[i] == _selectedDoctor) {
                        itemid = i;
                      }
                    }
                    _selectedDoctorId = varprovider.doctorIdList[itemid];
                    selectingTimeslots(
                        varprovider: varprovider,
                        functionprovider: functionprovider);
                    // _dateController.clear();
                    // picked = null;
                    // varprovider.timeList.clear();
                    // varprovider.selectedtimeList.clear();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a date';
                    }
                    return null;
                  },
                  readOnly: true,
                  onTap: () => _selectDate(
                      context: context,
                      functionprovider: functionprovider,
                      varprovider: varprovider),
                ),
                const SizedBox(height: 20.0),

                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text(
                //     "Book your slot",
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color(0xff0ea69f),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(8.0),
                //     ),
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 50.0, vertical: 15.0),
                //   ),
                // ),
                // const SizedBox(height: 20.0),
                // DropdownButtonFormField<String>(
                //   value: _selectedTimeSlot,
                //   hint: const Text('Select Time Slot'),
                //   decoration: InputDecoration(
                //     contentPadding:
                //         EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                //     filled: true,
                //     fillColor: Colors.white,
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8.0),
                //     ),
                //   ),
                //   items: varprovider.timeList.map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                //   onChanged: (newValue) {
                //     setState(() {
                //       _selectedTimeSlot = newValue;
                //     });
                //   },
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please select a time slot';
                //     }
                //     return null;
                //   },
                // ),
                //  -----------------------------------------------------------------------------
                // List.generate(
                //           doctorsList[index]['doctor_time'].length,
                //           (index2) {
                //             bool isSelected = selectedTimesList[index][
                //                     doctorsList[index]['doctor_time']
                //                         [index2]] ??
                //                 false; // Check if time is selected
                //             return InkWell(
                //               onTap: () {

                //               },
                //               child: Container(
                //                 padding: EdgeInsets.all(7),
                //                 decoration: BoxDecoration(
                //                   color: isSelected
                //                       ? Colors.red[700] // Selected color
                //                       : Colors.green, // Default color
                //                   border: Border.all(color: Colors.black),
                //                   borderRadius:
                //                       BorderRadius.all(Radius.circular(7)),
                //                 ),
                //                 child: Text(
                //                   doctorsList[index]['doctor_time'][index2],
                //                 ),
                //               ),
                //             );
                //           },
                //         ),
                Visibility(
                  visible: varprovider.timeList.isNotEmpty,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      timeSlotHelp(
                          fillColor: ColorConstants.selectedTextColor,
                          borderColor: ColorConstants.selectedTimeSlotColor,
                          label: "Available"),
                      timeSlotHelp(
                          fillColor: ColorConstants.selectedTimeSlotColor,
                          borderColor: ColorConstants.selectedTimeSlotColor,
                          label: "Selected"),
                      timeSlotHelp(
                          fillColor: ColorConstants.bookedTimeSlotColor,
                          borderColor: ColorConstants.bookedTimeSlotColor,
                          label: "Booked"),
                    ],
                  ),
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
                              color: varprovider.selectedtimeList
                                      .contains(index.toString())
                                  ? selectedindex == index
                                      ? ColorConstants.selectedTimeSlotColor
                                      : ColorConstants.transparent
                                  : ColorConstants.bookedTimeSlotColor,
                              // color: isSelected
                              //     ? Colors.red[700] // Selected color
                              //     : Colors.green, // Default color
                              border: Border.all(
                                  width: 3,
                                  color: varprovider.selectedtimeList
                                          .contains(index.toString())
                                      ? selectedindex == index
                                          ? ColorConstants.selectedTimeSlotColor
                                          : ColorConstants.selectedTimeSlotColor
                                      : ColorConstants.bookedTimeSlotColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                            child: Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: varprovider.selectedtimeList
                                          .contains(index.toString())
                                      ? selectedindex == index
                                          ? ColorConstants.selectedTextColor
                                          : ColorConstants.selectedTimeSlotColor
                                      : ColorConstants.selectedTextColor),
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
                      if (_formKey.currentState?.validate() ?? false) {
                        await functionprovider.patientBooking(
                          patientId: patientidcontroller.text.trim(),
                          fName: firstnamecontroller.text.trim(),
                          lName: lastnamecontroller.text.trim(),
                          eMail: _emailController.text.trim(),
                          phNum: phoneNumber,
                          dept: _selectedDepartment!,
                          docId: _selectedDoctorId!,
                          reason: _reasonController.text.trim(),
                          date: _dateController.text.trim(),
                          // timeeee
                          time: varprovider.timeList[selectedindex!],
                        );
                        varprovider.isSuccessful == true
                            ? showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title:
                                        Text("You are successfully appointed"),
                                    actions: [
                                      TextButton(
                                        child: Text("Back"),
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
                                          varprovider.selectedtimeList.clear();
                                          _selectedDepartment = null;
                                          _selectedDoctor = null;
                                          _selectedDoctorId = null;
                                          selectedindex = null;

                                          setState(() {});
                                          Navigator.pop(context);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    // HomeDashboard(),=====================================================
                                                    Dashboardsecondscreen(
                                                        userName: "Avanzo",
                                                        empId: "001",
                                                        des: "Admin"),
                                              ));
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
    );
  }

  Widget timeSlotHelp(
      {required Color fillColor,
      required Color borderColor,
      required String label}) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: fillColor,
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        SizedBox(width: 10),
        Text(label),
      ],
    );
  }
}
