import 'package:flutter/material.dart';
import 'package:sanlater/component/style.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

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
            SizedBox(
              height: 10,
            ),
            // SvgPicture.asset('images/around_the_world-rafiki.png',width: 400,height: 330,),
            Image(image: AssetImage('images/first_onboarding.png'),width: 400,height: 200,),
            SizedBox(
              height: 60,
            ),
            Text(
              'Buy Now, Pay Later',
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
