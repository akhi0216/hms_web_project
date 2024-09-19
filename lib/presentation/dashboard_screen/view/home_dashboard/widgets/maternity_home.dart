import 'package:flutter/material.dart';

class MaternityHome extends StatelessWidget {
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
                'Maternity Services',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Our Maternity Department is dedicated to providing comprehensive and compassionate care for mothers and newborns. We offer a range of services, including:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              ServiceListItem(
                title: 'Prenatal Care',
                description:
                    'Comprehensive care throughout pregnancy, ensuring both mother and baby are healthy at every stage.',
              ),
              ServiceListItem(
                title: 'Labor and Delivery',
                description:
                    'State-of-the-art labor rooms with 24/7 support from experienced obstetricians and nurses.',
              ),
              ServiceListItem(
                title: 'Postnatal Care',
                description:
                    'Care for both mother and newborn after delivery, ensuring a smooth recovery and healthy start for the baby.',
              ),
              ServiceListItem(
                title: 'High-Risk Pregnancy Care',
                description:
                    'Specialized care for high-risk pregnancies, including multiple births, pre-existing conditions, and pregnancy complications.',
              ),
              ServiceListItem(
                title: 'Lactation Support',
                description:
                    'Breastfeeding support and guidance to help new mothers with nursing their babies.',
              ),
              SizedBox(height: 16),
              Text(
                'For appointments or more information, call us at +123 456 789 or book online.',
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