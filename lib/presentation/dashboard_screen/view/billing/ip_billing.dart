import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';

class IpBilling extends StatefulWidget {
  @override
  _IpBillingState createState() => _IpBillingState();
}

class _IpBillingState extends State<IpBilling> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _sexController = TextEditingController();
  final _ipNoController = TextEditingController();
  final _roomNoController = TextEditingController();
  final _admissionDateController = TextEditingController();
  final _dischargeDateController = TextEditingController();

  List<List<TextEditingController>> table1Controllers =
      List.generate(4, (_) => List.generate(4, (_) => TextEditingController()));
  final List<List<TextEditingController>> table2Controllers =
      List.generate(4, (_) => List.generate(3, (_) => TextEditingController()));
  final List<List<TextEditingController>> table3Controllers =
      List.generate(4, (_) => List.generate(3, (_) => TextEditingController()));
  final List<List<TextEditingController>> table4Controllers =
      //
      List.generate(5, (_) => List.generate(6, (_) => TextEditingController()));
  final List<List<TextEditingController>> table5Controllers =
      List.generate(4, (_) => List.generate(1, (_) => TextEditingController()));
  final List<List<TextEditingController>> table6Controllers =
      List.generate(4, (_) => List.generate(8, (_) => TextEditingController()));
  final List<List<TextEditingController>> table7Controllers =
      List.generate(3, (_) => List.generate(4, (_) => TextEditingController()));
  final List<List<TextEditingController>> table8Controllers =
      List.generate(4, (_) => List.generate(8, (_) => TextEditingController()));
  final List<List<TextEditingController>> table9Controllers =
      List.generate(4, (_) => List.generate(6, (_) => TextEditingController()));
  final List<List<TextEditingController>> table10Controllers =
      List.generate(3, (_) => List.generate(8, (_) => TextEditingController()));
  final List<List<TextEditingController>> table11Controllers =
      List.generate(8, (_) => List.generate(6, (_) => TextEditingController()));

  final List<List<TextEditingController>> table12Controllers =
      List.generate(7, (_) => List.generate(2, (_) => TextEditingController()));

  final List<List<TextEditingController>> table13Controllers =
      List.generate(7, (_) => List.generate(3, (_) => TextEditingController()));

  final List<List<TextEditingController>> table14Controllers =
      List.generate(7, (_) => List.generate(2, (_) => TextEditingController()));
  final List<List<TextEditingController>> table15Controllers =
      List.generate(7, (_) => List.generate(2, (_) => TextEditingController()));
  final List<List<TextEditingController>> table16Controllers =
      List.generate(7, (_) => List.generate(3, (_) => TextEditingController()));

  final List<List<TextEditingController>> table17Controllers =
      List.generate(8, (_) => List.generate(6, (_) => TextEditingController()));

  final _totalXRAYController = TextEditingController();
  final _totalCTScanController = TextEditingController();
  final _totalUSGController = TextEditingController();
  final _totalDialysisController = TextEditingController();
  final _totalABGController = TextEditingController();
  final _totalGRBSController = TextEditingController();
  final _totalNEBULIZATIONController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width * .2,
          height: size.height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: ColorConstants.mainBlue,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Column(
            children: [
              Container(
                width: size.width * .199,
                color: ColorConstants.mainwhite,
                child: Image.asset(
                  "assets/images/highlandlogo-removebg-preview.png",
                ),
              ),
              SizedBox(height: size.height * .01),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * .05),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    TextFormField(
                      controller: _ageController,
                      decoration: InputDecoration(labelText: 'Age'),
                    ),
                    TextFormField(
                      controller: _sexController,
                      decoration: InputDecoration(labelText: 'Sex'),
                    ),
                    TextFormField(
                      controller: _ipNoController,
                      decoration: InputDecoration(labelText: 'IP No.'),
                    ),
                    TextFormField(
                      controller: _roomNoController,
                      decoration: InputDecoration(labelText: 'Room No.'),
                    ),
                    TextFormField(
                      controller: _admissionDateController,
                      decoration:
                          InputDecoration(labelText: 'Date of Admission'),
                    ),
                    TextFormField(
                      controller: _dischargeDateController,
                      decoration:
                          InputDecoration(labelText: 'Date of Discharge'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '1. WARD TRANSFERS (to be filled by nurses)',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTable(
                      titles: ['Date & Time', 'From', 'To', 'Name'],
                      controllers: table1Controllers,
                    ),
                    SizedBox(height: 20),
                    Text(
                      '2. ICU CARE (to be filled by nurses)',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTableWithSecondColumnText(
                      titles: ['Date & Time', ' ', 'Date & Time', 'Name'],
                      controllers: table2Controllers,
                      secondColumnText: 'till',
                    ),
                    SizedBox(height: 20),
                    Text(
                      '3. POR CARE (to be filled by nurses)',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTableWithSecondColumnText(
                      titles: ['Date & Time', ' ', 'Date & Time', 'Name'],
                      controllers: table3Controllers,
                      secondColumnText: 'till',
                    ),
                    SizedBox(height: 20),
                    Text(
                      '4. OT BILL DETAILS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTable(
                      titles: [
                        'Date',
                        'Bill No.',
                        'Name (of staff)',
                        'Date',
                        'Bill No.',
                        'Name (of staff)'
                      ],
                      controllers: table4Controllers,
                    ),
                    SizedBox(height: 20),
                    Text(
                      '5. SURGICAL/IMPLANT/OTHER BILLS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTable(
                      titles: [''],
                      controllers: table5Controllers,
                    ),
                    SizedBox(height: 20),
                    Text(
                      '6. X-RAY',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTable(
                      titles: [
                        'Date',
                        'Amount',
                        'Date',
                        'Amount',
                        'Date',
                        'Amount',
                        'Date',
                        'Amount'
                      ],
                      controllers: table6Controllers,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Total: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _totalXRAYController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      '7. CT SCAN',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTable(
                      titles: ['Date', 'Amount', 'Date', 'Amount'],
                      controllers: table7Controllers,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Total: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _totalCTScanController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      '8. USG',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTable(
                      titles: [
                        'Date',
                        'Amount',
                        'Date',
                        'Amount',
                        'Date',
                        'Amount',
                        'Date',
                        'Amount'
                      ],
                      controllers: table8Controllers,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Total: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _totalUSGController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      '9. DIALYSIS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTable(
                      titles: [
                        'Date',
                        'Amount',
                        'Date',
                        'Amount',
                        'Date',
                        'Amount'
                      ],
                      controllers: table9Controllers,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Total: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _totalDialysisController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      '10. ABG',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTable(
                      titles: [
                        'Date',
                        'Amount',
                        'Date',
                        'Amount',
                        'Date',
                        'Amount',
                        'Date',
                        'Amount'
                      ],
                      controllers: table10Controllers,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Total: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _totalABGController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      '11. GRBS',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTable(
                      titles: [
                        'Date',
                        'Amount',
                        'Date',
                        'Amount',
                        'Date',
                        'Amount'
                      ],
                      controllers: table11Controllers,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Total: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _totalGRBSController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      '12. OXYGEN',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTable(
                      titles: [
                        'Starting date and time',
                        'Ending date and time'
                      ],
                      controllers: table12Controllers,
                    ),
                    SizedBox(height: 20),
                    Text(
                      '13. NIV/BIPAP',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTable(
                      titles: [
                        'Starting date and time',
                        'Ending date and time',
                        'Name'
                      ],
                      controllers: table13Controllers,
                    ),
                    SizedBox(height: 20),
                    Text(
                      '14. SYRINGE PUMP',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTable(
                      titles: [
                        'Starting date and time',
                        'Ending date and time'
                      ],
                      controllers: table14Controllers,
                    ),
                    SizedBox(height: 20),
                    Text(
                      '15. VENTILATOR',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTable(
                      titles: [
                        'Starting date and time',
                        'Ending date and time'
                      ],
                      controllers: table15Controllers,
                    ),
                    SizedBox(height: 20),
                    Text(
                      '16. CARDIAC MONITOR (NIBP)',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTable(
                      titles: [
                        'Starting date and time',
                        'Ending date and time',
                        'Name'
                      ],
                      controllers: table16Controllers,
                    ),
                    SizedBox(height: 20),
                    Text(
                      '17. NEBULIZATION',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    buildTable(
                      titles: [
                        'Date',
                        'Quantity',
                        'Date',
                        'Quantity',
                        'Date',
                        'Quantity',
                        'Date',
                        'Quantity'
                      ],
                      controllers: table17Controllers,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Total: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _totalNEBULIZATIONController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Process form data here
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTable({
    required List<String> titles,
    List<List<TextEditingController>>? controllers,
  }) {
    int numColumns = titles.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Table(
          border: TableBorder.all(),
          columnWidths: {
            for (int i = 0; i < numColumns; i++) i: FlexColumnWidth(),
          },
          children: [
            TableRow(
              children: titles.map((title) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    titles.isEmpty ? "#" : title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
            ),
            ...controllers?.map((rowControllers) {
                  int difference = numColumns - rowControllers.length;
                  List<Widget> row = rowControllers.map((textController) {
                    return Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: TextFormField(
                        controller: textController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    );
                  }).toList();
                  if (difference > 0) {
                    for (int i = 0; i < difference; i++) {
                      row.add(Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(),
                      ));
                    }
                  }
                  return TableRow(children: row);
                }).toList() ??
                []
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement print functionality here
              },
              child: Text('Print'),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildTableWithSecondColumnText({
    required List<String> titles,
    required List<List<TextEditingController>> controllers,
    required String secondColumnText,
  }) {
    int numColumns = titles.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Table(
          border: TableBorder.all(),
          columnWidths: {
            for (int i = 0; i < numColumns; i++) i: FlexColumnWidth(),
          },
          children: [
            TableRow(
              children: titles.map((title) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    titles.isEmpty ? "#" : title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
            ),
            ...controllers.map((rowControllers) {
              int difference = numColumns - rowControllers.length;
              List<Widget> row = rowControllers.map((textController) {
                return Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.all(8.0),
                    ),
                  ),
                );
              }).toList();
              row.insert(
                1,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text(secondColumnText)),
                ),
              );
              if (difference > 1) {
                for (int i = 0; i < difference; i++) {
                  row.add(Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(),
                  ));
                }
              }
              return TableRow(children: row);
            }).toList(),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement print functionality here
              },
              child: Text('Print'),
            ),
          ],
        ),
      ],
    );
  }
}
