import 'package:flutter/material.dart';
import 'package:sanlater/util.dart/colors.dart';
import 'package:sanlater/util.dart/icons.dart';

import 'card-setup.dart';

class ChooseCard extends StatelessWidget {
  const ChooseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App.appWhite,
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
            color: App.appGrey,
          ),
          backgroundColor: App.appWhite),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text('Choose Card'),
            Column(
              children: [
                Card(
                  elevation: 0,
                  child: Container(
                    height: 150,
                    color: App.appPrimary,
                    child: Column(
                      children:[
                        Row(),
                        Text('.... .... .... 5796'),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(''),
                                Text(''),
                              ],
                            ),
                            Icon(AssetIcons.cardSettings),
                          ],
                        ),
                        Divider(
                          color: App.appBlack,
                        ),
                        Row(
                          children: [
                            Text('Details'),
                            Text('Delete'),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Icon(
          AssetIcons.add,
          color: App.appWhite,
        ),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: App.appPrimary,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CardSetUp()));
        },
      ),
    );
  }
}
