// import 'package:flutter/material.dart';
// import 'package:hms_web_project/constants/color_constants.dart';
// import 'package:hms_web_project/presentation/login_page/view/login_page.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(seconds: 3),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _navigateToLogin() {
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (context) => LoginPage()),
//     );
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               ColorConstants.mainBlue,
//               ColorConstants.mainwhite,
//               ColorConstants.mainBlue,
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: FadeTransition(
//             opacity: _animation,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Welcome To",
//                   style: TextStyle(
//                     color: ColorConstants.mainBlue,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 50,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Container(
//                   height: 200,
//                   width: 500,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                       image: AssetImage(
//                           "assets/images/highlandlogo-removebg-preview.png"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _navigateToLogin,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: ColorConstants.mainBlue,
//                     shape: CircleBorder(),
//                     padding: EdgeInsets.all(20),
//                   ),
//                   child: Icon(
//                     Icons.arrow_forward,
//                     color: ColorConstants.mainOrange,
//                     size: 30,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ---------------------------------------------------------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/login_page/view/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient with a diagonal cut
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorConstants.mainBlue,
                          ColorConstants.mainLightBlue,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: ColorConstants.mainwhite,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome To",
                  style: TextStyle(
                    color: ColorConstants.mainOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: ColorConstants.mainLightBlue,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: ColorConstants.mainwhite,
                    padding: EdgeInsets.all(20),
                    child: Image.asset(
                      "assets/images/highlandlogo-removebg-preview.png",
                      height: 200,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _navigateToLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.mainOrange,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: ColorConstants.mainBlue,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
