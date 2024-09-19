import 'package:flutter/material.dart';

class WellnessHome extends StatelessWidget {
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
                'Wellness Services',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Our Wellness Department focuses on promoting health and well-being through various services and programs. We offer:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              ServiceListItem(
                title: 'Nutrition Counseling',
                description:
                    'Personalized nutrition plans to help you achieve your health goals, whether it’s weight management or disease prevention.',
              ),
              ServiceListItem(
                title: 'Physical Therapy',
                description:
                    'Rehabilitation and therapy services for recovering from injuries, surgeries, or chronic conditions.',
              ),
              ServiceListItem(
                title: 'Yoga and Meditation',
                description:
                    'Classes designed to help you reduce stress, increase flexibility, and promote overall well-being.',
              ),
              ServiceListItem(
                title: 'Wellness Checkups',
                description:
                    'Comprehensive health assessments to monitor and improve your overall health, preventing future issues.',
              ),
              ServiceListItem(
                title: 'Mental Health Support',
                description:
                    'Counseling and therapy services for individuals dealing with stress, anxiety, and other mental health concerns.',
              ),
              SizedBox(height: 16),
              Text(
                'For more information or to book a service, call us at +123 456 789 or schedule an appointment online.',
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
