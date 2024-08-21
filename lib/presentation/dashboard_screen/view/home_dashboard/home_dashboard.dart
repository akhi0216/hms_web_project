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
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 400,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // boxShadow: [
                    // BoxShadow(
                    //   color: Colors.orange.withOpacity(0.5),
                    //   spreadRadius: 5,
                    //   blurRadius: 7,
                    //   offset: Offset(0, 3),
                    // ),
                    // ],
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/highlandlogo-removebg-preview.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Our Services',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: ColorConstants.mainBlue,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
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
              ),
            ],
          ),
          SizedBox(height: 128),
          Container(
            padding: EdgeInsets.all(20),
            color: ColorConstants.mainBlue,
            child: Column(
              children: [
                Text(
                  '© 2024 Highland Hospital. All Rights Reserved.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      '+1 234 567 890',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 20),
                    Icon(Icons.email, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'info@highlandhospital.com',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.mainBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.3),
            //     spreadRadius: 3,
            //     blurRadius: 5,
            //     offset: Offset(0, 3),
            //   ),
            // ],
          ),
          padding: EdgeInsets.all(15),
          child: Icon(icon, size: 50, color: ColorConstants.mainBlue),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorConstants.mainBlack,
          ),
        ),
        // SizedBox(height: 5),
        // Text(
        //   'Click to learn more',
        //   style: TextStyle(
        //     fontSize: 12,
        //     color: Colors.grey,
        //   ),
        // ),
      ],
    );
  }
}
