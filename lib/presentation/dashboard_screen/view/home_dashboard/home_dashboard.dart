import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 400,
                    width: 800,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/highlandlogo-removebg-preview.png"))),
                  ),
                ),
                Expanded(
                  child:
                      //  Container(
                      //   width: 100,
                      //   child: Text(
                      //     'At HighLand Hospital, we are committed to providing the highest quality of care with a patient-centric approach. Our state-of-the-art facilities and experienced medical professionals ensure that you receive the best possible treatment in a comfortable and caring environment.We take pride in our team of experienced and compassionate medical professionals, who are not only experts in their respective fields but are also dedicated to providing personalized and attentive care. Our doctors, nurses, and support staff work collaboratively to ensure that every patient receives the best possible treatment, from the moment they walk through our doors until they are fully recovered.',
                      //     style: TextStyle(
                      //       fontSize: 16,
                      //     ),
                      //     textAlign: TextAlign.justify,
                      //   ),
                      // ),
                      // service
                      Container(
                    decoration: BoxDecoration(
                        // color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: ColorConstants.mainOrange, width: 2)),
                    // color: Colors.orange,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Our Services',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ServiceCard(
                                icon: Icons.local_hospital, title: 'Emergency'),
                            ServiceCard(icon: Icons.healing, title: 'Surgery'),
                            ServiceCard(
                                icon: Icons.favorite, title: 'Cardiology'),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ServiceCard(
                                icon: Icons.pregnant_woman, title: 'Maternity'),
                            ServiceCard(icon: Icons.spa, title: 'Wellness'),
                            ServiceCard(
                                icon: Icons.visibility, title: 'Eye Care'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // -----------

            SizedBox(height: 147),

            // Footer Section
            Container(
              padding: EdgeInsets.all(10),
              color: ColorConstants.mainBlue,
              child: Center(
                child: Text(
                  '© 2024 Highland Hospital. All Rights Reserved.',
                  style: TextStyle(
                    color: Colors.white,
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

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;

  ServiceCard({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 50, color: ColorConstants.mainBlue),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
