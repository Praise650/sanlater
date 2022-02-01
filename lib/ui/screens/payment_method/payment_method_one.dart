import 'package:flutter/material.dart';
import 'package:sanlater/component/signup_button.dart';
import 'package:sanlater/util/text_styles.dart';

class PaymentMethodOne extends StatelessWidget {
  const PaymentMethodOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.west)),
                    Text("Payment Method", style: sizeEighteenBoldBlack),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color: Colors.white,
                          textColor: Colors.black,
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Credit Card"),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          color: Colors.white,
                          textColor: Colors.black,
                          padding: const EdgeInsets.all(15.0),
                          child: Text("E-Card"),
                        ),
                      )
                    ]),
                SizedBox(height: 10),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.swipe),
                    label: Text('Change Card')),
                Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Total Amount"),
                          SizedBox(width: 20),
                          Text("#9,500")
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("E-Card Balance after\nTransaction:"),
                        SizedBox(width: 20),
                        Text("#-12570")
                      ],
                    )
                  ],
                ),
                // Material(
                //   elevation: 10,
                //   child: Container(
                //     height: 100,
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Icon(Icons.error_outline_rounded,
                //             color: Colors.red[900]),
                //         Text(
                //           'Your E-card limit is presently set at #5000. You\n'
                //           ' do not have sufficient balance to complete\n'
                //           ' this transaction with your E-card',
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Amount:'),
                    Text('#3,500'),
                  ],
                ),
                LoginButton(onTap: () {}, mainText: 'Pay Now'),
              ]),
        ));
  }
}
