import 'package:flutter/material.dart';

class CardiologyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cardiology Services',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Our Cardiology department provides top-tier care with the latest technology and experienced professionals. Our services include:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              ServiceListItem(
                title: 'Heart Consultations',
                description:
                    'Comprehensive consultations to assess your heart health and recommend treatment options.',
              ),
              ServiceListItem(
                title: 'ECG and Stress Tests',
                description:
                    'Non-invasive tests to monitor and assess heart function and detect abnormalities.',
              ),
              ServiceListItem(
                title: 'Cardiac Catheterization',
                description:
                    'Advanced procedures for diagnosing and treating heart conditions such as blockages.',
              ),
              ServiceListItem(
                title: '24/7 Emergency Cardiac Care',
                description:
                    'Immediate care for heart attacks and other cardiac emergencies, available at all hours.',
              ),
              SizedBox(height: 16),
              Text(
                'For appointments, call us at +123 456 789 or book online.',
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceListItem extends StatelessWidget {
  final String title;
  final String description;

  ServiceListItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}