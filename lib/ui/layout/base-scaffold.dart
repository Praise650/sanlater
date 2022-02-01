import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sanlater/util/colors.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final PreferredSizeWidget? bottom;
  final Widget? floatingActionButton;

  const BaseScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.bottom,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: App.appWhite,
        appBar: AppBar(
          title: Text(
            title,
            // style: appBarTitleStyle,
          ),
          // iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 1,
          bottom: bottom,
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.solidLightbulb),
              onPressed: () {},
              // color: Colors.black,
            ),
          ],
        ),
        body: body,
        floatingActionButton: floatingActionButton,
      );
    }
  }
