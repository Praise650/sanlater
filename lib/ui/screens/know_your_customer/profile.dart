import 'package:flutter/material.dart';
import 'package:sanlater/ui/layout/sign_out_screen.dart';
import 'package:sanlater/ui/screens/know_your_customer/verify_identity.dart';
import 'package:sanlater/ui/screens/request_fund/request_received_screen.dart';
import 'package:sanlater/util/assets.dart';
import 'package:sanlater/util/icons.dart';
import 'package:sanlater/util/text_styles.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 74, 25, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Account',
                        style: sizeTwentyEightBlack,
                      ),
                      Text('Teekay Media'),
                    ],
                  ),
                  CircleAvatar(
                    radius: 15,
                    child: Image.asset(AssetsImages.profileimage),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RequestReceivedScreen())),
                        child: CircularWidget(
                          icon: Icons.download,
                          text: 'Request\nFund',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: CircularWidget(
                          icon: Icons.replay_rounded,
                          text: 'View Account\nActivities',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: CircularWidget(
                          icon: AssetIcons.cardSettings,
                          text: 'Card\nSettings',
                        ),
                      )
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 47),
                child: Column(
                  children: [
                    KYCCard(
                      text: 'Notifications',
                      icon: Icons.notifications_none_outlined,
                      onTap: () {},
                    ),
                    KYCCard(
                      text: 'Update KYC',
                      icon: Icons.contact_mail_outlined,
                      onTap: () {
                        print('object');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyDetailsScreen()));
                      },
                    ),
                    KYCCard(
                      text: 'Contact us',
                      icon: Icons.contact_page_outlined,
                      onTap: () {},
                    ),
                    KYCCard(
                      text: 'Log Out',
                      icon: Icons.logout,
                      color: Colors.red,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => SignOutScreen());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircularWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  CircularWidget({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28.5,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class KYCCard extends StatelessWidget {
  IconData? icon;
  final Color? color;
  String text;
  final bool showTrailingIcon;

  Function() onTap;

  KYCCard(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.icon,
      required this.onTap,
      this.showTrailingIcon = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22.0),
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 60,
            child: ListTile(
              leading: Icon(
                icon,
                color: color,
              ),
              title: Text(
                text,
                style: TextStyle(
                  color: color,
                ),
              ),
              trailing: Icon(
                showTrailingIcon ? Icons.arrow_forward_ios_outlined : null,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
