import 'package:flutter/material.dart';
import 'package:sanlater/component/style.dart';
import 'package:sanlater/ui/screens/main-screen.dart';
import 'package:sanlater/util/assets.dart';
import 'package:sanlater/util/colors.dart';

class GetStarted extends StatelessWidget {
  GetStarted({this.name});
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 7),
              Container(
                child: Image(
                  image: AssetImage(AssetsImages.welcome),
                  width: 400,
                  height: 250,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Hi $name,\n'
                'Welcome on-board',
                textAlign: TextAlign.center,
                style: Styles.gtextStyle,
              ),
              SizedBox(height: 20),
              Text(
                'We have got you covered.\n'
                'You can purchase whatever\n'
                'you want and payback\n'
                'later in instalment for six week.',
                textAlign: TextAlign.center,
                style: Styles.gbodyTextStyle,
              ),
              Spacer(flex: 4),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomIconButton(
                  btnText: 'Get Started',
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>MainScreen()));
                  }
                ),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
      this.height = 0.07,
      required this.btnText,
      required this.onPressed})
      : super(key: key);
  final Function()? onPressed;
  final double height;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(App.appPrimary)),
          onPressed:  onPressed,
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(btnText),
                SizedBox(width: 20),
                Icon(Icons.east_rounded, size: 20),
              ],
            ),
          )),
    );
  }
}
