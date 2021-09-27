import 'package:flutter/material.dart';
import 'package:sanlater/screens/onboarding.dart';
import 'package:sanlater/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'San Later',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'splash_screen',
      routes: {
        'splash_screen':(context)=>SplashScreen(),
        'onboarding': (context)=>OnboardingScreen(),
      },
    );
  }
}