import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanlater/enums/card_enums.dart';
import 'package:sanlater/util/assets.dart';

class CardSetupModel {
  String cardHolderName;
  String cardNumer;
  CardType cardType;
  String expiryDate;
  String cvv;
  String cardBgColor;
  // bool showRadio = false;
  CardSetupModel({
    required this.cardHolderName,
    required this.cardBgColor,
    required this.cardType,
    required this.cardNumer,
    required this.expiryDate,
    required this.cvv,
  });
}

class CardSetupData extends ChangeNotifier {
  List<CardSetupModel> cardSetupModel = [
    CardSetupModel(
        cardHolderName: 'cardHolderName',
        cardBgColor: AssetsImages.cardBgColor1,
        cardType: CardType.MasterCard,
        cardNumer: '864676121263365236',
        expiryDate: 'expiryDate',
        cvv: 'cvv'),
        CardSetupModel(
        cardHolderName: 'Temitope Williams',
        cardBgColor: AssetsImages.cardBgColor2,
        cardType: CardType.Visa,
        cardNumer: '984763t625852337',
        expiryDate: 'expiryDate',
        cvv: 'cvv')
  ];
  int get taskCount => cardSetupModel.length;
  String debitCardType(CardType cardType) {
    if (cardType == CardType.MasterCard) {
      return AssetsImages.masterCardLogo;
    } else if (cardType == CardType.VerveCard) {
      return AssetsImages.visaLogo;
    } else {
      return AssetsImages.verveLogo;
    }
    // notifyListeners();
  }

  updateValue(bool? radioValue, bool? value) {
      radioValue = value;
    notifyListeners();
  }

  addNewCard(String cardNumber,String holderName,String expiryDate,String cvv,CardType cardType){
    cardSetupModel.add(
      CardSetupModel(cardBgColor: debitCardType(cardType),cvv: cvv,cardType: cardType,expiryDate: expiryDate,cardNumer: cardNumber,cardHolderName: holderName,)
    );
  }
  deleteTask(int index){
    cardSetupModel.removeAt(index);
    notifyListeners();
  }
}
