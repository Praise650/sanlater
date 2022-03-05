import 'package:flutter/material.dart';

class RoundedBackButton extends StatelessWidget {
  final Function()? onTap;
  const RoundedBackButton({
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          color: Colors.white,
          elevation: 10,
          shape: StadiumBorder(),
          child: Icon(Icons.keyboard_arrow_left, color: Colors.black,),
        ),
      ),
    );
  }
}
