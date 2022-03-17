import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sanlater/authentication_screen/view_model/auth_view_model.dart';
import 'package:sanlater/component/signup_button.dart';
import 'package:sanlater/util/text_styles.dart';
import 'package:stacked/stacked.dart';

import 'otp_screen.dart';

class PhoneNumberAuthScreen extends StatefulWidget {
  @override
  _PhoneNumberAuthScreenState createState() => _PhoneNumberAuthScreenState();
}

class _PhoneNumberAuthScreenState extends State<PhoneNumberAuthScreen> {
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthModel>.reactive(
        viewModelBuilder: () => AuthModel(),
        builder: (context, model, _) {
          return ModalProgressHUD(
            inAsyncCall: model.loading,
            child: Scaffold(
              body: SafeArea(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.all(20),
                    child: Column(
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
                          // text field
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 37.0, right: 25),
                            child: Text(
                              'Hi, please input your\n'
                              'phone number in the\n'
                              'field provided',
                              style: sizeTwentyEight,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 37.0),
                            child: Text(
                              "we will send you a confirmation code",
                              style: sizeFourteenBlack,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  TextField(
                                      controller: model.phoneNumber,
                                      maxLength: 11,
                                      style: TextStyle(color: Colors.red),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          hintText: "Enter your phone number",
                                          labelText: "Phone Number")),
                                  Spacer(
                                    flex: 9,
                                  ),
                                  // Text(
                                  //   phoneNumber,
                                  //   style: TextStyle(
                                  //       color: Colors.black,
                                  //       fontSize: 20,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  SizedBox(height: 50),
                                  LoginButton(
                                      mainText: 'Proceed',
                                      onTap: () {
                                        // if (model.formKey.currentState!
                                        //     .validate()) {
                                        //   model.formKey.currentState!.save();
                                          // model.register(context);
                                          Get.to(OtpPage());
                                        // }
                                      }),
                                ],
                              ),
                            ),
                          )
                        ])),
              ),
            ),
          );
        });
  }
}
