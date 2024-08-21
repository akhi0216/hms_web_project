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
  TextEditingController dropdownController = TextEditingController();
  TextEditingController refNoController = TextEditingController();
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
    return Container(
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
                    'controller': dropdownController,
                  },
                  {
                    'name': 'Ref No',
                    'controller': refNoController,
                  },
                ], isTextBox: true),
              ],
            ),
          ),
        ],
      ),
    );
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
                      controller: textItem[index]['controller'])
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
    required TextEditingController controller,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: Text(textLabel)),
        Spacer(),
        Expanded(
            flex: 7,
            child: DropdownButtonFormField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              items: [
                DropdownMenuItem(child: Text("data"), value: "data"),
                DropdownMenuItem(child: Text("data1"), value: "data1"),
                DropdownMenuItem(child: Text("data2"), value: "data2"),
                DropdownMenuItem(child: Text("data3"), value: "data3"),
              ],
              onChanged: (value) {},
            ))
      ],
    );
  }
}
