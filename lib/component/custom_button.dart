import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
 final Function()? onPressed;
 final Color? buttonColor;
 final ShapeBorder? buttonShape;
 final String title;
 final TextStyle? titleStyle;
 final double multiplyingFactor;
 final bool isIcon;
 final IconData? icon;
CustomButton({
  required this.title,
  this.buttonColor,
  this.buttonShape,
  this.onPressed,
  this.titleStyle,
  this.multiplyingFactor = 1,
  this.icon,
  this.isIcon=false,
});
  @override
  Widget build(BuildContext context) {
    getChild() {
      if (isIcon) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: titleStyle,),
            Icon(icon, color: Colors.white,),
          ],
        );
      }
      else{
        return Text(title, style: titleStyle,);
      }
  }

    return Container(
      width: MediaQuery.of(context).size.width*multiplyingFactor,
      child: MaterialButton(
          onPressed: onPressed,
          height: 50,
        elevation: 0,
        color: buttonColor,
        shape: buttonShape,
        child: getChild(),
      ),
    );
  }
}
