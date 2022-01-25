import 'package:flutter/material.dart';
import 'package:sanlater/ui/screens/get-started.dart';
import 'package:sanlater/ui/screens/homepage/homepage-view.dart';
import 'package:sanlater/ui/screens/main-screen.dart';
import 'package:sanlater/ui/screens/my_cart_screen.dart';
import 'package:sanlater/ui/screens/paybills_screen.dart';
import 'package:sanlater/ui/screens/personal_information_screen.dart';
import 'package:sanlater/ui/screens/proof_of_identity_screen.dart';
import 'package:sanlater/ui/screens/request_approved_screen.dart';
import 'package:sanlater/ui/screens/request_received_screen.dart';
import 'package:sanlater/ui/screens/verify_identity.dart';
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
      initialRoute: RequestReceivedScreen.id,
      // home: CounterApp(),
      routes: {
        SplashScreen.id:(context)=>SplashScreen(),
        OnboardingScreen.id: (context)=>OnboardingScreen(),
        GetStarted.id:(context)=>GetStarted(),
        HomePage.id :(context)=>HomePage(),
        MainScreen.id:(context)=>MainScreen(),
        MyCartScreen.id:(context)=>MyCartScreen(),
        PayBillsScreen.id: (context)=>PayBillsScreen(),
        VerifyDetailsScreen.id :(context)=>VerifyDetailsScreen(),
        PersonalInformationScreen.id : (context)=> PersonalInformationScreen(),
        ProofOfIdentity.id : (context)=> ProofOfIdentity(),
        RequestApprovedScreen.id : (context)=> RequestApprovedScreen(),
        RequestReceivedScreen.id : (context)=> RequestReceivedScreen(),
      },
    );
  }
}