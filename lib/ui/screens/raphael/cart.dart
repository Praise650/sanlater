import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Text("Let's Verify is You",
                    style: TextStyle(color: Colors.black87, fontSize: 40)),
                SizedBox(height: 10),
                Text("Choose a means of verication",
                    style: TextStyle(color: Colors.white54, fontSize: 20))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Your Password",
            style: TextStyle(color: Colors.black),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: TextField(
                cursorColor: Colors.black54,
                decoration: InputDecoration(
                    hintText: "Password", border: InputBorder.none)),
          ),
          InkWell(
            onTap: () {},
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
                "Proceed",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
