import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sanlater/component/signup_button.dart';
import 'package:sanlater/component/text_field.dart';
import 'package:sanlater/ui/screens/get-started.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // loading spinner
  bool showSpinner = false;
  // bool variable to hide or show password
  bool _isHidden = true;

  bool isChecked = false;
  // hide or show password function
  void togglePasswordVisibility() => setState(() => _isHidden = !_isHidden);
  // form key for user input validation
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  //text controllers
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: showSpinner,
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
                      key: _globalKey,
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
                                controller: firstName,
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
                                controller: lastName,
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
                                controller: email,
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
                                controller: password,
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
                                controller: confirmPassword,
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
                                  Checkbox(value: isChecked, onChanged: (value) {
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
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'and & Privacy Policy.',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            decoration: TextDecoration.underline,
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
                      setState(() {
                        showSpinner = true;
                      });
                      // validates form details submitted by users
                      _globalKey.currentState!.validate();

                      //saves form details submitted by users
                      Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GetStarted(
                                      name: firstName.text,
                                    )));
                      _globalKey.currentState!.save();
                      if (email.text.isEmpty || password.text.isEmpty) {
                        setState(() {
                          showSpinner = false;
                        });
                      } else {
                        setState(() {
                          showSpinner = true;
                        });
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Password Incorrect!")));
                      setState(() {
                        showSpinner = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Something went wrong. Please, try again!")));
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
        ));
  }
}
