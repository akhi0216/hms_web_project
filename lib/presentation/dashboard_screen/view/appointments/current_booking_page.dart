import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CurrentBookingPage extends StatefulWidget {
  const CurrentBookingPage({super.key});

  @override
  State<CurrentBookingPage> createState() => _CurrentBookingPageState();
}

class _CurrentBookingPageState extends State<CurrentBookingPage> {
  // List of doctor names

  String? _selectedDepartment;

  // Map of doctor name and his/her times

  // Map to track selected times for each row

  @override
  void initState() {
    super.initState();
    // Initialize the maps with all times set to false (not selected)
    callFuction();
  }

  callFuction() async {
    await Provider.of<BookingPatientController>(context, listen: false)
        .department();
  }

  @override
  void dispose() {
    Provider.of<BookingPatientController>(context).listOfDoctors.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the current date
    DateTime now = DateTime.now();
    // Format the date
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    var functionprovider =
        Provider.of<BookingPatientController>(context, listen: false);
    var varprovider = Provider.of<BookingPatientController>(context);
    Size size = MediaQuery.sizeOf(context);

    return SingleChildScrollView(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        border: Border.all(color: Colors.black)),
                    child: Text(
                      "$formattedDate",
                      style: TextStyle(color: ColorConstants.mainBlue),
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: DropdownButtonFormField<String>(
                      value: _selectedDepartment,
                      hint: const Text(' Department'),
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
                        // varprovider.listOfTimeList.clear();
                        // varprovider.listOfSelectedTimeList.clear();
                        // await functionprovider.doctors(_selectedDepartment);
                        // await functionprovider.listOfTimes(
                        //     varprovider.doctorsmodelclass, _selectedDepartment);
                        // setState(() {});
                        // print(varprovider.listOfTimeList);
                        await functionprovider.listOfTimes(
                            dept: _selectedDepartment,
                            date: DateTime.now().toString());
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a department';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                itemCount: varprovider.listOfDoctors.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            varprovider.listOfDoctors[index]['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(Icons.more_vert),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 5,
                          child: Wrap(
                            spacing: 8.0, // gap between adjacent chips
                            runSpacing: 4.0, // gap between lines
                            children: List.generate(
                              varprovider
                                  .listOfDoctors[index]['timeslots'].length,
                              (index2) {
                                bool isSelected = varprovider
                                    .listOfDoctors[index]['selectedtimes']
                                    .contains(index2.toString());
                                // print(isSelected);
                                return InkWell(
                                  onTap: () {
                                    // setState(() {
                                    //   selectedTimesList[index]
                                    //           [varprovider.timeList[index2]] =
                                    //       !isSelected; // Toggle selection
                                    // });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      // Default color
                                      border: Border.all(
                                        color: isSelected
                                            ? Colors.green
                                            : Colors.grey,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7)),
                                    ),
                                    child: Text(
                                      varprovider.listOfDoctors[index]
                                          ['timeslots'][index2],
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.green
                                            : Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
