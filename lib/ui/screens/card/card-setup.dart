import 'package:flutter/material.dart';
import 'package:sanlater/component/signup_button.dart';
import 'package:sanlater/component/text_field.dart';
import 'package:sanlater/util/icons.dart';

class CardSetUp extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  CardSetUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left:10.0,right: 10.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Set-up\n'
                    'debit Card',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('This will be your primary card for transactions'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Card Holder Name'),
                  InputField(
                    suffixIcon: Icon(AssetIcons.home),
                    obscureText: false,
                    controller: controller,
                    hintText: 'Johnson Tofunmi',
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text('Card Number'),
                  InputField(
                    showIcon: true,
                    suffixIcon: Icon(AssetIcons.home),
                    obscureText: false,
                    controller: controller,
                    hintText: '5399 5745 5566 2223',
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Expiry Date'),
                            InputField(
                                suffixIcon: Icon(AssetIcons.home),
                                obscureText: false,
                                controller: controller,
                                hintText: '05/22',),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('CVV'),
                            InputField(
                                suffixIcon: Icon(AssetIcons.home),
                                obscureText: false,
                                controller: controller,
                                hintText: '325',),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: LoginButton(onTap: () {}, mainText: 'Add Card'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
