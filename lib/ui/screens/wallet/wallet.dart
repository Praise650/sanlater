import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanlater/component/auth-button.dart';
import 'package:sanlater/component/signup_button.dart';
import 'package:sanlater/ui/layout/base-scaffold-body.dart';
import 'package:sanlater/ui/screens/card/choose-card.dart';
import 'package:sanlater/ui/screens/wallet/show_dialog.dart';
import 'package:sanlater/util/colors.dart';
import 'package:sanlater/util/icons.dart';
import 'package:sanlater/util/text_styles.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ProfileHeaderView(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: AuthButton(
                        widthMultiplyingFactor: 0.45,
                        heightMultiplyingFactor: 0.07,
                        buttonBorderColor: Colors.blue,
                        textone: 'Top Up/Repay',
                        showIcon: false,
                        icon: AssetIcons.topup,
                        onPressed: () => showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            backgroundColor: App.appPrimary,
                            enableDrag: true,
                            builder: (BuildContext context) => ShowDialog()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 7.0,
                        // right: 8.0,
                      ),
                      child: AuthButton(
                        elevation: 3,
                        buttonBorderColor: App.appBlack.withOpacity(0.2),
                        widthMultiplyingFactor: 0.45,
                        heightMultiplyingFactor: 0.07,
                        showBorder: true,
                        showIcon: false,
                        icon: AssetIcons.cardSettings,
                        textColor: Colors.black,
                        color: Colors.white,
                        textone: 'Card settings',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseCard()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transaction History',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ))),
                      child: Row(
                        children: [
                          Text('All'),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BaseScaffoldBody(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: List.generate(
                      7,
                      (index) => Card(
                        elevation: 0,
                        color:
                            index == 0 || index == 2 || index == 4 || index == 6
                                ? Colors.red[100]
                                : Colors.green[100],
                        child: ListTile(
                          leading: CircleAvatar(),
                          title: Text('Gicci Shirt'),
                          subtitle: Text('details'),
                          trailing:
                              // Row(
                              //   children: [
                              //               index == 0 ||
                              //               index == 2 ||
                              //               index == 4 ||
                              //               index == 6
                              //         ? Icon(
                              //             Icons.remove,
                              //             color: Colors.red[900],
                              //             size: 10,
                              //           )
                              //         : Icon(Icons.add, color: Colors.green),
                              Text('₦3000',
                                  style: TextStyle(
                                    color: index == 0 ||
                                            index == 2 ||
                                            index == 4 ||
                                            index == 6
                                        ? Colors.red[900]
                                        : Colors.green[900],
                                  )),
                          //   ],
                          // ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeaderView extends StatelessWidget {
  const ProfileHeaderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          color: App.appPrimary,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: ProfileHeaderContent(),
    );
  }
}

class ProfileHeaderContent extends StatelessWidget {
  const ProfileHeaderContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Wallet',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                ),
              ),
              Text(
                '\t E-card Balance',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Text(
                  '₦3,200',
                  style: TextStyle(color: Colors.white, fontSize: 38),
                ),
              ),
              //     MaterialButton(
              //   onPressed: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => Profile()));
              //   },
              //   child: CircleAvatar(
              //     backgroundImage: AssetImage(
              //       'images/splash_logo.png',
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowDialog extends StatefulWidget {
  @override
  _ShowDialogState createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShowDialogData>(builder: (context, snapshot, child) {
      return Container(
        margin: EdgeInsets.only(top: 100),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        color: App.appPrimary,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, bottom: 20.0, right: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: App.appWhite,
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                    ),
                    child: Icon(
                      AssetIcons.close,
                      color: App.appPrimary,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 30.0, bottom: 15.0, left: 20.0, right: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: App.appWhite,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(AssetIcons.wallet),
                              Text(
                                '.... .... .... 5769',
                                style: sizeFourteenBlack,
                              ),
                              Icon(Icons.keyboard_arrow_down_rounded),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        color: App.appWhite,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Amount',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Material(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: App.appWhite,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      '₦${snapshot.creditList[snapshot.selectedIndex].credit}',
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 39),
                                  child: GridView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount: snapshot.taskCount,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 14,
                                        childAspectRatio: 1,
                                        mainAxisSpacing: 14,
                                      ),
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                            onTap: () =>
                                                snapshot.updateIndex(index),
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: snapshot.selectedIndex ==
                                                        index
                                                    ? App.appPrimary
                                                    : App.appGridColor,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                '₦${snapshot.creditList[index].credit}',
                                                style: sizeFourteenBlack,
                                              ),
                                            ),
                                          )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      LoginButton(onTap: () {}, mainText: 'Continue')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
