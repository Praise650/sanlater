import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.onPressed,
    this.color = Colors.blue,
    this.showBorder = true,
    this.textone = 'Log in',
    this.widthMultiplyingFactor = 1,
    this.heightMultiplyingFactor = 1,
    this.buttonBorderColor = Colors.blue,
    this.textColor = Colors.white,
    this.showIcon = true,
    this.elevation = 0,
    this.icon = Icons.home,
  }) : super(key: key);
  final String textone;
  final double elevation;
  final double widthMultiplyingFactor;
  final Function() onPressed;
  final Color buttonBorderColor;
  final Color color;
  final double heightMultiplyingFactor;
  final bool showBorder;
  final Color textColor;
  final bool showIcon;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * widthMultiplyingFactor,
      child: MaterialButton(
        elevation: elevation,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
              width: 1,
              color: buttonBorderColor,
              style: showBorder == true ? BorderStyle.none : BorderStyle.solid),
        ),
        onPressed: onPressed,
        height: MediaQuery.of(context).size.height * heightMultiplyingFactor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showIcon == true
                ? Container(width: 0, height: 0)
                : Icon(icon),
            SizedBox(width:showIcon== true? 0: 8),
            Text(
              textone,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}