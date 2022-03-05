import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sanlater/component/signup_button.dart';
import 'package:sanlater/component/text_field.dart';
import 'package:sanlater/ui/screens/feedback/feedback_appreciation_screen.dart';
import 'package:sanlater/util/assets.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  var controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(AssetsImages.firstfeedback),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Help us improve'),
                    ),
                    Text(
                      'Please tell us about your experience\n'
                      ' with the app and what what you feel\n'
                      'we can do better',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                      ],
                ),
                
                    InputField(
                        obscureText: false,
                        controller: controller,
                        lines: 10),
                      ],
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: LoginButton(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FeedbackAppreciationScreen())),
                    mainText: 'Send Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
