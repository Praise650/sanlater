import 'package:flutter/material.dart';
import 'package:sanlater/ui/screens/cart.dart';
import 'package:sanlater/ui/screens/payment.dart';
import 'package:sanlater/ui/screens/wallet.dart';
import 'package:sanlater/util.dart/colors.dart';
import 'package:sanlater/util.dart/icons.dart';

import 'homepage/homepage-view.dart';

class MainScreen extends StatefulWidget {
  static const id = 'main-screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  List<Widget> screen = [HomePage(),Cart(),Payment(),Wallet(),];
  List<String> text = ['Home','My cart','Payments','Wallet'];
  List<IconData> icons =[AssetIcons.home,AssetIcons.cart,AssetIcons.cardSettings,AssetIcons.wallet];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        child: screen[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: App.appPrimary,
        // enableFeedback: true,
        selectedFontSize: 18,
        selectedItemColor: Colors.orange,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        }, items: List.generate(screen.length, (index) => 
          BottomNavigationBarItem(label: text[index],icon: Icon(icons[index]),backgroundColor: App.appPrimary,),
        ),
      ),
    );
  }
}