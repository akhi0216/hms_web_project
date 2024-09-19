import 'package:flutter/material.dart';

class SurgeryHome extends StatelessWidget {
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
                'Surgery Services',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Our Surgery Department is equipped with state-of-the-art technology and experienced surgeons. We offer a variety of surgical services including:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              ServiceListItem(
                title: 'General Surgery',
                description:
                    'We provide a range of general surgeries for common conditions and emergencies.',
              ),
              ServiceListItem(
                title: 'Orthopedic Surgery',
                description:
                    'Specialized care for bone, joint, and muscle issues, including fractures and joint replacements.',
              ),
              ServiceListItem(
                title: 'Cardiac Surgery',
                description:
                    'Advanced procedures for treating heart-related conditions, including bypass and valve surgeries.',
              ),
              ServiceListItem(
                title: 'Minimally Invasive Surgery',
                description:
                    'Procedures that involve smaller incisions, less pain, and quicker recovery times.',
              ),
              ServiceListItem(
                title: 'Emergency Trauma Surgery',
                description:
                    '24/7 emergency trauma care for critical injuries requiring immediate surgical intervention.',
              ),
              SizedBox(height: 16),
              Text(
                'To schedule a surgery or consultation, contact us at +123 456 789 or book online.',
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
