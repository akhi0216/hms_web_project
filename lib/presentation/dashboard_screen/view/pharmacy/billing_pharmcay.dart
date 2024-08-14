import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/model/bill_pharmacy.dart';

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

  // State variables for quantity and total amount
  int quantity = 1;
  double totalAmount = 0.0;

  double fullAmount = 0.0;

  // List to keep track of added medicines
  final List<Map<String, dynamic>> addedMedicines = [];

  final List<Medicine> medicines = [
    Medicine(name: 'Paracetamol', stock: 150, price: 10.0),
    Medicine(name: 'Ibuprofen', stock: 80, price: 15.0),
    Medicine(name: 'Amoxicillin', stock: 120, price: 20.0),
    Medicine(name: 'Aspirin', stock: 100, price: 12.0),
    Medicine(name: 'Ciprofloxacin', stock: 90, price: 18.0),
    Medicine(name: 'Cetirizine', stock: 200, price: 8.0),
    Medicine(name: 'Omeprazole', stock: 75, price: 22.0),
    Medicine(name: 'Loratadine', stock: 60, price: 11.0),
    Medicine(name: 'Metformin', stock: 130, price: 25.0),
    Medicine(name: 'Atorvastatin', stock: 95, price: 30.0),
    Medicine(name: 'Simvastatin', stock: 85, price: 28.0),
    Medicine(name: 'Amlodipine', stock: 110, price: 17.0),
    Medicine(name: 'Hydrochlorothiazide', stock: 55, price: 19.0),
    Medicine(name: 'Lisinopril', stock: 140, price: 21.0),
    Medicine(name: 'Azithromycin', stock: 70, price: 23.0),
    Medicine(name: 'Clindamycin', stock: 50, price: 26.0),
    Medicine(name: 'Gabapentin', stock: 160, price: 13.0),
    Medicine(name: 'Losartan', stock: 120, price: 14.0),
    Medicine(name: 'Doxycycline', stock: 65, price: 16.0),
    Medicine(name: 'Hydrocodone', stock: 45, price: 35.0),
  ];

  @override
  void dispose() {
    _medicineController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _updateTotalAmount() {
    if (selectedMedicine != null) {
      setState(() {
        quantity = int.tryParse(_quantityController.text) ?? 0;
        totalAmount = selectedMedicine!.price * quantity;
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
        addedMedicines.add({
          'medicine': selectedMedicine!,
          'quantity': quantity,
          'totalAmount': totalAmount,
        });

        _updateTotalAmount();

        // Update full amount before adding GST
        fullAmount += totalAmount;

        // Clear the TextFormField values outside the blue container
        _medicineController.clear();
        _quantityController.clear();
        selectedMedicine = null;
        quantity = 0;
        totalAmount = 0.0;

        // Update full amount including GST
        double gstPercentage = 15.0; // Example GST percentage
        double gstAmount = (fullAmount * gstPercentage) / 100;
        fullAmount += gstAmount;
        fullAmountController.text = fullAmount.toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: ColorConstants.mainBlue, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      // Name
                      Row(
                        children: [
                          const Text("Name:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          const SizedBox(width: 5),
                          Container(
                            width: 200,
                            child: TextFormField(
                              // controller: _medicineController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.5),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                hintText: 'Enter medicine name',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Address
                      Row(
                        children: [
                          const Text("Address:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          const SizedBox(width: 5),
                          Container(
                            width: 200,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.5),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                hintText: 'Enter address',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Phone Number
                      Row(
                        children: [
                          const Text("Phone no.:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          const SizedBox(width: 5),
                          Container(
                            width: 200,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.5),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                hintText: 'Enter phone number',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
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
                  const SizedBox(width: 30),
                  // Image
                  Container(
                    height: 100,
                    width: 100,
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
                ],
              ),
              const SizedBox(height: 30),
              // Medicine Autocomplete
              Row(
                children: [
                  const Text("Medicine name:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Autocomplete<Medicine>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        return medicines.where((Medicine medicine) {
                          return medicine.name
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase());
                        }).toList();
                      },
                      displayStringForOption: (Medicine medicine) =>
                          medicine.name,
                      onSelected: (Medicine medicine) {
                        setState(() {
                          selectedMedicine = medicine;
                          _quantityController.text = '1';
                          // quantity = 1;
                          _updateTotalAmount();
                          _medicineController
                              .clear(); // Clear the TextFormField after selection
                          _updateTotalAmount(); // Update total amount
                        });
                      },
                      fieldViewBuilder: (context, _medicineController,
                          focusNode, onEditingComplete) {
                        // _medicineController.text = controller.text;
                        return TextFormField(
                          controller: _medicineController,
                          focusNode: focusNode,
                          onEditingComplete: onEditingComplete,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.5),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            hintText: 'Enter medicine name',
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
                  Container(
                    width: 100,
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
                                    color: ColorConstants.mainBlack,
                                    width: 1.5),
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
                                    color: ColorConstants.mainBlack,
                                    width: 1.5),
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
                                    color: ColorConstants.mainBlack,
                                    width: 1.5),
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
              const SizedBox(height: 30),
              // Added Medicines Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: addedMedicines.map((item) {
                  final medicine = item['medicine'] as Medicine;
                  final quantity = item['quantity'] as int;
                  final totalAmount = item['totalAmount'] as double;

                  return Container(
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
                                      color: ColorConstants.mainBlack,
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                                child: Text("Name: ${medicine.name}"),
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
                                child: Text("Stock: ${medicine.stock}"),
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
                                    "Price: ${medicine.price.toStringAsFixed(2)}"),
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
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),
              // Discount and Total
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text("GST:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 5),
                      Container(
                        width: 200,
                        child: TextFormField(
                          initialValue: '15%', // Assuming GST percentage is 15%
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.5),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                          ),
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Total:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 5),
                      Container(
                        
                        width: 200,
                        child: TextFormField(
                            readOnly: true,
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
                            )),
                      ),
                    ],
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
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
      ),
    );
  }
}
