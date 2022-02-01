import 'package:flutter/material.dart';

import 'CardDetails.dart';
import 'Ecard.dart';
import 'cart.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Payment Method",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartList()));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: Colors.white,
                      textColor: Colors.black,
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Credit Card"),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: Colors.white,
                      textColor: Colors.black,
                      padding: const EdgeInsets.all(15.0),
                      child: Text("E-Card"),
                    ),
                  )
                ]),
          ),
          Container(
            width: 40,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                    top: -150,
                    bottom: -200,
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.white70,
                            offset: Offset(5.0, 5.0),
                            blurRadius: 10.0,
                            spreadRadius: 2.0),
                      ], shape: BoxShape.circle, color: Colors.brown),
                    )),
                Positioned.fill(
                    left: -300,
                    top: -120,
                    bottom: -100,
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.white70,
                            offset: Offset(5.0, 5.0),
                            blurRadius: 10.0,
                            spreadRadius: 2.0),
                      ], shape: BoxShape.circle, color: Colors.black12),
                    )),
                CardDetails()
              ],
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Text("Change Card"),
          ),
          SizedBox(height: 40),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Total Amount:"), Text("9500")],
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Ecard()));
            },
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              padding: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              child: Text(
                "Pay Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
