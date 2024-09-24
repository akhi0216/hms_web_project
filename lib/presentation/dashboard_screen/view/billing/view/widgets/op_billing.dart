import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/controller/billing_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/billing/model/billing_model.dart';
// import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/billing_pharmacy/model/bill_pharmacy.dart';
import 'package:provider/provider.dart';

class OpBilling extends StatefulWidget {
  const OpBilling({super.key});

  @override
  State<OpBilling> createState() => _OpBillingState();
}

class _OpBillingState extends State<OpBilling> {
  SampleBillingApimodel? selectedMedicine;
  final TextEditingController _medicineController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController fullAmountController = TextEditingController();
  late TextEditingController medicineController = TextEditingController();

  List<SampleBillingApimodel> showableMedicines = [];

  // State variables for quantity and total amount
  int quantity = 1;
  double totalAmount = 0.0;

  double fullAmount = 0.0;
  String controllerValue = "";

  // List to keep track of added medicines
  List<Map<String, dynamic>> addedMedicines = [];
  // final List<Medicine> items = [
  //   Medicine(name: 'Dietician', price: 100.0, gst: 18, stock: 50),
  //   Medicine(name: 'Sterile Gloves', price: 5.0, gst: 12, stock: 200),
  //   Medicine(name: 'Un-Sterile Gloves', price: 3.0, gst: 12, stock: 150),
  //   Medicine(name: 'Cotton Roll', price: 20.0, gst: 5, stock: 100),
  //   Medicine(name: 'Gauze Piece', price: 2.0, gst: 5, stock: 300),
  //   Medicine(name: 'Pad', price: 15.0, gst: 12, stock: 120),
  //   Medicine(name: 'Gauze Roll', price: 25.0, gst: 5, stock: 80),
  //   Medicine(name: 'Bath', price: 100.0, gst: 18, stock: 30),
  //   Medicine(name: 'Extra Bed Sheets', price: 150.0, gst: 12, stock: 60),
  //   Medicine(name: 'Extra Pillows', price: 80.0, gst: 12, stock: 70),
  //   Medicine(name: 'Extra Bed', price: 3000.0, gst: 18, stock: 10),
  //   Medicine(name: 'Extra Attender', price: 500.0, gst: 18, stock: 20),
  //   Medicine(name: 'IV cannulalization', price: 50.0, gst: 12, stock: 90),
  //   Medicine(name: 'Catheterisation', price: 70.0, gst: 12, stock: 40),
  //   Medicine(name: 'Spirit', price: 10.0, gst: 5, stock: 200),
  //   Medicine(name: 'Saline', price: 15.0, gst: 5, stock: 180),
  //   Medicine(name: 'Eusol', price: 12.0, gst: 5, stock: 120),
  //   Medicine(name: 'Ether', price: 20.0, gst: 12, stock: 100),
  //   Medicine(name: 'Betadine', price: 30.0, gst: 12, stock: 90),
  //   Medicine(name: 'Small Dressing', price: 25.0, gst: 5, stock: 60),
  //   Medicine(name: 'Minor Dressing', price: 50.0, gst: 5, stock: 40),
  //   Medicine(name: 'Major Dressing', price: 100.0, gst: 18, stock: 30),
  //   Medicine(name: '2" Bandage', price: 10.0, gst: 5, stock: 200),
  //   Medicine(name: '4" Bandage', price: 15.0, gst: 5, stock: 180),
  //   Medicine(name: '6" Bandage', price: 20.0, gst: 5, stock: 160),
  //   Medicine(name: 'Stapler Pin', price: 5.0, gst: 12, stock: 250),
  //   Medicine(name: 'Dynaplast', price: 8.0, gst: 12, stock: 230),
  //   Medicine(name: 'Suturing Set', price: 120.0, gst: 18, stock: 15),
  //   Medicine(name: 'S. R. Set', price: 150.0, gst: 18, stock: 10),
  //   Medicine(name: 'Razor Blade', price: 3.0, gst: 12, stock: 300),
  //   Medicine(name: 'Surgical Blade', price: 10.0, gst: 12, stock: 250),
  //   Medicine(name: 'Skin Preparation', price: 50.0, gst: 18, stock: 70),
  //   Medicine(name: 'Blood Transfusion', price: 500.0, gst: 18, stock: 20),
  //   Medicine(name: 'Catheter Care', price: 40.0, gst: 12, stock: 60),
  //   Medicine(name: 'Mouth Care', price: 30.0, gst: 5, stock: 80),
  //   Medicine(name: 'Back Care', price: 50.0, gst: 12, stock: 50),
  //   Medicine(name: 'Tracheostomy Care', price: 70.0, gst: 18, stock: 30),
  //   Medicine(name: 'Bowel Wash', price: 20.0, gst: 12, stock: 100),
  //   Medicine(name: 'Bladder Wash', price: 20.0, gst: 12, stock: 90),
  //   Medicine(name: 'Enema & Evacuation', price: 30.0, gst: 12, stock: 60),
  //   Medicine(name: 'Sitz Bath', price: 80.0, gst: 18, stock: 20),
  //   Medicine(name: 'Stomach Wash', price: 100.0, gst: 18, stock: 15),
  //   Medicine(name: 'Suction', price: 60.0, gst: 12, stock: 50),
  //   Medicine(name: 'Ryles Tube Insertion', price: 25.0, gst: 5, stock: 80),
  //   Medicine(name: 'Steam Inhalation', price: 50.0, gst: 12, stock: 70),
  //   Medicine(name: 'Death Care', price: 1000.0, gst: 18, stock: 5),
  //   Medicine(name: 'Mortuary Sheet', price: 200.0, gst: 12, stock: 30),
  //   Medicine(name: 'Ambulance', price: 1000.0, gst: 18, stock: 8),
  //   Medicine(name: 'Glass', price: 10.0, gst: 12, stock: 300),
  // ];

  @override
  void initState() {
    super.initState();
    fetchData();

    _quantityController.addListener(() {
      final text = _quantityController.text;
      if (text.isNotEmpty) {
        final number = int.tryParse(text);
        if (number != null &&
            number > num.parse(selectedMedicine?.stock ?? "0")) {
          _quantityController.text = selectedMedicine!.stock.toString();
          _quantityController.selection = TextSelection.fromPosition(
            TextPosition(offset: _quantityController.text.length),
          );
        }
      }
    });
  }

  fetchData() async {
    await Provider.of<BillingController>(context, listen: false)
        .supplimentaries();
    showableMedicines = List<SampleBillingApimodel>.from(
        Provider.of<BillingController>(context, listen: false).items);
    print(showableMedicines);
  }
  // -------------------------------------------------------------------

  // @override
  // void initState() {
  //   super.initState();
  //   showableMedicines = items;
  //   _quantityController.addListener(() {
  //     final text = _quantityController.text;
  //     if (text.isNotEmpty) {
  //       final number = int.tryParse(text);
  //       if (number != null) {
  //         _quantityController.selection = TextSelection.fromPosition(
  //           TextPosition(offset: _quantityController.text.length),
  //         );
  //       }
  //     }
  //   });
  // }

  // ----------------------------------------------------------------------
// int.parse(price)
  void _updateTotalAmount() {
    if (selectedMedicine != null) {
      setState(() {
        quantity = int.tryParse(_quantityController.text) ?? 0;
        totalAmount =
            (double.parse(selectedMedicine!.price ?? "0") * quantity) +
                ((double.parse(selectedMedicine!.price ?? "0") * quantity) *
                    (double.parse(selectedMedicine!.price ?? "0") / 100));
      });
    } else {
      setState(() {
        quantity = 0;
        totalAmount = 0.0;
      });
    }
  }

  // -----------------------------------
  // void _updateTotalAmount() {
  //   if (selectedMedicine != null) {
  //     setState(() {
  //       quantity = int.tryParse(_quantityController.text) ?? 0;
  //       totalAmount = (selectedMedicine!.price * quantity) +
  //           ((selectedMedicine!.price * quantity) *
  //               (selectedMedicine!.gst / 100));
  //     });
  //   } else {
  //     setState(() {
  //       quantity = 0;
  //       totalAmount = 0.0;
  //     });
  //   }
  // }

  // ---------------------------------------

  void _addMedicine() {
    if (selectedMedicine != null && quantity > 0) {
      setState(() {
        // Add the selected medicine details to the list
        addedMedicines.add({
          'medicine': selectedMedicine!,
          'quantity': quantity,
          'totalAmount': totalAmount,
        });

        // Update the fullAmount
        fullAmount += totalAmount;

        // Update the controller text
        fullAmountController.text = fullAmount.toStringAsFixed(2);

        // Clear the TextFormField values and reset state
        _medicineController.clear();
        _quantityController.clear();
        selectedMedicine = null;
        quantity = 0;
        totalAmount = 0.0;

        // Recalculate total amount in case quantity or selectedMedicine was changed
        _updateTotalAmount();
      });
    }
  }
  // ---------------------------------------------------------------

  // void _addMedicine() {
  //   if (selectedMedicine != null && quantity > 0) {
  //     setState(() {
  //       // Add the selected medicine details to the list
  //       addedMedicines.add({
  //         'medicine': selectedMedicine!,
  //         'quantity': quantity,
  //         'totalAmount': totalAmount,
  //       });

  //       // Update the fullAmount
  //       fullAmount += totalAmount;

  //       // Update the controller text
  //       fullAmountController.text = fullAmount.toStringAsFixed(2);

  //       // Clear the TextFormField values and reset state
  //       _medicineController.clear();
  //       _quantityController.clear();
  //       selectedMedicine = null;
  //       quantity = 0;
  //       totalAmount = 0.0;

  //       // Recalculate total amount in case quantity or selectedMedicine was changed
  //       _updateTotalAmount();
  //     });
  //   }
  // }

  // -----------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final billingVar = Provider.of<BillingController>(context, listen: false);
    final billingFunction = Provider.of<BillingController>(context);
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hospital Name, Address, and Logo
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Hospital name and address
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "HIGHLAND HOSPITAL RESEARCH AND DIAGNOSTIC CENTRE",
                          textAlign: TextAlign.left,
                          style: MyTextStyle.highlandheading.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.mainBlack,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Mother Theresa Rd, Highlands, Kankanady,",
                          style: MyTextStyle.highlandaddress.copyWith(
                            fontSize: 16,
                            color: ColorConstants.mainBlack,
                          ),
                        ),
                        Text(
                          "Mangaluru, Karnataka 575002",
                          style: MyTextStyle.highlandaddress.copyWith(
                            fontSize: 16,
                            color: ColorConstants.mainBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Logo placed on the left side of the heading
                  Container(
                    height: 220,
                    width: 220,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.mainOrange),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/highlandlogo.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              // Cash Bill Header
              Center(
                child: Text(
                  "CASH BILL (Original)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: ColorConstants.mainBlue,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(color: ColorConstants.mainBlack),
              SizedBox(height: 20),
              // Billing Information
              Column(
                children: [
                  // row 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Patient No : ",
                            style: TextStyle(
                              color: ColorConstants.mainBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 200),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Department : ",
                            style: TextStyle(
                              color: ColorConstants.mainBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Text(
                          //   "Mental Health",
                          //   style: TextStyle(color: ColorConstants.mainBlack),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 11),
                  // row 2
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Patient Name : ",
                            style: TextStyle(
                              color: ColorConstants.mainBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Text(
                          //   "Adharsh PS",
                          //   style: TextStyle(color: ColorConstants.mainBlack),
                          // ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Bill No : ",
                            style: TextStyle(
                              color: ColorConstants.mainBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Text(
                          //   "221133446655",
                          //   style: TextStyle(color: ColorConstants.mainBlack),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 11),
                  // row 3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Doctor : ",
                            style: TextStyle(
                              color: ColorConstants.mainBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Text(
                          //   "Nithin MD",
                          //   style: TextStyle(color: ColorConstants.mainBlack),
                          // ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Bill Date : ",
                            style: TextStyle(
                              color: ColorConstants.mainBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Text(
                          //   "07-04-2024",
                          //   style: TextStyle(color: ColorConstants.mainBlack),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Row(
                    children: [
                      Text(
                        "OP Bill No : ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      // Text("24")
                    ],
                  )
                ],
              ),
              SizedBox(height: 11),
              Divider(color: ColorConstants.mainBlack),
              Row(
                children: [
                  Expanded(
                    child: Autocomplete<SampleBillingApimodel>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        // if (textEditingValue.text.isEmpty) {
                        //   return const Iterable<Medicine>.empty();
                        // }
                        // return items.where((Medicine medicine) {
                        //   return medicine.name
                        //       .toLowerCase()
                        //       .contains(textEditingValue.text.toLowerCase());
                        // });
                        // -------------
                        return showableMedicines
                            .where((SampleBillingApimodel items) {
                          return items.particulars!
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase());
                        }).toList();

                        // -------------
                      },
                      // displayStringForOption: (Medicine medicine) =>
                      //     medicine.name,
                      // -------------------------------------------
                      displayStringForOption: (SampleBillingApimodel items) {
                        controllerValue = items.particulars ?? "";
                        return controllerValue;
                      },
                      // ---------------------------------------------
                      fieldViewBuilder:
                          (context, Controller, focusNode, onFieldSubmitted) {
                        return TextFormField(
                          controller: Controller,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            labelText: 'Search Item',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(),
                          ),
                        );
                      },
                      onSelected: (SampleBillingApimodel items) {
                        // Action to perform on item selection
                        // print(
                        //     'You selected: ${selection.name} - Price: ${selection.price}, GST: ${selection.gst}%');
                        // --------------------------------
                        setState(() {
                          selectedMedicine = items;
                          _quantityController.text = '1';
                          _updateTotalAmount();
                          medicineController.clear();
                          _updateTotalAmount();
                        });

                        // --------------------------------
                      },

                      // optionsViewBuilder: (BuildContext context,
                      //         AutocompleteOnSelected<Medicine> onSelected,
                      //         Iterable<Medicine> options) {
                      //   return Align(
                      //     alignment: Alignment.topLeft,
                      //     child: Material(
                      //       child: Container(
                      //         width: MediaQuery.of(context).size.width * 0.9,
                      //         child: ListView.builder(
                      //           padding: EdgeInsets.all(8.0),
                      //           itemCount: options.length,
                      //           itemBuilder: (BuildContext context, int index) {
                      //             final Medicine option =
                      //                 options.elementAt(index);

                      //             return GestureDetector(
                      //               onTap: () {
                      //                 onSelected(option);
                      //               },
                      //               child: ListTile(
                      //                 title: Text(option.name),
                      //                 subtitle: Text(
                      //                     'Price: \$${option.price}, GST: ${option.gst}%'),
                      //               ),
                      //             );
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //   );
                      //   // -----------

                      //   // ------------------------------------------------
                      // }
                    ),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  const Text("Quantity:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(width: 5),
                  IconButton(
                      onPressed: () {
                        setState(() {});
                        int dec = int.parse(_quantityController.text.trim());
                        if (dec > 1) {
                          dec--;
                        }
                        _quantityController.text = dec.toString();
                        _updateTotalAmount();
                      },
                      icon: Icon(Icons.remove)),
                  Container(
                    width: 50,
                    child: TextFormField(
                      controller: _quantityController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      readOnly: selectedMedicine == null ? true : false,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        // hintText: 'Enter quantity',
                      ),
                      onChanged: (value) {
                        _updateTotalAmount();
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {});
                        int inc = int.parse(_quantityController.text.trim());
                        // if (inc < selectedMedicine!.stock)
                        // ---------------------------------------------------------------
                        if (inc < double.parse(selectedMedicine!.stock ?? "")) {
                          inc++;
                        }
                        _quantityController.text = inc.toString();
                        _updateTotalAmount();
                      },
                      icon: Icon(Icons.add)),

                  // ----------------------------------

                  // IconButton(
                  //   onPressed: () {
                  //     if (selectedMedicine != null) {
                  //       setState(() {
                  //         int inc =
                  //             int.tryParse(_quantityController.text.trim()) ??
                  //                 0;
                  //         inc++;
                  //         _quantityController.text = inc.toString();
                  //         _updateTotalAmount();
                  //       });
                  //     }
                  //   },
                  //   icon: Icon(Icons.add),
                  // ),

                  // -------------------------------
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: _addMedicine,
                    icon:
                        Icon(Icons.add_circle, color: ColorConstants.mainBlue),
                  )
                ],
              ),

              // ----------------------------------------------------------------------
              const SizedBox(height: 30),
              // Medicine Details Container
              if (selectedMedicine != null)
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: ColorConstants.mainBlue, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " Details",
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
                                    color: ColorConstants.mainBlack,
                                    width: 1.5),
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: Text(
                                  "Item: ${selectedMedicine!.particulars}"),
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
                                  "Main Stock: ${selectedMedicine!.stock}"),
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
                                  // ---------------------------------------------------------------------------------
                                  "Current Stock: ${int.parse(selectedMedicine!.stock ?? "") - quantity}"),
                            ),
                          ),
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
                                child: Text("Price:${selectedMedicine!.price}")
                                //  Text(
                                //     "Price: ${selectedMedicine!.price.toStringAsFixed(2)}"),
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
                              child: Text("GST: ${selectedMedicine!.gst}%"),
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
                                  "Quantity: ${_quantityController.text.trim()}"),
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
                    ],
                  ),
                ),
              const SizedBox(height: 10),
              // Added Medicines Details
              if (addedMedicines.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: ColorConstants.mainBlue, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          Text(
                            " Details",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.mainBlue,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ] +
                        addedMedicines.map((medicine) {
                          final medicines =
                              medicine['medicine'] as SampleBillingApimodel;
                          final quantity = medicine['quantity'] as int;

                          final totalAmount = medicine['totalAmount'] as double;

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
                                    child:
                                        Text("Item: ${medicines.particulars}"),
                                  ),
                                ),
                                const SizedBox(width: 10),

                                // ------------------------------------------------------------
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
                                    child:
                                        Text("Main stock: ${medicines.stock}"),
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
                                        "Current Stock: ${int.parse(medicines.stock!) - quantity}"),
                                  ),
                                ),
                                const SizedBox(width: 10),

                                //--------------------------------------------------------------
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
                                          // "Price: ${medicines.price.toStringAsFixed(2)}"),
                                          "Price:${medicines.price}")),
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
                                    child: Text("GST: ${medicines.gst}%"),
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
                                    child: Text("Quantity: ${quantity}"),
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

              // =====================================================================

              SizedBox(
                height: 100,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    child: Text("Intend"),
                  ),
                  Row(
                    children: [
                      const Text("Total:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      Container(
                        width: 200,
                        child: TextFormField(
                            controller: fullAmountController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.5),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 8),
                              // hintText: '${fullAmount.toStringAsFixed(2)}',
                              // readOnly: true,
                            )),
                      ),
                    ],
                  ),

                  // Container(
                  //   width: 200,
                  //   child: TextFormField(
                  //       controller: fullAmountController,
                  //       decoration: InputDecoration(
                  //         border: OutlineInputBorder(
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(10.0)),
                  //           borderSide:
                  //               BorderSide(color: Colors.black, width: 1.5),
                  //         ),
                  //         contentPadding:
                  //             EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  //         // hintText: '${fullAmount.toStringAsFixed(2)}',
                  //         // readOnly: true,
                  //       )),
                  // ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    child: Text("Submit"),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
