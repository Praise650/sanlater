import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
              width: 250, child: Image.asset("assets/images/chip.png")),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text("**** **** ****"),
              Text(
                "5769",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Card Owner"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Temitope Williams",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                      width: 250,
                      child: Image.asset('assets/images/mastercard.png')),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
