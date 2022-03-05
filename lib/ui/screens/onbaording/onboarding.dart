import 'package:sanlater/authentication_screen/login_screen.dart';
import 'package:sanlater/authentication_screen/register_screen.dart';
import 'package:sanlater/component/auth-button.dart';
import 'package:sanlater/component/style.dart';
import 'package:flutter/material.dart';
import 'package:sanlater/util/assets.dart';
import 'package:sanlater/util/colors.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  @override
  initState() {
    super.initState();
    pageController = new PageController();
  }

  int seletedIndex = 0;

  List<String> images = [
    AssetsImages.firstonboarding,
    AssetsImages.secondonboarding,
    AssetsImages.thirdonboarding,
    AssetsImages.fourthonboarding,
  ];
  List<String> headerText = [
    "Buy Now, Pay Later",
    "Shop In-store",
    "Home Delivery",
    "Bills Payment",
  ];
  List<Widget> subText = [
    Text(
      'Don\'t worry yourself about\n'
      'payment first, get what you need\n'
      'now, We have got your back',
      textAlign: TextAlign.center,
      style: Styles.gbodyTextStyle,
    ),
    Text(
      'Don\'t worry yourself about\n'
      'payment first, get what you need\n'
      'now, We have got your back',
      textAlign: TextAlign.center,
      style: Styles.gbodyTextStyle,
    ),
    Text(
      'Don\'t worry yourself about\n'
      'payment first, get what you need\n'
      'now, We have got your back',
      textAlign: TextAlign.center,
      style: Styles.gbodyTextStyle,
    ),
    Text(
      'You can pay for your regular\n'
      'bills right here with ease',
      textAlign: TextAlign.center,
      style: Styles.gbodyTextStyle,
    ),
  ];

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
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  onPageChanged: (i) => setState(() => seletedIndex = i),
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          // SvgPicture.asset('images/around_the_world-rafiki.png',width: 400,height: 330,),
                          Image(
                            image: AssetImage(images[index],),
                            width: 400,
                            height: 200,
                          ),
                          SizedBox(
                            height: index == 0 ? 60 : 40,
                          ),
                          Text(
                            headerText[index],
                            style: Styles.gtextStyle,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: subText[index],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
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
        child: seletedIndex == 3
            ? Container(
              height: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AuthButton(
                    widthMultiplyingFactor: 0.4,
                    heightMultiplyingFactor: 0.07,
                    buttonBorderColor: App.appPrimary,
                    textone: 'Log in',
                    onPressed: () { 
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                     },),
                  AuthButton(
                    buttonBorderColor: App.appPrimary,
                    widthMultiplyingFactor: 0.4,
                    heightMultiplyingFactor: 0.07,
                    showBorder: false,
                    textColor: App.appPrimary,
                    color: Colors.white,
                    textone: 'Sign up',
                    onPressed: () {  
                      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Register()));
                    },),
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
                          if(seletedIndex != 3){
                            pageController.animateToPage(3,
                                duration: Duration(milliseconds: 600),
                                curve: Curves.easeOutCubic);}
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
                        color: App.appPrimary,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            width: 2,
                            color: App.appPrimary,
                            style: BorderStyle.solid),
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          if (seletedIndex < 3) {
                            setState(() {
                              pageController.animateToPage(++seletedIndex,
                                duration: Duration(milliseconds: 600),
                                curve: Curves.easeOutCubic);
                            });
                          }
                        },
                        icon: Text(
                          'Next',
                          style: TextStyle(
                            color: App.appWhite,
                          ),
                        ),
                        label: Icon(
                          Icons.east_outlined,
                          color: App.appWhite,
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