import 'package:flutter/material.dart';
import 'package:sanlater/util/colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton( {
    required this.onTap,
    required this.mainText,
    Key? key,
  }) : super(key: key);
  final VoidCallback onTap;
  final String mainText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        child: MaterialButton(
          onPressed:onTap,
          height: MediaQuery.of(context).size.height * 0.06,
          color: App.appPrimary,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              mainText,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 18,
                ),
            ),
          ),
        ),
      ),
    );
  }
}
