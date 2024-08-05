// import 'package:flutter/material.dart';

// class HomeDashboard extends StatefulWidget {
//   const HomeDashboard({super.key});

//   @override
//   State<HomeDashboard> createState() => _HomeDashboardState();
// }

// class _HomeDashboardState extends State<HomeDashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Image.asset("assets/images/highlandlogo-removebg-preview.png"),
//     );
//   }
// }
import 'package:flutter/material.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff0ea69f),
            Color(0xffe89700)
          ], // Custom gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/images/highlandlogo-removebg-preview.png",
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
