import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/pharmacy/billing_pharmacy/model/bill_pharmacy.dart';

class BillingPharmacy extends StatefulWidget {
  const BillingPharmacy({super.key});

  @override
  State<BillingPharmacy> createState() => _BillingPharmacyState();
}

class _BillingPharmacyState extends State<BillingPharmacy> {
  Medicine? selectedMedicine;
  final TextEditingController _medicineController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController fullAmountController = TextEditingController();
  late TextEditingController medicineController = TextEditingController();

  List<Medicine> showableMedicines = [];

  // State variables for quantity and total amount
  int quantity = 1;
  double totalAmount = 0.0;

  double fullAmount = 0.0;

  // List to keep track of added medicines
  List<Map<String, dynamic>> addedMedicines = [];

  final List<Medicine> medicines = [
    Medicine(name: 'Paracetamol', stock: 150, price: 10.0, gst: 12),
    Medicine(name: 'Ibuprofen', stock: 80, price: 15.0, gst: 18),
    Medicine(name: 'Amoxicillin', stock: 120, price: 20.0, gst: 5),
    Medicine(name: 'Aspirin', stock: 100, price: 12.0, gst: 18),
    Medicine(name: 'Ciprofloxacin', stock: 90, price: 18.0, gst: 12),
    Medicine(name: 'Cetirizine', stock: 200, price: 8.0, gst: 5),
    Medicine(name: 'Omeprazole', stock: 75, price: 22.0, gst: 18),
    Medicine(name: 'Loratadine', stock: 60, price: 11.0, gst: 12),
    Medicine(name: 'Metformin', stock: 130, price: 25.0, gst: 5),
    Medicine(name: 'Atorvastatin', stock: 95, price: 30.0, gst: 18),
    Medicine(name: 'Simvastatin', stock: 85, price: 28.0, gst: 12),
    Medicine(name: 'Amlodipine', stock: 110, price: 17.0, gst: 5),
    Medicine(name: 'Hydrochlorothiazide', stock: 55, price: 19.0, gst: 12),
    Medicine(name: 'Lisinopril', stock: 140, price: 21.0, gst: 18),
    Medicine(name: 'Azithromycin', stock: 70, price: 23.0, gst: 5),
    Medicine(name: 'Clindamycin', stock: 50, price: 26.0, gst: 18),
    Medicine(name: 'Gabapentin', stock: 160, price: 13.0, gst: 12),
    Medicine(name: 'Losartan', stock: 120, price: 14.0, gst: 5),
    Medicine(name: 'Doxycycline', stock: 65, price: 16.0, gst: 12),
    Medicine(name: 'Hydrocodone', stock: 45, price: 35.0, gst: 18),
  ];
  String controllerValue = "";

  @override
  void dispose() {
    _medicineController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    showableMedicines = medicines;
    _quantityController.addListener(() {
      final text = _quantityController.text;
      if (text.isNotEmpty) {
        final number = int.tryParse(text);
        if (number != null && number > selectedMedicine!.stock) {
          _quantityController.text = selectedMedicine!.stock.toString();
          _quantityController.selection = TextSelection.fromPosition(
            TextPosition(offset: _quantityController.text.length),
          );
        }
      }
    });
  }

  void _updateTotalAmount() {
    if (selectedMedicine != null) {
      setState(() {
        quantity = int.tryParse(_quantityController.text) ?? 0;
        totalAmount = (selectedMedicine!.price * quantity) +
            ((selectedMedicine!.price * quantity) *
                (selectedMedicine!.gst / 100));
      });
    } else {
      setState(() {
        quantity = 0;
        totalAmount = 0.0;
      });
    }
  }

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
            Container(
              padding: const EdgeInsets.all(12),
              height: 150,
              width: 900,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Colors.white,
              ),
              child: const Column(
                children: [
                  Text(
                    "Doctor prescription",
                    style: TextStyle(
                        color: ColorConstants.mainBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * .02),
            // Medicine Autocomplete
            Row(
              children: [
                const Text("Add Medicine:",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(width: 5),
                Expanded(
                  flex: 7,
                  child: Autocomplete<Medicine>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      // if (textEditingValue.text.isEmpty) {
                      //   return const Iterable<Medicine>.empty();
                      // } else {
                      return showableMedicines.where((Medicine medicine) {
                        return medicine.name
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      }).toList();
                      // }
                    },
                    displayStringForOption: (Medicine medicine) {
                      controllerValue = medicine.name;
                      print(controllerValue);
                      return controllerValue;
                    },
                    onSelected: (Medicine medicine) {
                      setState(() {
                        selectedMedicine = medicine;
                        _quantityController.text = '1';
                        // quantity = 1;
                        _updateTotalAmount();
                        medicineController
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
                          hintText: 'Enter Medicine name',
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
                        borderSide: BorderSide(color: Colors.black, width: 1.5),
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
                      if (inc < selectedMedicine!.stock) {
                        inc++;
                      }
                      _quantityController.text = inc.toString();
                      _updateTotalAmount();
                    },
                    icon: Icon(Icons.add)),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: _addMedicine,
                  icon: Icon(Icons.add_circle, color: ColorConstants.mainBlue),
                )
              ],
            ),
            const SizedBox(height: 30),
            // Medicine Details Container
            if (selectedMedicine != null)
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
                      "Medicine Details",
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
                            child: Text("Name: ${selectedMedicine!.name}"),
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
                            child: Text("Stock: ${selectedMedicine!.stock}"),
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
                                "Price: ${selectedMedicine!.price.toStringAsFixed(2)}"),
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
                            child: Text("GST: ${selectedMedicine!.gst}%"),
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
                                "Medicine count: ${_quantityController.text.trim()}"),
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
            if (addedMedicines.isNotEmpty)
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
                          "Medicine Details",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.mainBlue,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ] +
                      addedMedicines.map((medicine) {
                        final medicines = medicine['medicine'] as Medicine;
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
                                  child: Text("Name: ${medicines.name}"),
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
                                  child: Text("Stock: ${medicines.stock}"),
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
                                      "Price: ${medicines.price.toStringAsFixed(2)}"),
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
                                  child: Text(
                                      "Medicine count: ${_quantityController.text.trim()}"),
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
                  setState(() {
                    int stock = selectedMedicine!.stock -
                        int.parse(_quantityController.text.trim());
                    print(selectedMedicine!.stock);
                    Medicine medicine = medicines.firstWhere((med) {
                      return med.name == selectedMedicine?.name;
                    });
                    medicine.stock = selectedMedicine!.stock;
                    selectedMedicine = null;
                    showableMedicines = medicines;
                    _medicineController.clear();
                  });
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

  Widget buildTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
