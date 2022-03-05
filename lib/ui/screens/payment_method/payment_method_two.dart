import 'package:flutter/material.dart';
import 'package:sanlater/component/signup_button.dart';
import 'package:sanlater/ui/screens/payment_method/payment_success.dart';
import 'package:sanlater/util/text_styles.dart';

class PaymentMethodTwo extends StatelessWidget {
  const PaymentMethodTwo({Key? key}) : super(key: key);

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
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      "E-Card Balance",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "#5000",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Total Amount"),
                        SizedBox(
                          width: 20,
                        ),
                        Text("#3,500"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("E-Card Balance after\nTransaction:"),
                        SizedBox(width: 20),
                        Text("#1,500")
                      ],
                    )
                  ],
                ),
                LoginButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentSuccessful()));
                    },
                    mainText: 'Pay Now'),
              ]),
        ));
  }
}
