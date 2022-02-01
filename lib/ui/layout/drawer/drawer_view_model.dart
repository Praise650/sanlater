import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanlater/ui/screens/about_screen.dart';
import 'package:sanlater/ui/screens/feedback/feedback_screen.dart';
import 'package:sanlater/ui/screens/pay_bills/paybills_screen.dart';

import '../sign_out_screen.dart';

class DrawerViewModel {
  String activities;
  IconData iconData;
  DrawerViewModel({required this.activities, required this.iconData});
}

List<Widget> screens = [PayBillsScreen(),FeedbackScreen(), AboutScreen()];

class DrawerModelData extends ChangeNotifier {
  int selectedndex = 0;
  List<DrawerViewModel> _drawerViewModel = [
    DrawerViewModel(activities: 'Pay Bills', iconData: Icons.receipt_outlined),
    DrawerViewModel(activities: 'Feedback', iconData: Icons.comment_sharp),
    DrawerViewModel(activities: 'About', iconData: Icons.info_outline),
    DrawerViewModel(activities: 'Sign out', iconData: Icons.logout),
    // DrawerViewModel(activities: 'My Cart', iconData: Icons.shopping_cart_outlined),
    // DrawerViewModel(activities: 'Airtime & Data', iconData: Icons.vibration),
    // DrawerViewModel( activities: 'Wallet', iconData: Icons.account_balance_wallet_outlined),
  ];
  UnmodifiableListView<DrawerViewModel> get drawerViewModel =>
      UnmodifiableListView(_drawerViewModel);
  int get taskCount => _drawerViewModel.length;

  updateIndex(BuildContext context, int index) {
    selectedndex = index;
    if (selectedndex != 3) {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>screens[index]));
    } else {
      showDialog(context: context, builder: (context) => SignOutScreen());
    }
    notifyListeners();
  }

//   pushScreenRoute(BuildContext context, int index) {
//     if (selectedndex != 5) {
//       print('bello');
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => screens[selectedndex]));
//           print('bello Minions');
//       Navigator.pop(context);
//     } else {
//       showDialog(context: context, builder: (context) => SignOutScreen());
//     }
//     notifyListeners();
//   }
// }
}