import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sanlater/component/signup_button.dart';
import 'package:sanlater/component/text_field.dart';
import 'package:sanlater/ui/screens/get-started.dart';

import 'register_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // loading spinner
  bool showSpinner = false;
  // bool variable to hide or show password
  bool _isHidden = true;
  // hide or show password function
  void togglePasswordVisibility() => setState(() => _isHidden = !_isHidden);
  // form key for user input validation
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  //text controllers
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SafeArea(
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
                        child: RoundedBackButton(
                          onTap: (){},
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
                        padding: const EdgeInsets.only(top: 30.0, bottom: 15),
                        child: Text(
                          'Hello there!\n'
                          'Welcome back',
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            // letterSpacing: 1.0,
                            fontSize: 30.0,
                            // wordSpacing: 2.0,
                            height: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Form(
                      key: _globalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text('Password'),
                          ),
                          // password input field
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
                        ],
                      ),
                    ),

                    LoginButton(
                      mainText: 'Log In',
                      onTap: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        // validates form details submitted by users
                        _globalKey.currentState!.validate();

                        //saves form details submitted by users
                        _globalKey.currentState!.save();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GetStarted(
                                      name: email.text,
                                    )));
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
                    Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // forgot password button
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'forgot_password');
                            },
                            child: Text(
                              'Forget your Password?',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                // fontSize: 16.0,
                              ),
                            ),
                          ),
                          // register account button
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text(
                              'New here?',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                // fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

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
