import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sanlater/ui/screens/get-started.dart';
import 'package:sanlater/ui/screens/homepage/homepage-view.dart';
import 'package:sanlater/ui/screens/main-screen.dart';
import 'package:sanlater/ui/screens/phone_auth/otp_screen.dart';
import 'package:sanlater/ui/screens/phone_auth/phone_screen.dart';
import 'package:sanlater/ui/screens/request_fund/request_approved_screen.dart';
import 'package:sanlater/ui/screens/request_fund/request_received_screen.dart';
import 'package:sanlater/ui/screens/wallet/show_dialog.dart';

import 'ui/screens/onbaording/onboarding.dart';
import 'ui/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShowDialogData()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'San Later',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: 'splash_screen',
        routes: {
          'splash_screen': (context) => SplashScreen(),
          'onboarding': (context) => OnboardingScreen(),
          'get-started': (context) => GetStarted(),
          'homepage': (context) => HomePage(),
          'main-screen': (context) => MainScreen(),
          'otp_page': (context) => OtpPage(),
          'phone_page': (context) => PhoneNumberAuthScreen(),
          RequestReceivedScreen.id: (context) => RequestReceivedScreen(),
          RequestApprovedScreen.id: (context) => RequestApprovedScreen(),
        },
      ),
    );
  }
}
