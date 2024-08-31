import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/model/rad_model.dart';

class LabRadiologyScreen extends StatefulWidget {
  const LabRadiologyScreen({super.key});

  @override
  State<LabRadiologyScreen> createState() => _LabRadiologyScreenState();
}

class _LabRadiologyScreenState extends State<LabRadiologyScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Test> _tests = [
    Test(name: 'Blood Test', type: 'Lab', details: 'Complete blood count'),
    Test(name: 'X-Ray', type: 'Radiology', details: 'Chest X-ray'),
    Test(name: 'MRI', type: 'Radiology', details: 'Brain MRI'),
    Test(name: 'Urine Test', type: 'Lab', details: 'Urinalysis'),
    Test(name: 'CT Scan', type: 'Radiology', details: 'Abdominal CT scan'),
    Test(name: 'ECG', type: 'Lab', details: 'Electrocardiogram'),
    Test(
        name: 'Ultrasound', type: 'Radiology', details: 'Abdominal ultrasound'),
    Test(name: 'Liver Function Test', type: 'Lab', details: 'LFT panel'),
    Test(name: 'PET Scan', type: 'Radiology', details: 'Whole-body PET scan'),
    Test(
        name: 'Blood Sugar Test', type: 'Lab', details: 'Fasting glucose test'),
  ];

  List<Test> _filteredTests = [];

  @override
  void initState() {
    super.initState();
    _filteredTests = _tests;
  }

  void _filterTests(String query) {
    setState(() {
      _filteredTests = _tests
          .where(
              (test) => test.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Tests',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: _filterTests,
            ),
            const SizedBox(height: 16),
            ListView.builder(
              itemCount: _filteredTests.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final test = _filteredTests[index];
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Icon(
                      test.type == 'Lab' ? Icons.science : Icons.camera_alt,
                      color: Colors.teal,
                    ),
                    title: Text(test.name),
                    subtitle: Text(test.details),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      _showTestDetails(context, test);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showTestDetails(BuildContext context, Test test) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(test.name),
          content: Text(
            'Type: ${test.type}\nDetails: ${test.details}',
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close', style: TextStyle(color: Colors.teal)),
            ),
          ],
        );
      },
    );
  }
}
