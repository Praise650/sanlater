import 'package:flutter/material.dart';
import 'package:sanlater/component/signup_button.dart';
import 'package:sanlater/util/assets.dart';

class PaymentSuccessful extends StatelessWidget {
  const PaymentSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 180),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetsImages.paymentSuccess,
              height: 250,
              width: 350,
            ),
            Padding(
              padding: EdgeInsets.only(top: 44),
              child: Column(
                children: [
                  Text('Payment Success'),
                  Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Text(
                      'Your payment was successful!\n'
                      'Just wait a moment, your package\n'
                      'will arrive at your location soon.',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 52),
              child: LoginButton(onTap: () {}, mainText: 'Back Home'),
            )
          ],
        ),
      ),
    );
  }
}
