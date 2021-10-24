import 'package:flutter/material.dart';
import 'package:sanlater/component/style.dart';

class GetStarted extends StatelessWidget {
  GetStarted({this.name});
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(
                flex: 7,
              ),
              Container(
                child: Image(
                  image: AssetImage('images/third_onboarding.png'),
                  width: 400,
                  height: 250,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Hi $name,\n'
                'Welcome on-board',
                textAlign: TextAlign.center,
                style: Styles.gtextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'We have got you covered. Your\n'
                'account has been credited with\n'
                '5000 for you to purchase\n'
                'whatever you want. Payback\n'
                'later at your convinience',
                textAlign: TextAlign.center,
                style: Styles.gbodyTextStyle,
              ),
              Spacer(
                flex: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'main-screen');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Get Started'),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.arrow_forward_sharp,size: 20,),
                          ],
                        ),
                      )),
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
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