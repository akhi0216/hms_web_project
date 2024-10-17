import 'package:flutter/material.dart';

class ShiftManagement extends StatefulWidget {
  const ShiftManagement({super.key});

  @override
  State<ShiftManagement> createState() => _ShiftManagementState();
}

class _ShiftManagementState extends State<ShiftManagement> {
  final List<Map<String, String>> shifts = [];
  final TextEditingController employeeController = TextEditingController();
  final TextEditingController shiftController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  void _addShift() {
    final String employee = employeeController.text;
    final String shift = shiftController.text;
    final String date = dateController.text;

    if (employee.isNotEmpty && shift.isNotEmpty && date.isNotEmpty) {
      setState(() {
        shifts.add({'employee': employee, 'shift': shift, 'date': date});
      });
      employeeController.clear();
      shiftController.clear();
      dateController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assign Shift',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          TextField(
            controller: employeeController,
            decoration: InputDecoration(labelText: 'Employee Name'),
          ),
          TextField(
            controller: shiftController,
            decoration:
                InputDecoration(labelText: 'Shift (e.g., Morning, Evening)'),
          ),
          TextField(
            controller: dateController,
            decoration: InputDecoration(labelText: 'Date (e.g., 2024-10-15)'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _addShift,
            child: Text('Assign Shift'),
          ),
          SizedBox(height: 20),
          Text(
            'Assigned Shifts',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: shifts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      '${shifts[index]['employee']} - ${shifts[index]['shift']}'),
                  subtitle: Text('Date: ${shifts[index]['date']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
