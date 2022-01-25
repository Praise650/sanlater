import 'package:flutter/material.dart';
import 'package:sanlater/component/custom_button.dart';
import 'package:sanlater/util.dart/assets.dart';
import 'package:sanlater/util.dart/colors.dart';
import 'package:sanlater/util.dart/text_styles.dart';
class RequestApprovedScreen extends StatelessWidget {
  static const id = 'request_approved_screen';
  const RequestApprovedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.deal),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Request Approved',
                textAlign: TextAlign.center,
                style: sizeTwentyEightBoldBlack.copyWith(fontSize: 24, fontWeight: FontWeight.w600),),
            ),
            Text('Your request for a deposit has been approved and the fund has been deposited into your wallet balance.',
            textAlign: TextAlign.center,
            style:sizeEighteenLightBlack,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:30.0),
              child: Column(
                children: [
                  Text('Payback is due on:', style: sizeEighteenLightBlack,),
                  Text('January 13th, 2022',  style: sizeTwentyEightBoldBlack.copyWith(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('*', style: sizeFourteenLightBlack.copyWith(color: Colors.red),),
                Expanded(child: Text('Funds will automatically be deducted from your bank account if not refunded before the due date', style: sizeFourteenLightBlack,
                textAlign: TextAlign.center,)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: CustomButton(
                title: 'Proceed to Wallet',
                buttonShape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              isIcon: true,
              icon: Icons.arrow_forward,
                onPressed: (){},
                buttonColor: App.appPrimary,
                titleStyle: sizeEighteenBoldWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
