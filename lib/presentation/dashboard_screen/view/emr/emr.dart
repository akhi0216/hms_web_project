import 'package:flutter/material.dart';

class EmrPage extends StatefulWidget {
  const EmrPage({super.key});

  @override
  State<EmrPage> createState() => _EmrPageState();
}

class _EmrPageState extends State<EmrPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),

            SizedBox(
              width: double.infinity, // Makes the card take the full width
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: Hari', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 4),
                      Text('Age: 35', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 4),
                      Text('Gender: Male', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 4),
                      Text('Patient ID: 12345', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            // Medical History Section
            Text(
              'Medical History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Condition: Hypertension',
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 4),
                      Text('Medications: Lisinopril',
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 4),
                      Text('Allergies: None', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 4),
                      Text('Past Surgeries: Appendectomy',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Current Treatment Section
            Text(
              'Current Treatment',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Doctor: Dr. Nithin',
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 4),
                      Text('Medication: Metoprolol 50mg',
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 4),
                      Text('Tests: Blood Pressure Monitoring',
                          style: TextStyle(fontSize: 16)),
                      SizedBox(height: 4),
                      Text('Next Appointment: 12th August 2024',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Additional Notes Section
            Text(
              'Additional Notes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Patient needs to maintain a low-sodium diet and engage in regular physical exercise. Follow up in two weeks for blood pressure evaluation.',
                    style: TextStyle(fontSize: 16),
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
