import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:intl/intl.dart';

class CurrentBookingPage extends StatefulWidget {
  const CurrentBookingPage({super.key});

  @override
  State<CurrentBookingPage> createState() => _CurrentBookingPageState();
}

class _CurrentBookingPageState extends State<CurrentBookingPage> {
  // List of times
  final List<String> times = [
    '9-9.30',
    '9.30-10',
    '10-10.30',
    '10.30-11',
    '11-11.30',
    '11.30-12',
    '12-12.30',
    '2-2.30',
    '2.30-3',
    '3-3.30',
    '3.30-4'
  ];

  // List of doctor names
  final List<String> doctors = [
    'Dr. Smith',
    'Dr. Johnson',
    'Dr. Brown',
    'Dr. Williams',
    'Dr. Jones',
    'Dr. Davis',
    'Dr. Garcia'
  ];

  // Map to track selected times for each row
  List<Map<String, bool>> selectedTimesList = List.generate(7, (_) => {});

  @override
  void initState() {
    super.initState();
    // Initialize the maps with all times set to false (not selected)
    for (int i = 0; i < selectedTimesList.length; i++) {
      for (String time in times) {
        selectedTimesList[i][time] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the current date
    DateTime now = DateTime.now();
    // Format the date
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // First row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      // color: ColorConstants.mainOrange,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      border: Border.all(color: Colors.black)),
                  child: Text(
                    "$formattedDate",
                    style: TextStyle(color: ColorConstants.mainBlue),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          // color: ColorConstants.mainOrange,
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          border: Border.all(color: Colors.black)),
                      child: Text(
                        "Department",
                        style: TextStyle(color: ColorConstants.mainBlue),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.sync))
                  ],
                )
              ],
            ),
            // SizedBox(
            //   height: 10,
            // ),

            // End of first row

            // Doctor rows
            for (int i = 0; i < doctors.length; i++) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(doctors[i]),
                  // SizedBox(
                  //   width: 20,
                  // ),
                  for (String time in times) ...[
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedTimesList[i][time] =
                              !selectedTimesList[i][time]!;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: selectedTimesList[i][time]!
                              ? Colors.green
                              : Colors.transparent,
                          border: Border.all(color: ColorConstants.mainBlue),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Text(
                          time,
                          style: TextStyle(color: ColorConstants.mainBlack),
                        ),
                      ),
                    )
                  ],
                ],
              ),
              Divider(),
              SizedBox(height: 15),
            ],
          ],
        ),
      ),
    );
  }
}
