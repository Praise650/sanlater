import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:sanlater/main.dart';

import 'otp_screen.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({Key? key}) : super(key: key);

  @override
  _PhonePageState createState() => _PhonePageState();
}

String phoneNumber = "";

class _PhonePageState extends State<PhonePage> {
  bool showSpinner = false;

  final TextEditingController _phonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {},
              child: Material(
                color: Colors.white,
                elevation: 10,
                shape: StadiumBorder(),
                child: Icon(Icons.keyboard_arrow_left),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
          ),
          // text field
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 10),
                child: Text(
                  'Hi, please input your'
                  'phone number in the'
                  'field provided',
                  style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 30.0,
                    height: 1.0,
                  ),
                ),
              )),
          Spacer(
            flex: 1,
          ),
          Text(
            "we will send you a confirmation code",
            style: TextStyle(color: Colors.black12, fontSize: 12),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                    controller: _phonenumber,
                    maxLength: 11,
                    style: TextStyle(color: Colors.red),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Enter your phone number",
                        labelText: "Phone Number")),
                SizedBox(height: 20),
                Text(
                  phoneNumber,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtpPage()));
                    },
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ))),
                    child: Padding(
                      padding: EdgeInsets.all(14),
                      child: Text(
                        "Proceed",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
