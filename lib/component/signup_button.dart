import 'package:flutter/material.dart';

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
        height: MediaQuery.of(context).size.height * 0.06,
        child: GestureDetector(
          onTap:onTap,
          child: Material(
            color: Colors.blue[600],
            elevation: 5.0,
            borderRadius: BorderRadius.circular(5),
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
      ),
    );
  }
}
