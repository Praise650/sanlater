import 'package:flutter/material.dart';
import 'package:sanlater/ui/screens/get-started.dart';
import 'package:sanlater/ui/screens/homepage/homepage-view.dart';
import 'package:sanlater/ui/screens/main-screen.dart';
import 'ui/screens/onboarding.dart';
import 'ui/screens/splash_screen.dart';

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
      // home: CounterApp(),
      routes: {
        'splash_screen':(context)=>SplashScreen(),
        'onboarding': (context)=>OnboardingScreen(),
        'get-started':(context)=>GetStarted(),
        'homepage':(context)=>HomePage(),
        'main-screen':(context)=>MainScreen(),
      },
    );
  }
}