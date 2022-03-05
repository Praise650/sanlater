import 'package:flutter/material.dart';
import 'package:sanlater/ui/screens/homepage/homepage-view.dart';
import 'package:sanlater/ui/screens/main-screen.dart';
import 'package:sanlater/util/assets.dart';
import 'package:sanlater/util/colors.dart';

class FeedbackAppreciationScreen extends StatelessWidget {
  const FeedbackAppreciationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 60, right: 60),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 66),
                  child: Image.asset(AssetsImages.secondfeedback),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28),
                  child: Text('Thank you!',style: TextStyle(fontSize:28,fontWeight: FontWeight.w600),),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Text(
                      'Thank you for sharing your thought.\n We appreciate your feedback!',
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:Container(
                    height: MediaQuery.of(context).size.width * 0.13,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.transparent, shape: BoxShape.rectangle),
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>MainScreen()));
                      },
                      icon: Text(
                        'Go home',
                        style: TextStyle(color: App.appPrimary,fontSize: 18,fontWeight: FontWeight.w600),
                      ),
                      label: Icon(Icons.east_outlined, color: App.appPrimary,size: 20),
                    ),
                  ),
    );
  }
}
