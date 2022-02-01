import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sanlater/component/custom_button.dart';
import 'package:sanlater/util/colors.dart';
import 'package:sanlater/util/text_styles.dart';
class BvnScreen extends StatelessWidget {
  final Function()? onSubmitted;
  final TextEditingController? bvnController;
  BvnScreen({this.onSubmitted, this.bvnController});

  @override
  Widget build(BuildContext context) {
    var maskFormatter = new MaskTextInputFormatter(mask: '#####-####-####', filter: { "#": RegExp(r'[0-9]') });
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Input your bvn', style: sizeTwentyEightBoldBlack,),
                    CircularProgressIndicator(
                      strokeWidth: 5,
                      value: 50,
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
          Flexible(child: Padding(
            padding: const EdgeInsets.only(bottom:15.0),
            child: Text(
              'Input your 11-digit BVN below and ensure that you are secured from prying eyes around you.',
              style: sizeEighteenLightBlack,
            ),
          )),
          TextField(
            controller: bvnController,
            inputFormatters: [maskFormatter],
            decoration: InputDecoration(
              hintText: '0000-0000-000',
              hintStyle: sizeEighteenLightGrey,
            ),
          ),
            ],
          ),
        ),
        CustomButton(
          title: 'Submit',
          buttonColor: App.appPrimary,
          onPressed: onSubmitted,
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
