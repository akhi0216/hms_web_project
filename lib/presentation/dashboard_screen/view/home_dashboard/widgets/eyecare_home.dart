import 'package:flutter/material.dart';

class EyecareHome extends StatelessWidget {
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
                'Eye Care Services',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Our Eye Care Department offers specialized services to address a wide range of vision and eye health needs. We provide:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              ServiceListItem(
                title: 'Comprehensive Eye Exams',
                description:
                    'Routine eye exams to assess your vision and detect any early signs of eye conditions.',
              ),
              ServiceListItem(
                title: 'Cataract Surgery',
                description:
                    'Advanced cataract removal procedures using the latest technology for faster recovery.',
              ),
              ServiceListItem(
                title: 'LASIK Surgery',
                description:
                    'Corrective surgery for nearsightedness, farsightedness, and astigmatism, providing clearer vision without glasses or contacts.',
              ),
              ServiceListItem(
                title: 'Glaucoma Treatment',
                description:
                    'Management and treatment of glaucoma to prevent further damage to the optic nerve and preserve vision.',
              ),
              ServiceListItem(
                title: 'Retinal Care',
                description:
                    'Expert care for retinal disorders such as macular degeneration, diabetic retinopathy, and more.',
              ),
              SizedBox(height: 16),
              Text(
                'To book an appointment or for more details, please contact us at +123 456 789 or schedule online.',
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