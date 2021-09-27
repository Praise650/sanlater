import 'package:sanlater/component/style.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

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
            Image(image: AssetImage('images/second_onboarding.png'),width: 400,height: 200,),
            SizedBox(
              height: 40,
            ),
            Text(
              'Shop In-store',
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
          ],
        ),
      ),
    );
  }
}
