import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';

class EmergencyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Emergency Services',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: ColorConstants.mainBlue,
            ),
          ),
          SizedBox(height: 20),
          Text(
            '24/7 Immediate Medical Care',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Our Emergency Department is dedicated to providing immediate medical care for urgent and life-threatening conditions. Our team of skilled professionals is equipped to handle a wide range of emergencies, including:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('• Severe Injuries', style: TextStyle(fontSize: 16)),
              Text('• Heart Attacks', style: TextStyle(fontSize: 16)),
              Text('• Strokes', style: TextStyle(fontSize: 16)),
              Text('• Other Acute Illnesses', style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Why Choose Us?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '• Expert medical staff available 24/7\n'
            '• State-of-the-art medical equipment\n'
            '• Fast and efficient triage system\n'
            '• Comfortable waiting area for families\n',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Action to take when button is pressed (e.g., navigate to more details)
            },
            child: Text('Contact Us for More Information'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: ColorConstants.mainBlue,
            ),
          ),
        ],
      ),
    );
  }
}
