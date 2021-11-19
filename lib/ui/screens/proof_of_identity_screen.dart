import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sanlater/authentication_screen/login_screen.dart';
import 'package:sanlater/component/custom_button.dart';
import 'package:sanlater/ui/screens/bvn_screen.dart';
import 'package:sanlater/ui/screens/kyc_complete_screen.dart';
import 'package:sanlater/util.dart/assets.dart';
import 'package:sanlater/util.dart/colors.dart';
import 'package:sanlater/util.dart/text_styles.dart';

class ProofOfIdentity extends HookWidget {
  static const id = 'proof_of_id';
  const ProofOfIdentity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bvnController = useTextEditingController();
    var controller = usePageController();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundedBackButton(
            onTap: (){},
          ),
        ),
        elevation: 0,
          backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              IdentificationScreen(
                onButtonPressed: (){
                  controller.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
                },
              ),
              BvnScreen(
                bvnController: bvnController,
                onSubmitted:bvnController.text.length ==11? (){
                  controller.animateToPage(
                      2, duration: Duration(milliseconds: 200),
                      curve: Curves.fastOutSlowIn);}: null,
              ),
              
              KycComplete(),
            ],
          ),
        ),
      ),
    );
  }
}

class IdentificationScreen extends StatelessWidget {
  final Function()? onButtonPressed;
IdentificationScreen({this.onButtonPressed});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Proof of Identity', style: sizeTwentyEightBoldBlack,),
              CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                strokeWidth: 3,
                value: 33,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: Text('Please upload a copy of your identity with a clear selfie photo to verify the document holder'),
                  ),
              ),

          IdentityCard(title: 'Upload Proof of Identity',
              note: 'We accept ID card, Drivers License, Passport & NIN',
              imageUrl: Assets.kycComplete),
          IdentityCard(title: 'Take selfie with Identity',
              note: 'Please ensure that every detail of the ID document is clearly visible',
              imageUrl: Assets.kycComplete),
            ],
          ),
        ),
        CustomButton(
          title: 'Proceed',
          buttonColor: App.appPrimary,
          onPressed: onButtonPressed,
          buttonShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          multiplyingFactor: 1,
          isIcon: false,
          titleStyle: sizeEighteenBoldWhite,
        )
      ],
    );
  }
}


class IdentityCard extends StatelessWidget {
  final String title;
  final String note;
  final String imageUrl;
  const IdentityCard({Key? key, required this.title, required this.note, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){},
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: DottedBorder(
            strokeWidth: 2,
            borderType: BorderType.Rect,
            dashPattern: [
              6, 4, 3, 5
            ],
            color: Color(0xff19DBC6),
            radius: Radius.circular(10),
            strokeCap: StrokeCap.round,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Text(title, style: sizeEighteenLightBlack)),
                        Flexible(child: Text(note, style: sizeFourteenLightGrey,)),
                      ],
                    ),
                  ),
                ),
                Image.asset(imageUrl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
