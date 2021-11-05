import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
 final Function()? onPressed;
 final Color? buttonColor;
 final ShapeBorder? buttonShape;
 final String title;
 final TextStyle? titleStyle;
 final double multiplyingFactor;
CustomButton({
  required this.title,
  this.buttonColor,
  this.buttonShape,
  this.onPressed,
  this.titleStyle,
  this.multiplyingFactor = 1,
});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*multiplyingFactor,
      child: MaterialButton(
          onPressed: onPressed,
          height: 50,
        elevation: 0,
        color: buttonColor,
        shape: buttonShape,
        child: Text(title, style: titleStyle,),
      ),
    );
  }
}
