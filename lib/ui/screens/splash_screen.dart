import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    animationController!.forward(from: 0);

    animationController!.addListener(() {
      setState(() {});
    });

    animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, 'onboarding');
      }
    });
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // AnimatedOpacity(
          //   opacity: _visible?1.0:0.0,
          //   duration: Duration(microseconds: 500),
          //   child: ,
          // ),
          Container(
            color: Colors.white,
            // scale: 1.0,
            width: MediaQuery.of(context).size.width,
            // fit: BoxFit.cover,
          ),
          Center(
            child: Opacity(
              opacity: animationController!.value,
              child: Image.asset("images/splash_logo.png", height: 100,width: 200,),
            ),
          )
        ],
      ),
    );
  }
}
