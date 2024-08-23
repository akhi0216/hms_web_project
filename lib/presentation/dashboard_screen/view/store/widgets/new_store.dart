import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';

class NewStore extends StatefulWidget {
  const NewStore({super.key});

  @override
  State<NewStore> createState() => _NewStoreState();
}

class _NewStoreState extends State<NewStore> {
  List<TextEditingController> purchaseController = List.generate(
    6,
    (index) => TextEditingController(),
  );
  List<TextEditingController> itemQuantityController = List.generate(
    8,
    (index) => TextEditingController(),
  );
  List<TextEditingController> itemAmountController = List.generate(
    8,
    (index) => TextEditingController(),
  );
  List<TextEditingController> itemDiscController = List.generate(
    8,
    (index) => TextEditingController(),
  );
  List<String> itemQuantityTitle = [
    'Quantity',
    'Less Qty.',
    'Free',
    'Act. Qty.',
    'Shortage',
    'Pur. Total',
    'Pur. Disc.',
    'Pur. DisAmt.',
  ];
  List<String> itemAmountTitle = [
    'Amount',
    'Act P Rate',
    'Net. Pur',
    'Pur. Rate',
    'MRP',
    'Pro.Amt',
    'Pu. Prof',
    'Pur. GST%',
  ];
  List<String> itemDiscTitle = [
    'Disc%',
    'Disc. Amt.',
    'Prof%',
    'Ret Price',
    '%Less',
    'Crd. Price',
    '%Less',
    'Wh Sale',
  ];
  TextEditingController itemController = TextEditingController();
  TextEditingController batchController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController hsnsacController = TextEditingController();
  List<Map<String, dynamic>> firstColumnList = [];
  List<Map<String, dynamic>> secondColumnList = [];
  List<Map<String, dynamic>> thirdColumnList = [];
  newStore() {
    firstColumnList = [
      {
        'name': 'Supplier',
        'controller': purchaseController[0],
      },
      {
        'name': 'Goods Rec.',
        'controller': purchaseController[1],
      },
      {
        'name': 'Purchase Order',
        'controller': purchaseController[2],
      },
    ];
    secondColumnList = [
      {
        'name': 'Invoice no.',
        'controller': purchaseController[3],
      },
      {
        'name': 'Inv. Date',
        'controller': purchaseController[4],
      },
      {
        'name': 'GSTIN',
        'controller': purchaseController[5],
      },
    ];
  }

  @override
  void initState() {
    super.initState();
    newStore();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorConstants.mainBlue),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  firstRowColumns(textItem: firstColumnList),
                  SizedBox(width: 20),
                  firstRowColumns(textItem: secondColumnList),
                  SizedBox(width: 20),
                  firstRowColumns(textItem: [
                    {
                      'name': 'Store',
                      'selectedItem': 'data',
                    },
                    {
                      'name': 'Ref No',
                      'selectedItem': 'data',
                    },
                  ], isTextBox: true),
                ],
              ),
            ),
            Divider(),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildDropDown(textLabel: "Category", itemList: [
                        DropdownMenuItem(
                            child: Text("Category"), value: "Category"),
                        DropdownMenuItem(
                            child: Text("Category1"), value: "Category1"),
                        DropdownMenuItem(
                            child: Text("Category2"), value: "Category2"),
                        DropdownMenuItem(
                            child: Text("Category3"), value: "Category3"),
                      ]),
                      SizedBox(height: 10),
                      buildDropDown(textLabel: "Receipt no.", itemList: [
                        DropdownMenuItem(
                            child: Text("Receipt no."), value: "Receipt no."),
                        DropdownMenuItem(
                            child: Text("Receipt no.1"), value: "Receipt no.1"),
                      ]),
                      SizedBox(height: 10),
                      buildTextField(
                          textLabel: "Item", controller: itemController),
                      SizedBox(height: 10),
                      buildDropDown(textLabel: "Unit", itemList: [
                        DropdownMenuItem(child: Text("Unit"), value: "Unit"),
                        DropdownMenuItem(child: Text("Unit1"), value: "Unit1"),
                      ]),
                      SizedBox(height: 10),
                      buildTextField(
                          textLabel: "Batch", controller: batchController),
                      SizedBox(height: 10),
                      buildTextField(
                          textLabel: "Expiry", controller: expiryController),
                      SizedBox(height: 10),
                      buildTextField(
                          textLabel: "HSN/SAC", controller: hsnsacController),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      itemQuantityController.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: buildTextField(
                              textLabel: itemQuantityTitle[index],
                              controller: itemQuantityController[index]),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      itemAmountTitle.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: buildTextField(
                              textLabel: itemAmountTitle[index],
                              controller: itemAmountController[index]),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      itemDiscTitle.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: buildTextField(
                              textLabel: itemDiscTitle[index],
                              controller: itemDiscController[index]),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Row(
                  children: [
                    buttonCall(label: "Insert"),
                    buttonCall(label: "Clear"),
                    buttonCall(label: "Delete"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonCall({required String label}) {
    return ElevatedButton(onPressed: () {}, child: Text(label));
  }

  Widget firstRowColumns(
      {required List<Map<String, dynamic>> textItem, bool isTextBox = false}) {
    return Expanded(
      flex: 4,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(textItem.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: isTextBox
                  ? buildDropDown(
                      textLabel: textItem[index]['name'],
                      itemList: [
                          DropdownMenuItem(child: Text("data"), value: "data"),
                          DropdownMenuItem(
                              child: Text("data1"), value: "data1"),
                          DropdownMenuItem(
                              child: Text("data2"), value: "data2"),
                          DropdownMenuItem(
                              child: Text("data3"), value: "data3"),
                        ])
                  : buildTextField(
                      textLabel: textItem[index]['name'],
                      controller: textItem[index]['controller']),
            );
          })),
    );
  }

  Widget buildTextField({
    required String textLabel,
    required TextEditingController controller,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: Text(textLabel)),
        Spacer(),
        Expanded(
          flex: 7,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        )
      ],
    );
  }

  Widget buildDropDown({
    required String textLabel,
    String? selectedItem,
    required List<DropdownMenuItem<String>> itemList,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: Text(
              textLabel,
            )),
        Spacer(),
        Expanded(
          flex: 7,
          child: DropdownButtonFormField<String>(
            value: selectedItem,
            hint: const Text('Select item'),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            items: itemList,
            onChanged: (newValue) async {
              setState(() {
                selectedItem = newValue!;
              });
            },
            // ----------------------validator
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please select a department';
            //   }
            //   return null;
            // },
          ),
        )
      ],
    );
  }
}
