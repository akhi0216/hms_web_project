import 'package:flutter/material.dart';

class StoreBilling extends StatefulWidget {
  const StoreBilling({super.key});

  @override
  State<StoreBilling> createState() => _StoreBillingState();
}

class _StoreBillingState extends State<StoreBilling> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width * .75,
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * .05),
          Text("Store billing"),
          SizedBox(height: size.height * .05),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildTextField(),
        ],
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
