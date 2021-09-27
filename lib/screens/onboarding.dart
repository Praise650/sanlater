import 'package:sanlater/authentication_screen/login_screen.dart';
import 'package:sanlater/authentication_screen/register_screen.dart';
import 'package:sanlater/onbaording/screen2.dart';
import 'package:sanlater/onbaording/screen3.dart';
import 'package:flutter/material.dart';
import 'package:sanlater/onbaording/screen1.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
   PageController pageController =PageController(
      initialPage: 0,
    );
  @override
  initState() {
    super.initState();
  }
  int seletedIndex = 0;
  List<Widget> screensList = [
    Screen1(),
    Screen2(),
    Screen3(),
  ];

  List<Image> images =[];
  List<String> headerText =[];
  List<String> subText =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Expanded(
                flex: 24,
                child: PageView.builder(
                  onPageChanged: (i) => setState(() => seletedIndex = i),
                  itemCount: screensList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return screensList[seletedIndex];
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  screensList.length,
                  (index) => redDot(
                    index,
                  ),
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: seletedIndex == 2
            ? Container(
                height: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            width: 2,
                            color: Colors.blue,
                            style: BorderStyle.solid),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Login()));
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            width: 2,
                            color: Colors.blue,
                            style: BorderStyle.solid),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Register()));
                        },
                        child: Text('Sign up'),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: MediaQuery.of(context).size.width * 0.4,
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextButton(
                        onPressed: () {
                          if(seletedIndex  <2){
                            setState(() {
                            seletedIndex = 2;
                          });
                            pageController.nextPage(duration: Duration(milliseconds: 600), curve: Curves.easeOutCubic);
                          }
                        },
                        child: Text('Skip'),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.13,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            width: 2,
                            color: Colors.blue,
                            style: BorderStyle.solid),
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                           if(seletedIndex  <2){
                            setState(() {
                            seletedIndex += 1;
                          });
                            pageController.nextPage(duration: Duration(milliseconds: 600), curve: Curves.easeOutCubic);
                          }
                        },
                        icon: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        label: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget redDot(int i) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.bounceOut,
        height: 5,
        width: seletedIndex == i ? 18.0 : 8.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              7.0,
            ),
          ),
          color: seletedIndex == i
              ? Colors.blue[600]
              : Colors.grey.withOpacity(0.8),
        ),
      ),
    );
  }
}
