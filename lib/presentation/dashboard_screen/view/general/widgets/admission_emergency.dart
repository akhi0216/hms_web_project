import 'package:flutter/material.dart';

class AdmissionEmergency extends StatefulWidget {
  const AdmissionEmergency({super.key});

  @override
  State<AdmissionEmergency> createState() => _AdmissionEmergencyState();
}

class _AdmissionEmergencyState extends State<AdmissionEmergency> {
  String? _selectedItem = 'IP';

  final List<String> _items = ['IP', 'OP', 'Daycare'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Patient ID : "),
            // Container(
            //   height: 60,
            //   width: 110,
            //   child: DropdownButtonFormField<String>(
            //       value: _selectedItem,
            //       icon: Icon(Icons.arrow_downward),
            //       decoration: InputDecoration(
            //         labelText: "Select Type",
            //         border: OutlineInputBorder(),
            //       ),
            //       items: _items.map((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value),
            //         );
            //       }).toList(),
            //       onChanged: (String? newValue) {
            //         setState(() {
            //           _selectedItem = newValue;
            //         });
            //       }),
            // )
          ],
        )
      ],
    );
  }
}
