import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/texts.dart';

class OpBilling extends StatefulWidget {
  const OpBilling({super.key});

  @override
  State<OpBilling> createState() => _OpBillingState();
}

class _OpBillingState extends State<OpBilling> {
  final TextEditingController _doctorNameController = TextEditingController();
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _wardRoomController = TextEditingController();

  // Boolean to track visibility of details
  bool _showDetails = false;

  @override
  void dispose() {
    _doctorNameController.dispose();
    _patientNameController.dispose();
    _wardRoomController.dispose();
    super.dispose();
  }

  void _toggleDetails() {
    setState(() {
      _showDetails = !_showDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    "HIGHLAND HOSPITAL RESEARCH AND DIAGNOSTIC CENTRE",
                    style: MyTextStyle.highlandheading
                        .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Mother Theresa Rd, Highlands, Kankanady,",
                    style: MyTextStyle.highlandaddress.copyWith(fontSize: 16),
                  ),
                  Text(
                    "Mangaluru, Karnataka 575002",
                    style: MyTextStyle.highlandaddress.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Text(
                "RECEIPT",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
            Divider(
              color: Colors.blueAccent,
              thickness: 2,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Receipt No : 5",
                  style: MyTextStyle.normalText,
                ),
                Text(
                  "Receipt Date : 23 Dec 2019",
                  style: MyTextStyle.normalText,
                ),
              ],
            ),
            Divider(
              color: Colors.blueAccent,
              thickness: 2,
            ),
            SizedBox(height: 20),
            _buildTextField("Doctor Name:", _doctorNameController),
            SizedBox(height: 20),
            _buildTextField("Patient Name:", _patientNameController),
            SizedBox(height: 20),
            _buildTextField("Ward/Room No:", _wardRoomController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleDetails,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
              child: Text(
                _showDetails ? "Hide Details" : "Print",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Visibility(
              visible: _showDetails,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailSection(
                      "Lab Reports:", ['Test : Blood Test', 'Report: Normal']),
                  SizedBox(height: 20),
                  _buildDetailSection("Pharmacy Details:",
                      ['paracetamol: 50g', 'aspirin: 100mg']),
                ],
              ),
            ),
            SizedBox(height: 40),
            _buildAmountSection("Amount Received in Cash", "RS.100.00",
                "Rupees One Hundred Only"),
            SizedBox(height: 10),
            _buildAmountSection(
                "GST (18%)", "RS.18.00", "Rupees Eighteen Only"),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: MyTextStyle.normalText.copyWith(fontSize: 16),
        ),
        SizedBox(
          width: double.infinity,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailSection(String title, List<String> details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyTextStyle.highlandheading
              .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ...details.map((detail) => Text(detail, style: MyTextStyle.normalText)),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildAmountSection(
      String label, String amount, String amountInWords) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: MyTextStyle.normalText
              .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          amount,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          amountInWords,
          style: MyTextStyle.normalText.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
