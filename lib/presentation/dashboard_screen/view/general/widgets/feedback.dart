import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _feedbackController = TextEditingController();

  void _submitFeedback() {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle form submission logic
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Feedback Submitted'),
          content: Text('Thank you for your feedback!'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                _nameController.clear();
                _emailController.clear();
                _feedbackController.clear();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    labelText: 'Patient ID',
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: ColorConstants.mainBlue,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 16),
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: ColorConstants.mainBlue,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 16),
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    labelText: 'Mobile No',
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: ColorConstants.mainBlue,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 16),
                              SizedBox(
                                width: 500,
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: ColorConstants.mainBlue,
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    } else if (!RegExp(r'\S+@\S+\.\S+')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: _feedbackController,
                                decoration: InputDecoration(
                                  labelText: 'Feedback',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.feedback,
                                    color: ColorConstants.mainBlue,
                                  ),
                                ),
                                maxLines: 9,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please provide your feedback';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: _submitFeedback,
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
