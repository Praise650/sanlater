import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sanlater/authentication_screen/view_model/auth_view_model.dart';
import 'package:sanlater/component/signup_button.dart';
import 'package:sanlater/component/text_field.dart';
import 'package:sanlater/ui/screens/phone_auth/phone_screen.dart';
import 'package:stacked/stacked.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // bool variable to hide or show password
  bool _isHidden = true;

  bool isChecked = false;
  // hide or show password function
  void togglePasswordVisibility() => setState(() => _isHidden = !_isHidden);
  // form key for user input validation

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthModel>.reactive(
        viewModelBuilder: () => AuthModel(),
        builder: (context, model, child) => ModalProgressHUD(
            inAsyncCall: model.loading,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
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
                            'Hello friend! Signup\n'
                            'to get started',
                            style: GoogleFonts.openSans(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 30.0,
                              height: 1.0,
                            ),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 60,
                        child: Form(
                          key: model.formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text('First name '),
                                InputField(
                                  obscureText: false,
                                  hintText: 'Bash',
                                  inputType: TextInputType.name,
                                  controller: model.firstName,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return '';
                                    }
                                    return null;
                                  },
                                ),
                                Text('Last name'),
                                InputField(
                                  obscureText: false,
                                  hintText: 'Adebayo',
                                  inputType: TextInputType.name,
                                  controller: model.lastName,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return '';
                                    }
                                    return null;
                                  },
                                ),
                                Text('Email / Phone number'),
                                InputField(
                                  obscureText: false,
                                  hintText: 'kamushken@gmail.com',
                                  inputType: TextInputType.emailAddress,
                                  controller: model.emailController,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        value == null ||
                                        !value.contains('@') ||
                                        !value.contains('.')) {
                                      return '';
                                    }
                                    return null;
                                  },
                                ),
                                // password input field
                                Text('Password'),
                                InputField(
                                  showIcon: true,
                                  iconOnPressed: togglePasswordVisibility,
                                  inputType: TextInputType.visiblePassword,
                                  controller: model.passwordController,
                                  suffixIcon: Icon(_isHidden == true
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  obscureText: _isHidden,
                                  hintText: '*********',
                                  validator: (value) {
                                    // validation of user input
                                    if (value!.isEmpty || value == null) {
                                      return '';
                                    } else if ((value.length <= 5)) {
                                      return '';
                                    } else if ((value.length >= 10)) {
                                      return '';
                                    }
                                    return null;
                                  },
                                ),

                                // password input field
                                Text('Confirm Password'),
                                InputField(
                                  showIcon: true,
                                  iconOnPressed: togglePasswordVisibility,
                                  inputType: TextInputType.visiblePassword,
                                  controller: model.confirmPassword,
                                  suffixIcon: Icon(_isHidden == true
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  obscureText: _isHidden,
                                  hintText: '*********',
                                  validator: (value) {
                                    // validation of user input
                                    if (value!.isEmpty || value == null) {
                                      return '';
                                    } else if ((value.length <= 5)) {
                                      return '';
                                    } else if ((value.length >= 10)) {
                                      return '';
                                    }
                                    return null;
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                        value: isChecked,
                                        onChanged: (value) {
                                          setState(() {
                                            isChecked = value!;
                                          });
                                        }),
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        text: 'I agree to the ',
                                        children: [
                                          TextSpan(
                                            text: 'Terms & Condtion\n',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'and & Privacy Policy.',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Text('I agree to the')
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      LoginButton(
                        mainText: 'Proceed',
                        onTap: () async {
                          // validates form details submitted by users
                          if (model.formKey.currentState!.validate()) {
                            //saves form details submitted by users
                            model.formKey.currentState!.save();
                            Get.offAll(() => PhoneNumberAuthScreen());
                          }
                          //   else if (model.email.text.isEmpty ||
                          //       confirmPassword.text.isEmpty) {
                          //     setState(() {
                          //       showSpinner = false;
                          //     });
                          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //         content: Text(
                          //             "Something went wrong. Please, try again!")));
                          //   } else {
                          //     setState(() {
                          //       showSpinner = true;
                          //     });
                          //   }
                          //
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //       SnackBar(content: Text("Password Incorrect!")));
                          //   setState(() {
                          //     showSpinner = false;
                          //   });
                        },
                      ),

                      // // forgot password button
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //     top: 25.0,
                      //     left: 8.0,
                      //     bottom: 8.0,
                      //     right: 8.0,
                      //   ),
                      //   child: TextButton(
                      //     onPressed: () {
                      //       Navigator.pushNamed(context, 'forgot_password');
                      //     },
                      //     child: Text(
                      //       'Forget your Password?',
                      //       style: TextStyle(
                      //         color: Colors.black,
                      //         // fontSize: 16.0,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            )));
  }
}
