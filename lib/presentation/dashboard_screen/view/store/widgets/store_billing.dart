import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/model/store_model.dart';

class StoreBilling extends StatefulWidget {
  const StoreBilling({super.key});

  @override
  State<StoreBilling> createState() => _StoreBillingState();
}

class _StoreBillingState extends State<StoreBilling> {
  Store? selectedItem;
  late TextEditingController itemController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController fullAmountController = TextEditingController();

  // State variables for quantity and total amount
  int quantity = 1;
  double totalAmount = 0.0;

  double fullAmount = 0.0;

  String controllerValue = "";

  // List to keep track of added medicines
  final List<Map<String, dynamic>> addedItems = [];

  final List<Store> storeItems = [
    Store(name: "Pens", stock: 100, price: 7.0, gst: 18),
    Store(name: "Pencils", stock: 150, price: 3.0, gst: 18),
    Store(name: "Notebooks", stock: 200, price: 25.0, gst: 18),
    Store(name: "Sticky Notes", stock: 80, price: 12.0, gst: 18),
    Store(name: "Paper", stock: 500, price: 1.5, gst: 18),
    Store(name: "Folders", stock: 120, price: 18.0, gst: 18),
    Store(name: "Envelopes", stock: 150, price: 4.0, gst: 18),
    Store(name: "Binders", stock: 100, price: 30.0, gst: 18),
    Store(name: "Staplers and Staples", stock: 60, price: 40.0, gst: 18),
    Store(name: "Paper Clips", stock: 300, price: 0.7, gst: 18),
    Store(name: "Tape", stock: 200, price: 3.5, gst: 18),
    Store(name: "Glue", stock: 180, price: 10.0, gst: 18),
    Store(name: "Scissors", stock: 90, price: 15.0, gst: 18),
    Store(name: "Markers", stock: 140, price: 7.0, gst: 18),
    Store(name: "Erasers", stock: 160, price: 2.0, gst: 18),
    Store(name: "Rulers", stock: 130, price: 5.0, gst: 18),
    Store(name: "Punching Machines", stock: 50, price: 40.0, gst: 18),
    Store(name: "Labeling Machines", stock: 30, price: 50.0, gst: 18),
    Store(name: "Calculators", stock: 70, price: 60.0, gst: 18),
    Store(name: "Whiteboards and Markers", stock: 25, price: 170.0, gst: 18),

    // Specialized Stationery for Hospitals
    Store(name: "Patient File Folders", stock: 100, price: 15.0, gst: 18),
    Store(name: "Prescription Pads", stock: 200, price: 18.0, gst: 18),
    Store(name: "Chart Paper", stock: 50, price: 25.0, gst: 18),
    Store(name: "ID Cards and Badges", stock: 75, price: 12.0, gst: 18),
    Store(name: "Appointment Books", stock: 40, price: 20.0, gst: 18),
    Store(name: "Medical Forms", stock: 120, price: 10.0, gst: 18),
    Store(name: "NCR Paper", stock: 90, price: 7.0, gst: 18),
    Store(name: "Clipboards", stock: 110, price: 15.0, gst: 18),
    Store(name: "Labels and Tags", stock: 200, price: 5.0, gst: 18),
    Store(name: "Report Covers", stock: 70, price: 18.0, gst: 18),
  ];

  List<Store> showableStoreItems = [];

  @override
  void dispose() {
    itemController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _updateTotalAmount() {
    if (selectedItem != null) {
      setState(() {
        quantity = int.tryParse(_quantityController.text) ?? 0;
        totalAmount = (selectedItem!.price * quantity) +
            ((selectedItem!.price * quantity) * (selectedItem!.gst / 100));
      });
    } else {
      setState(() {
        quantity = 0;
        totalAmount = 0.0; 
      });
    }
  }

  void _addStoreItems() {
    if (selectedItem != null && quantity > 0) {
      setState(() {
        addedItems.add({
          'item': selectedItem!,
          'quantity': quantity,
          'totalAmount': totalAmount,
        });
        _updateTotalAmount();
        showableStoreItems.remove(selectedItem);
        fullAmount += totalAmount;
        fullAmountController.text = fullAmount.toString();
        // Clear the TextFormField values outside the blue container
        itemController.clear();
        _quantityController.clear();
        selectedItem = null;
        quantity = 0;
        totalAmount = 0.0;
        controllerValue = "";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    showableStoreItems = storeItems;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Container(
        width: size.width * .7,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.mainBlue, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    // width: size.width * .6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: const Text("Id:",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),

                            Expanded(
                              flex: 9,
                              child: Container(
                                // width: size.width * .15,
                                child: TextFormField(
                                  // controller: ,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.5),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 8),
                                    hintText: 'Enter Your patient id',
                                  ),
                                ),
                              ),
                            ),
                            // Spacer(),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: const Text("Name:",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),

                            Expanded(
                              flex: 9,
                              child: Container(
                                // width: size.width * .15,
                                child: TextFormField(
                                  // controller: ,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.5),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 8),
                                    hintText: 'Enter Your name',
                                  ),
                                ),
                              ),
                            ),
                            // Spacer(),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Address
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: const Text("Address:",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Expanded(
                              flex: 9,
                              child: Container(
                                // width: size.width * .15,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.5),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 8),
                                    hintText: 'Enter address',
                                  ),
                                ),
                              ),
                            ),
                            // Spacer(),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Phone Number
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: const Text("Mobile:",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                            // Spacer(),
                            Expanded(
                              flex: 9,
                              child: Container(
                                // width: size.width * .15,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.5),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 8),
                                    hintText: 'Enter phone number',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 10,
                //     ),
                //     child: Container(
                //       padding: const EdgeInsets.all(12),
                //       height: 150,
                //       // width: size.width * .4,
                //       decoration: BoxDecoration(
                //         border: Border.all(color: Colors.black, width: 2),
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(12)),
                //         color: Colors.white,
                //       ),
                //       child: Column(
                //         children: [
                //           Text(
                //             "Doctor prescription",
                //             style: TextStyle(
                //                 color: ColorConstants.mainBlue,
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.w600),
                //           ),
                //           TextFormField(
                //             decoration: InputDecoration(
                //                 border: OutlineInputBorder(
                //                     borderSide: BorderSide.none)),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Image
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: size.width * .07,
                    width: size.width * .07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(width: size.width * .02),
            SizedBox(height: size.height * .02),
            // Medicine Autocomplete
            Row(
              children: [
                const Text("Add Item:",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(width: 5),
                Expanded(
                  flex: 7,
                  child: Autocomplete<Store>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      // if (textEditingValue.text.isEmpty) {
                      //   return const Iterable<Medicine>.empty();
                      // } else {
                      return showableStoreItems.where((Store store) {
                        return store.name
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      }).toList();
                      // }
                    },
                    displayStringForOption: (Store store) {
                      controllerValue = store.name;
                      print(controllerValue);
                      return controllerValue;
                    },
                    onSelected: (Store store) {
                      setState(() {
                        selectedItem = store;
                        _quantityController.text = '1';
                        // quantity = 1;
                        _updateTotalAmount();
                        itemController
                            .clear(); // Clear the TextFormField after selection
                        _updateTotalAmount(); // Update total amount
                      });
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onEditingComplete) {
                      // _medicineController = controller;
                      return TextFormField(
                        controller: controller,
                        focusNode: focusNode,
                        onEditingComplete: onEditingComplete,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          hintText: 'Enter item name',
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 40),
                const Text("Quantity:",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(width: 5),
                Expanded(
                  flex: 3,
                  child: Container(
                    // width: 100,
                    child: TextFormField(
                      controller: _quantityController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        hintText: 'Enter quantity',
                      ),
                      onChanged: (value) {
                        _updateTotalAmount();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: _addStoreItems,
                  icon: Icon(Icons.add_circle, color: ColorConstants.mainBlue),
                )
              ],
            ),
            const SizedBox(height: 30),
            // Medicine Details Container
            if (selectedItem != null)
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConstants.mainBlue, width: 2),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Item Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.mainBlue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConstants.mainBlack, width: 1.5),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Text("Name: ${selectedItem!.name}"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConstants.mainBlack, width: 1.5),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Text("Stock: ${selectedItem!.stock}"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConstants.mainBlack, width: 1.5),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Text(
                                "Price: ${selectedItem!.price.toStringAsFixed(2)}"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConstants.mainBlack, width: 1.5),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Text("GST: ${selectedItem!.gst}%"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConstants.mainBlack, width: 1.5),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Text(
                                "Total: ${totalAmount.toStringAsFixed(2)}"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 10),
            // Added Medicines Details
            if (addedItems.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConstants.mainBlue, width: 2),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Text(
                          "Item Details",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.mainBlue,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ] +
                      addedItems.map((item) {
                        final items = item['item'] as Store;
                        final quantity = item['quantity'] as int;
                        final totalAmount = item['totalAmount'] as double;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstants.mainBlack,
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: Text("Name: ${items.name}"),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstants.mainBlack,
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: Text("Stock: ${items.stock}"),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstants.mainBlack,
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                      "Price: ${items.price.toStringAsFixed(2)}"),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstants.mainBlack,
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: Text("GST: ${items.gst}%"),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstants.mainBlack,
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                      "Total: ${totalAmount.toStringAsFixed(2)}"),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                ),
              ),
            const SizedBox(height: 30),
            // Discount and Total
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Total:",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(width: 5),
                Container(
                  width: 200,
                  child: TextFormField(
                      controller: fullAmountController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        // hintText: '${fullAmount.toStringAsFixed(2)}',
                        // readOnly: true,
                      )),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Submit Button
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Add your submit logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.mainBlue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorConstants.mainwhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
