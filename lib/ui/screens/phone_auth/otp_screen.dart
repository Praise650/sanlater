import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:sanlater/authentication_screen/view_model/auth_view_model.dart';
import 'package:sanlater/component/signup_button.dart';
import 'package:sanlater/util/colors.dart';
import 'package:stacked/stacked.dart';

import '../get-started.dart';

//   bool _isResendAgain = false;
//   bool _isVerified = false;

//   late Timer _timer;
//   int _start = 60;

//   void resend() {
//     setState(() {
//       _isResendAgain = true;
//     });
//   }

//   void verify() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     _textFieldOtp({first, last}) {
//       return Scaffold(
//         body: Container(
//           color: App.appWhite,
//           height: 85,
//           child: AspectRatio(
//             aspectRatio: 1.0,
//             child: TextField(
//               autofocus: true,
//               onChanged: (value) {
//                 if (value.length == 1 && last == false) {
//                   FocusScope.of(context).nextFocus();
//                 }
//                 if (value.length == 1 && first == false) {
//                   FocusScope.of(context).previousFocus();
//                 }
//               },
//               showCursor: false,
//               readOnly: false,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//               keyboardType: TextInputType.number,
//               maxLength: 1,
//               decoration: InputDecoration(
//                   counter: Offstage(),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(width: 2, color: Colors.black26),
//                     borderRadius: BorderRadius.circular(12),
//                   )),
//             ),
//           ),
//         ),
//       );
//     }

//     return Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         padding: EdgeInsets.all(20),
//         child: Column(children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: GestureDetector(
//               onTap: () {},
//               child: Material(
//                 color: Colors.white,
//                 elevation: 10,
//                 shape: StadiumBorder(),
//                 child: Icon(Icons.keyboard_arrow_left),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8),
//           ),
//           // text field

//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _textFieldOtp(first: true, last: false),
//                 _textFieldOtp(first: false, last: false),
//                 _textFieldOtp(first: false, last: false),
//                 _textFieldOtp(first: false, last: true),
//               ],
//             ),
//           ),

//           SizedBox(height: 20),

//           TextButton(
//               onPressed: () {
//                 // ignore: unnecessary_statements
//                 if (_isResendAgain = true) resend();
//               },
//               child: Text("Change Phone Number",
//                   style: TextStyle(color: Colors.red))),
//           SizedBox(
//             height: 50,
//           ),
//           Text("Resend code in"),
//           SizedBox(
//             height: 20,
//           ),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ButtonStyle(
//                   foregroundColor:
//                       MaterialStateProperty.all<Color>(Colors.white),
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(Colors.blue),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(24),
//                   ))),
//               child: Padding(
//                 padding: EdgeInsets.all(14),
//                 child: Text(
//                   "Finish",
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ),
//           ),
//         ]));
//   }
// }

class OtpPage extends StatefulWidget {
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  int _isResendAgain = 0;
  TextEditingController otpCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthModel>.reactive(
      viewModelBuilder: () => AuthModel(),
      builder: (context, model, _) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 43),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Material(
                          color: Colors.white,
                          elevation: 10,
                          shape: StadiumBorder(),
                          child: Icon(Icons.keyboard_arrow_left),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, bottom: 10),
                        child: Text(
                          'Enter the OTP sent to\n'
                          'your phone number\n'
                          'for verification',
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 30.0,
                            height: 1.0,
                          ),
                        ),
                      ),
                      Text(
                          "We have sent your OTP to number  ${model.phoneNumber.text}"),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding:
                                const EdgeInsets.only(top: 65.0, bottom: 27),
                            child: PinCodeTextField(
                                controller: otpCode,
                                pinBoxHeight: 70,
                                pinBoxWidth: 70,
                                pinBoxRadius: 8,
                                hasUnderline: false,
                                maxLength: 4,
                                defaultBorderColor: Colors.transparent,
                                keyboardType: TextInputType.number)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Text(
                              'Change phone number',
                              style: TextStyle(color: App.red),
                            )),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Resend Code in ${_isResendAgain}s'),
                      LoginButton(
                          onTap: () {
                            model.verifyOtp(context);
                            Get.offAll(
                                () => GetStarted(name: model.firstName.text));
                          },
                          mainText: 'Finish')
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
