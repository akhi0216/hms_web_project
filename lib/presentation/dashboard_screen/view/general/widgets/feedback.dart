import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/contoller/feedback_controller.dart';
import 'package:intl/intl.dart'; // Import for formatting the date
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:provider/provider.dart';

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();

  final patientidContoller = TextEditingController();
  final nameController = TextEditingController();
  final phnContoller = TextEditingController();
  final emailController = TextEditingController();
  final feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var functionprovider =
        Provider.of<FeedbackController>(context, listen: false);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    Size size = MediaQuery.sizeOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.1),
                        Text(
                          'We value your feedback!',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.mainOrange,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 80,
                          height: 5,
                          color: ColorConstants.mainBlue,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Date: $formattedDate',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 50),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  controller: patientidContoller,
                                  decoration: InputDecoration(
                                    labelText: 'Patient ID',
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: ColorConstants.mainBlue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: ColorConstants.mainBlue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  controller: phnContoller,
                                  decoration: InputDecoration(
                                    labelText: 'Mobile No',
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: ColorConstants.mainBlue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: ColorConstants.mainBlue,
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: feedbackController,
                                decoration: InputDecoration(
                                  labelText: 'Feedback',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.feedback,
                                    color: ColorConstants.mainBlue,
                                  ),
                                ),
                                maxLines: 9,
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () async {
                                  await functionprovider.feedbackSaving(
                                    patientid: patientidContoller.text,
                                    name: nameController.text,
                                    email: emailController.text,
                                    phn: phnContoller.text,
                                    feedback: feedbackController.text,
                                    date: formattedDate,
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Thank you for your valuable feedback!'),
                                      backgroundColor: ColorConstants.mainBlue,
                                    ),
                                  );

                                  patientidContoller.clear();
                                  nameController.clear();
                                  emailController.clear();
                                  phnContoller.clear();
                                  feedbackController.clear();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorConstants.mainBlue,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                  textStyle: TextStyle(fontSize: 16),
                                ),
                                child: Text(
                                  'Submit Feedback',
                                  style: TextStyle(
                                      color: ColorConstants.mainwhite),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
