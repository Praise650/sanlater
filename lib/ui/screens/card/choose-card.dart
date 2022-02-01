import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanlater/enums/card_enums.dart';
import 'package:sanlater/ui/screens/card/card_setup_view_model.dart';
import 'package:sanlater/util/assets.dart';
import 'package:sanlater/util/colors.dart';
import 'package:sanlater/util/icons.dart';
import 'package:sanlater/util/assets.dart';

import 'card-setup.dart';

class ChooseCard extends StatelessWidget {
  const ChooseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CardSetupData>(
      create: (context) => CardSetupData(),
      child: Consumer<CardSetupData>(builder: (context, taskData, _) {
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
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: taskData.taskCount,
                    itemBuilder: (context, index) => CardInfo(
                          cardNumber: taskData.cardSetupModel[index].cardNumer,
                          cardType: taskData.cardSetupModel[index].cardType,
                          debitCardType: taskData.debitCardType(
                              taskData.cardSetupModel[index].cardType),
                          holderName:
                              taskData.cardSetupModel[index].cardHolderName,
                          bgImage: taskData.cardSetupModel[index].cardBgColor,
                        )),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: Icon(
              AssetIcons.add,
              color: App.appWhite,
            ),
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: App.appPrimary,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CardSetUp()));
            },
          ),
        );
      }),
    );
  }
}

class CardInfo extends StatelessWidget {
  final String debitCardType;
  final String cardNumber;
  final String holderName;
  final CardType cardType;
  final String bgImage;
  bool? showCardIcon = false;
  bool? radioValue = false;
  bool showRadio = false;

  CardInfo(
      {required this.holderName,
      required this.cardNumber,
      required this.debitCardType,
      required this.cardType,
      required this.bgImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      child: Container(
        height: 210,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(left: 42.0, right: 17),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Checkbox(
                    value: radioValue,
                    onChanged: (value) =>
                        Provider.of<CardSetupData>(context, listen: false)
                            .updateValue(radioValue, value)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                          cardType == CardType.MasterCard
                              ? AssetsImages.coloredChip
                              : AssetsImages.chipIcon,
                          height: 22.67,
                          width: 20),
                      Image.asset(debitCardType, height: 28, width: 22.65),
                    ]),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 25), child: Text(cardNumber)),
              Row(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Card Holder'),
                        Text(holderName),
                      ]),
                  // Image.asset(debitCardType,height: 10,),
                ],
              ),
              Divider(
                color: Color(0xff03123F),
                thickness: 0.7,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 66, right: 82, top: 14, bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Make Default'),
                    Text('Delete'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
