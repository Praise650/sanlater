import 'package:flutter/material.dart';
import 'package:sanlater/component/custom_button.dart';
import 'package:sanlater/util.dart/assets.dart';
import 'package:sanlater/util.dart/colors.dart';
import 'package:sanlater/util.dart/text_styles.dart';
class KycComplete extends StatelessWidget {
  const KycComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            height: MediaQuery.of(context).size.height*0.3,
            child: Image.asset(Assets.kycComplete))
      ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('KYC is Complete', style: sizeTwentyEightBoldBlack,),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Your information has been well received and a notification will be sent to you after we have completed all neccessary processes on our end',
              textAlign: TextAlign.center,
              style: sizeEighteenLightGrey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: CustomButton(title: 'Back to home',
          isIcon: true,
            icon: Icons.arrow_forward,
            buttonColor: App.appPrimary,
            titleStyle: sizeEighteenBoldWhite,
            multiplyingFactor: 1,
            buttonShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: ()=> Navigator.pop(context ),
          ),
        )
      ],
    );
  }
}
