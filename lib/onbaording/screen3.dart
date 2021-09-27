import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanlater/component/style.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image(
                image: AssetImage('images/third_onboarding.png'),
                width: 400,
                height: 200,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Home Delivery',
              style: Styles.gtextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Don\'t worry yourself about\n'
              'payment first, get what you need\n'
              'now, We have got your back',
              textAlign: TextAlign.center,
              style: Styles.gbodyTextStyle,
            ),
            // GestureDetector(
            //   child: Container(
            //     width: MediaQuery.of(context).size.width * 0.6,
            //     height: MediaQuery.of(context).size.height * 0.06,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       shape: BoxShape.rectangle,
            //       borderRadius: BorderRadius.circular(10.0),
            //       border: Border.all(
            //           width: 2, color: Colors.red, style: BorderStyle.solid),
            //     ),
            //     child: Center(
            //       child: Text(
            //         'Get Started'.toUpperCase(),
            //         style: GoogleFonts.openSans(
            //           color: Color(0xFFD12424),
            //           fontWeight: FontWeight.w700,
            //         ),
            //       ),
            //     ),
            //   ),
            // onTap: () {
            //   Navigator.pushReplacementNamed(context, 'become_an_ambassador');
            // },
            // ),
          ],
        ),
      ),
    );
  }
}
