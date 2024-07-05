import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dashboardscreen.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String isLoggined = "";

  bool isObscured = true;
  void _obscureText() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  void login() async {
    try {
      var url = "https://cybot.avanzosolutions.in/hms/loginverify.php";
      var res = await http.post(Uri.parse(url), body: {
        "loginusernamecontroller": _usernameController.text.trim(),
        "loginpasswordcontroller": _passwordController.text.trim(),
      });
      isLoggined = res.body;
    } on Exception catch (e) {
      print(e);
    }
    print(isLoggined);
    if (isLoggined == "success") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboardscreen(),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Enter valid username and password"),
          backgroundColor: ColorConstants.mainRed,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.mainBlue,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Added alignment for better layout
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage("assets/images/highlandlogo.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: 300,
                        width: size.width * .35,
                      ),
                      SizedBox(width: 8), // Added space between columns
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align text to the start
                          children: [
                            Text(
                              "About Us",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: ColorConstants.mainBlue,
                                fontSize: 24, // Added font size
                                fontWeight:
                                    FontWeight.bold, // Added font weight
                              ),
                            ),
                            SizedBox(height: 10), // Added space between texts
                            Text(
                              "Our mission is to provide exceptional healthcare services, promoting wellness and improving the health of our community through compassionate care and advanced medical practices.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: ColorConstants.mainBlack,
                                fontSize: 16, // Added font size
                              ),
                              maxLines: 5,
                            ),
                            Text(
                              "We aspire to be a leading healthcare institution, known for our commitment to patient-centered care, innovative treatments, and continuous improvement in medical excellence.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: ColorConstants.mainBlack,
                                fontSize: 16,
                              ),
                              maxLines: 5,
                            ),

                            Text(
                              " Our hospital is equipped with advanced medical technology and modern facilities designed to provide the highest quality care in a comfortable and safe environment.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: ColorConstants.mainBlack,
                                fontSize: 16, // Added font size
                              ),
                              maxLines: 5,
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 50), // Added space between columns
                      Container(
                        padding: EdgeInsets.all(25),
                        height: 400,
                        width: size.width * .3,
                        decoration: BoxDecoration(
                            color: ColorConstants.mainBlue,
                            // border: Border.all(color: ColorConstants.mainOrange),
                            borderRadius:
                                BorderRadius.all(Radius.circular(11))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                color: ColorConstants.mainwhite,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                  // labelText: 'Username',
                                  hintText: 'Username',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstants.mainwhite),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  filled: true,
                                  fillColor: ColorConstants.mainwhite),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: isObscured,
                              obscuringCharacter: '#',
                              decoration: InputDecoration(
                                  hintText: 'password',
                                  // labelText: 'password',
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstants.mainwhite),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorConstants.mainwhite),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: _obscureText,
                                    icon: Icon(isObscured
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                  filled: true,
                                  fillColor: ColorConstants.mainwhite),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  login();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color(0xffe89700), // Blue background color
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 35),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white, // White text color
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
