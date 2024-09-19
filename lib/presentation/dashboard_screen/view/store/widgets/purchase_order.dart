import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class PurchaseOrder extends StatefulWidget {
  @override
  _PurchaseOrderState createState() => _PurchaseOrderState();
}

class _PurchaseOrderState extends State<PurchaseOrder> {
  List<OrderItem> orderItems = [];
  String selectedSupplier = '';
  DateTime orderDate = DateTime.now();
  double subTotal = 0;
  double gstTotal = 0;
  double totalAmount = 0;

  TextEditingController supplierController = TextEditingController();
  TextEditingController itemController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Page Header
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Create Purchase Order',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    TextField(
                      controller: supplierController,
                      decoration: InputDecoration(labelText: 'Supplier'),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                            "Order Date: ${orderDate.toLocal()}".split(' ')[0]),
                        IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: _pickDate,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Order Details Section
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Items:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ElevatedButton(
                onPressed: _addItemDialog,
                child: Text('Add Item'),
              ),
            ],
          ),
        ),

        // Item List
        Expanded(
          child: ListView.builder(
            itemCount: orderItems.length,
            itemBuilder: (context, index) {
              final item = orderItems[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text(
                    'Quantity: ${item.quantity} | Price: ₹${item.price} | Total: ₹${item.total}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _removeItem(index),
                ),
              );
            },
          ),
        ),

        // Summary Section
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sub-Total: ₹$subTotal'),
              Text('GST/Tax: ₹$gstTotal'),
              Text('Total Amount: ₹$totalAmount',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),

        // Submit Section
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: _saveDraft, child: Text('Save as Draft')),
              ElevatedButton(onPressed: _submitOrder, child: Text('Submit')),
              ElevatedButton(onPressed: _cancelOrder, child: Text('Cancel')),
            ],
          ),
        ),
      ],
    );
  }

  // Add Item Dialog
  void _addItemDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: itemController,
                decoration: InputDecoration(labelText: 'Item Name'),
              ),
              TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Quantity'),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Price per Unit'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  final name = itemController.text;
                  final quantity = int.parse(quantityController.text);
                  final price = double.parse(priceController.text);
                  final total = quantity * price;
                  orderItems.add(OrderItem(name, quantity, price, total));
                  _calculateTotal();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Remove Item
  void _removeItem(int index) {
    setState(() {
      orderItems.removeAt(index);
      _calculateTotal();
    });
  }

  // Calculate Totals
  void _calculateTotal() {
    subTotal = 0;
    gstTotal = 0;
    totalAmount = 0;
    for (var item in orderItems) {
      subTotal += item.total;
      gstTotal += item.total * 0.18; // Assuming GST is 18%
    }
    totalAmount = subTotal + gstTotal;
  }

  // Date Picker
  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: orderDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != orderDate) {
      setState(() {
        orderDate = picked;
      });
    }
  }

  // Save Draft
  void _saveDraft() {
    // Logic for saving draft
  }

  // Submit Order
  void _submitOrder() {
    // Logic for submitting order
  }

  // Cancel Order
  void _cancelOrder() {
    // Logic for cancelling order
  }
}

class OrderItem {
  String name;
  int quantity;
  double price;
  double total;

  OrderItem(this.name, this.quantity, this.price, this.total);
}
