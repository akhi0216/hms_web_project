import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';

class CurrentStock extends StatefulWidget {
  const CurrentStock({super.key});

  @override
  State<CurrentStock> createState() => _CurrentStockState();
}

class _CurrentStockState extends State<CurrentStock> {
  List<String> stationaryItems = [
    // Basic Stationery Items
    "Pens",
    "Pencils",
    "Notebooks",
    "Sticky Notes",
    "Paper",
    "Folders",
    "Envelopes",
    "Binders",
    "Staplers and Staples",
    "Paper Clips",
    "Tape",
    "Glue",
    "Scissors",
    "Markers",
    "Erasers",
    "Rulers",
    "Punching Machines",
    "Labeling Machines",
    "Calculators",
    "Whiteboards and Markers",

    // Specialized Stationery for Hospitals
    "Patient File Folders",
    "Prescription Pads",
    "Chart Paper",
    "ID Cards and Badges",
    "Appointment Books",
    "Medical Forms",
    "NCR Paper",
    "Clipboards",
    "Labels and Tags",
    "Report Covers",
  ];
  List<String> searchedItems = [];

  @override
  void initState() {
    super.initState();
    searchedItems = stationaryItems;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width * .75,
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size.height * .05),
            Text("Current Stock"),
            SizedBox(height: size.height * .05),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (value) {
                print(value);
                setState(() {
                  searchedItems = stationaryItems.where(
                    (element) {
                      return element.toLowerCase().contains(value);
                    },
                  ).toList();
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: searchedItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 250),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(color: ColorConstants.mainBlack)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: ColorConstants.mainBlue,
                            image: DecorationImage(
                              image: AssetImage("assets/images/store.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(searchedItems[index])
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
