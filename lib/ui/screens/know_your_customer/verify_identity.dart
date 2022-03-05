import 'package:flutter/material.dart';
import 'package:sanlater/authentication_screen/login_screen.dart';
import 'package:sanlater/component/custom_button.dart';
import 'package:sanlater/component/rounded_back_button.dart';
import 'package:sanlater/ui/screens/know_your_customer/personal_information_screen.dart';
import 'package:sanlater/util/assets.dart';
import 'package:sanlater/util/colors.dart';
import 'package:sanlater/util/text_styles.dart';
class VerifyDetailsScreen extends StatelessWidget {
  static const id = 'verify_details_screen';
  const VerifyDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: RoundedBackButton())
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AssetsImages.verifyScreen),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Verify Your Identity', style: sizeTwentyEightBoldBlack,),
              ),
              Flexible(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Your data is safe with us and will\n only be used to authenticate your\nidentity',
                  style: sizeEighteenLightBlack,
                textAlign: TextAlign.center,
                ),
              )),
              ],
            ),
          ),
            CustomButton(
              isIcon: true,
              title: 'Start',
              icon: Icons.east,
              buttonColor: App.appPrimary,
              multiplyingFactor: 1,
              titleStyle: sizeEighteenBoldWhite,
              buttonShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalInformationScreen()),
              )
            ),
          ],
        ),
      ),
    );
  }
}
