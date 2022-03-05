import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanlater/ui/layout/drawer/drawer.dart';
import 'package:sanlater/ui/layout/drawer/drawer_view_model.dart';
import 'package:sanlater/ui/screens/cart/my_cart_screen.dart';
import 'package:sanlater/ui/screens/wallet/wallet.dart';
import 'package:sanlater/util/colors.dart';
import 'package:sanlater/util/icons.dart';
import 'homepage/homepage-view.dart';
import 'homepage/homepage-view_model.dart';
import 'know_your_customer/profile.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  List<Widget> screen = [HomePage(), MyCartScreen(), Wallet(), Profile()];
  List<String> text = ['Home', 'Cart', 'Wallet', 'Profile'];
  List<IconData> icons = [
    AssetIcons.home,
    AssetIcons.cart,
    // AssetIcons.cardSettings,
    AssetIcons.wallet,
    AssetIcons.person
  ];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DrawerModelData>(
            create: (context) => DrawerModelData()),
        ChangeNotifierProvider<HomepageViewModelData>(
            create: (context) => HomepageViewModelData()),
      ],
      child: Scaffold(
        appBar: selectedIndex != 2 && selectedIndex!=3
            ? AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                centerTitle: true,
                automaticallyImplyLeading: false,
                leading: Builder(
                    builder: (context) => InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Icon(
                          AssetIcons.gridMenu,
                          color: Colors.black,
                        ))),
                title: Image(
                    image: AssetImage('images/splash_logo.png'),
                    height: 40,
                    width: 130),
                // actions: [
                //   MaterialButton(
                //     onPressed: () => Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => Profile())),
                //     child: CircleAvatar(
                //         backgroundImage: AssetImage('images/splash_logo.png')),
                //   ),
                // ],
              )
            : null,
        drawer: MainDrawer(),
        body: Container(
          child: screen[selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          backgroundColor: App.appWhite,
          enableFeedback: true,
          selectedFontSize: 18,
          selectedItemColor: App.appPrimary,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: List.generate(
            screen.length,
            (index) => BottomNavigationBarItem(
              label: text[index],
              icon: Icon(icons[index]),
              backgroundColor: App.appWhite,
            ),
          ),
        ),
      ),
    );
  }
}
