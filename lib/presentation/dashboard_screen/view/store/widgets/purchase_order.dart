import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/constants/texts.dart';
import 'package:hms_web_project/presentation/login_page/controller/login_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PurchaseOrder extends StatefulWidget {
  const PurchaseOrder({super.key});

  @override
  State<PurchaseOrder> createState() => _PurchaseOrderState();
}

class _PurchaseOrderState extends State<PurchaseOrder> {
  List<Map<String, dynamic>> suppliers = [
    {'name': 'Supplier A', 'cgst': 9, 'sgst': 9, 'igst': 18},
    {'name': 'Supplier B', 'cgst': 5, 'sgst': 5, 'igst': 10},
    {'name': 'Supplier C', 'cgst': 12, 'sgst': 12, 'igst': 24},
    {'name': 'Supplier D', 'cgst': 18, 'sgst': 18, 'igst': 36},
  ];
  List<Map<String, dynamic>> products = [
    {'pname': 'Product A', 'quantity': 1, 'price': 100},
    {'pname': 'Product B', 'quantity': 1, 'price': 5},
    {'pname': 'Product C', 'quantity': 1, 'price': 150},
    {'pname': 'Product D', 'quantity': 1, 'price': 200},
  ];

  Map<String, dynamic> selectedSupplier = {};

  TextEditingController supplierController = TextEditingController();
  TextEditingController productController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  List<Map<String, dynamic>> filteredOptions = [];

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          width: MediaQuery.of(context).size.width - 32,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: const Offset(0.0, 40.0), // Position below the text field
            child: Material(
              elevation: 4.0,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 200,
                ),
                child: ListView.builder(
                  itemCount: filteredOptions.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => ListTile(
                    leading: Icon(Icons.person),
                    title: Row(
                      children: [
                        Expanded(child: Text(filteredOptions[index]['name'])),
                      ],
                    ),
                    onTap: () {
                      setState(() {});
                      supplierController.text = filteredOptions[index]['name'];
                      selectedSupplier = filteredOptions[index];
                      // doctorsList.remove(_filteredOptions[index]);
                      _hideOverlay();
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _filterOptions(String input) {
    setState(() {
      filteredOptions = suppliers
          .where((option) => option['name'].toLowerCase().contains(input))
          .toList();
      _overlayEntry?.markNeedsBuild();
    });
  }

// ===--------------------------------------------------------------------------  products

  Map<String, dynamic> selectedProduct = {};

  // TextEditingController productController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  OverlayEntry? overlayEntry;
  final LayerLink layerLink = LayerLink();
  List<Map<String, dynamic>> filteredProducts = [];

  void showOverlay() {
    overlayEntry = createOverlayEntry();
    Overlay.of(context).insert(overlayEntry!);
  }

  void hideOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  OverlayEntry createOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          width: MediaQuery.of(context).size.width - 32,
          child: CompositedTransformFollower(
            link: layerLink,
            showWhenUnlinked: false,
            offset: const Offset(0.0, 40.0), // Position below the text field
            child: Material(
              elevation: 4.0,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 200,
                ),
                child: ListView.builder(
                  itemCount: filteredProducts.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => ListTile(
                    leading: Icon(Icons.person),
                    title: Row(
                      children: [
                        Expanded(child: Text(filteredProducts[index]['pname'])),
                      ],
                    ),
                    onTap: () {
                      setState(() {});
                      productController.text = filteredProducts[index]['pname'];
                      selectedProduct = filteredProducts[index];
                      // doctorsList.remove(_filteredOptions[index]);
                      hideOverlay();
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void filterProducts(String input) {
    setState(() {
      filteredProducts = products
          .where((option) => option['pname'].toLowerCase().contains(input))
          .toList();
      overlayEntry?.markNeedsBuild();
    });
  }

// ===--------------------------------------------------------------------------

  String department = 'Store';
  TextEditingController dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        dateController.text =
            formattedDate; // Set the selected date in the text field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var varloginprovider = Provider.of<LoginController>(context);
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(color: ColorConstants.mainOrange, width: 2),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order ID : "),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              customDept(),
              SizedBox(
                height: 5,
              ),
              CompositedTransformTarget(
                  link: _layerLink,
                  child: Container(
                    width: 700,
                    child: buildTextFormField(
                      label: 'Search suppliers',
                      controller: supplierController,
                      readOnly: false,
                      icon: Icons.store,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select doctors';
                        }
                        return null;
                      },
                      // onTapOutside: (event) {
                      //   _hideOverlay();
                      // },
                      onChanged: (value) {
                        setState(() {});
                        // print(value.trim().split(',').last.trim());
                        if (_overlayEntry == null) {
                          _showOverlay();
                          _filterOptions(value);
                        } else {
                          _hideOverlay();
                        }
                      },
                      onTap: () {
                        if (supplierController.text.isNotEmpty &&
                            !supplierController.text.trim().endsWith(',')) {
                          _showOverlay();
                        }
                      },
                    ),
                  )),

              // -----------------------------------------
              // Display supplier details if selected
              if (selectedSupplier.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     border: Border.all(
                    //         color: ColorConstants.mainBlue, width: 2)
                    //         ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: ColorConstants.mainBlack)),
                              child: Text(
                                  'Supplier: ${selectedSupplier['name']}')),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: ColorConstants.mainBlack)),
                              child:
                                  Text('CGST: ${selectedSupplier['cgst']}%')),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: ColorConstants.mainBlack)),
                              child:
                                  Text('SGST: ${selectedSupplier['sgst']}%')),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: ColorConstants.mainBlack)),
                              child:
                                  Text('IGST: ${selectedSupplier['igst']}%')),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                      ],
                    ),
                  ),
                ),

              // Expanded(child: Row())
              // ----------------------------
              SizedBox(
                height: 11,
              ),
              Row(
                children: [
                  CompositedTransformTarget(
                      link: layerLink,
                      child: Container(
                        width: 700,
                        child: buildTextFormField(
                          label: 'Search Products',
                          controller: productController,
                          readOnly: false,
                          icon: Icons.store,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select doctors';
                            }
                            return null;
                          },
                          // onTapOutside: (event) {
                          //   _hideOverlay();
                          // },
                          onChanged: (value) {
                            setState(() {});
                            // print(value.trim().split(',').last.trim());
                            if (overlayEntry == null) {
                              showOverlay();
                              filterProducts(value);
                            } else {
                              hideOverlay();
                            }
                          },
                          onTap: () {
                            if (productController.text.isNotEmpty &&
                                !productController.text.trim().endsWith(',')) {
                              showOverlay();
                            }
                          },
                        ),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: ColorConstants.mainBlue,
                        size: 33,
                      ))
                ],
              ),
              if (selectedProduct.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     border: Border.all(color: ColorConstants.mainBlue)),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: ColorConstants.mainBlack)),
                              child:
                                  Text('Product: ${selectedProduct['pname']}')),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: ColorConstants.mainBlack)),
                              child: Text(
                                  'quantity: ${selectedProduct['quantity']}%')),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                      color: ColorConstants.mainBlack)),
                              child:
                                  Text('price: ${selectedProduct['price']}%')),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Purchase Date :"),
                      SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: dateController,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            readOnly: true,
                            onTap: () => _selectDate(context),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Text("Purchase Amount :"),
                      SizedBox(
                          width: 300,
                          child: TextFormField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ))
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: 7,
              ),
              Text(
                "Entered by",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("ID : "),
                      SizedBox(
                          width: 300,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                label: Text(varloginprovider.empId)),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Text("Name : "),
                      SizedBox(
                          width: 300,
                          child: TextFormField(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ))
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              Center(
                  child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.mainBlue,
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: MyTextStyle.appbartext,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.mainBlue,
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: MyTextStyle.appbartext,
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget customSuppliearSearch() {
    return SizedBox(
      width: 300,
      child: TextFormField(),
    );
  }

  Widget customDept() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Department',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text('Store'),
                  leading: Radio<String>(
                    value: 'Store',
                    groupValue: department,
                    onChanged: (String? value) {
                      setState(() {
                        department = value!;
                      });
                    },
                    activeColor: Colors.teal,
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Pharmacy'),
                  leading: Radio<String>(
                    value: 'Pharmacy',
                    groupValue: department,
                    onChanged: (String? value) {
                      setState(() {
                        department = value!;
                      });
                    },
                    activeColor: Colors.teal,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextFormField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required FormFieldValidator<String?> validate,
    void Function()? onTap,
    ValueChanged? onChanged,
    TapRegionCallback? onTapOutside,
    FocusNode? focusNode,
    bool readOnly = true,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      focusNode: focusNode,
      onTap: onTap,
      onChanged: onChanged,
      onTapOutside: onTapOutside,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: ColorConstants.mainBlue,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: validate,
    );
  }

  Widget buildproductTextFormField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    required FormFieldValidator<String?> validate,
    void Function()? onTap,
    ValueChanged? onChanged,
    TapRegionCallback? onTapOutside,
    FocusNode? focusNode,
    bool readOnly = true,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      focusNode: focusNode,
      onTap: onTap,
      onChanged: onChanged,
      onTapOutside: onTapOutside,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: ColorConstants.mainBlue,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: validate,
    );
  }
}
