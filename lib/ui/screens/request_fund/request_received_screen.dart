import 'package:flutter/material.dart';
import 'package:sanlater/component/custom_button.dart';
import 'package:sanlater/ui/screens/request_fund/request_approved_screen.dart';
import 'package:sanlater/util/assets.dart';
import 'package:sanlater/util/colors.dart';
import 'package:sanlater/util/text_styles.dart';

class RequestReceivedScreen extends StatelessWidget {
  static const id = 'request_received_screen';
  const RequestReceivedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(AssetsImages.deposit),
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Column(
              children: [
                Text(
                  'Your Request has been Received Successfully',
                  textAlign: TextAlign.center,
                  style: sizeTwentyEightBoldBlack.copyWith(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Text(
                  'You will receive a notification shortly concerning the status of your request. Please be patient.',
                  style: sizeEighteenLightBlack,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 35.0),
              child: CustomButton(
                title: 'Back to home',
                isIcon: true,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RequestApprovedScreen()));
                },
                buttonColor: App.appPrimary,
                icon: Icons.arrow_forward,
                titleStyle: sizeEighteenBoldWhite,
                buttonShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
