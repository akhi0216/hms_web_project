import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/home_dashboard/widgets/cardiology_home.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/home_dashboard/widgets/emergency_home.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/home_dashboard/widgets/eyecare_home.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/home_dashboard/widgets/maternity_home.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/home_dashboard/widgets/surgery_home.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/home_dashboard/widgets/wellness_home.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  // Variable to keep track of the selected service page
  Widget? selectedPage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main content (Home Dashboard)
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
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
                                  icon: Icons.local_hospital,
                                  title: 'Emergency',
                                  onTap: () {
                                    setState(() {
                                      selectedPage = EmergencyHome();
                                    });
                                  },
                                ),
                                ServiceCard(
                                  icon: Icons.healing,
                                  title: 'Surgery',
                                  onTap: () {
                                    setState(() {
                                      selectedPage = SurgeryHome();
                                    });
                                  },
                                ),
                                ServiceCard(
                                  icon: Icons.favorite,
                                  title: 'Cardiology',
                                  onTap: () {
                                    setState(() {
                                      selectedPage = CardiologyHome();
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ServiceCard(
                                  icon: Icons.pregnant_woman,
                                  title: 'Maternity',
                                  onTap: () {
                                    setState(() {
                                      selectedPage = MaternityHome();
                                    });
                                  },
                                ),
                                ServiceCard(
                                  icon: Icons.spa,
                                  title: 'Wellness',
                                  onTap: () {
                                    setState(() {
                                      selectedPage = WellnessHome();
                                    });
                                  },
                                ),
                                ServiceCard(
                                  icon: Icons.visibility,
                                  title: 'Eye Care',
                                  onTap: () {
                                    setState(() {
                                      selectedPage = EyecareHome();
                                    });
                                  },
                                ),
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
              // Container(
              //   padding: EdgeInsets.all(20),
              //   color: ColorConstants.mainBlue,
              //   child: Column(
              //     children: [
              //       Text(
              //         '© 2024 Highland Hospital. All Rights Reserved.',
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 14,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
        ),

        // Overlay for selected page
        if (selectedPage != null)
          Positioned.fill(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: ColorConstants.mainwhite,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        setState(() {
                          selectedPage = null; // Reset the selected page
                        });
                      },
                    ),
                  ),
                  Expanded(child: selectedPage!),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  ServiceCard({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorConstants.mainBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
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
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
