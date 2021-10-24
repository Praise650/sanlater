import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'phone_screen.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool _isResendAgain = false;
  bool _isVerified = false;

  late Timer _timer;
  int _start = 60;

  void resend() {
    setState(() {
      _isResendAgain = true;
    });
  }

  void verify() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _textFieldOtp({first, last}) {
      return Container(
        height: 85,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: TextField(
            autofocus: true,
            onChanged: (value) {
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.length == 1 && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
                counter: Offstage(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black26),
                  borderRadius: BorderRadius.circular(12),
                )),
          ),
        ),
      );
    }

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
                  'Enter the OTP sent to'
                  'your phone number'
                  'for verification',
                  style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 30.0,
                    height: 1.0,
                  ),
                ),
              )),
          Spacer(flex: 1),
          Text("We have sent your OTP to number  $phoneNumber"),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _textFieldOtp(first: true, last: false),
                _textFieldOtp(first: false, last: false),
                _textFieldOtp(first: false, last: false),
                _textFieldOtp(first: false, last: true),
              ],
            ),
          ),

          SizedBox(height: 20),

          TextButton(
              onPressed: () {
                // ignore: unnecessary_statements
                if (_isResendAgain = true) resend();
              },
              child: Text("Change Phone Number",
                  style: TextStyle(color: Colors.red))),
          SizedBox(
            height: 50,
          ),
          Text("Resend code in"),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ))),
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  "Finish",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ]));
  }
}
