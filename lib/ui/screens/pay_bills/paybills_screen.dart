import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:sanlater/component/text_field.dart';
import 'package:sanlater/ui/screens/pay_bills/paybill_viewModel.dart';
import 'package:sanlater/util/colors.dart';
import 'package:sanlater/util/text_styles.dart';

import '../main-screen.dart';
class PayBillsScreen extends StatelessWidget {
  static const id = 'pay_bill_screen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>PayBillViewModel(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: App.transparent,
          centerTitle: true,
          leading: IconButton(icon:Icon(Icons.arrow_back, color: App.appBlack,), onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
          },),
          title: Text('Pay Bill', style: titleStyleBlack,),
        ),
        body: Consumer<PayBillViewModel>(
          builder: (context, model, _){
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InputField(
                      readOnly: true,
                      enabled: false,
                      hintText: 'Search a biller',
                      suffixIcon: Icon(Icons.search, color: App.appGrey,),
                      showIcon: true,
                    ),
                  ),
                  Expanded(
                    child: Container(
                    child: GridView.builder(
                      itemCount: model.billLength,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index){
                        return BillsCard(
                          bill: model.bills[index].bill,
                          isButtonEnabled: false,
                        );
                      },
                    )),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class BillsCard extends HookWidget {
  final String bill;
  final bool isButtonEnabled;
  final Function()? onPressed;
  const BillsCard({
    required this.bill,
    this.isButtonEnabled  = true,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      // width: MediaQuery.of(context).size.width*0.3,
      // height: MediaQuery.of(context).size.height*0.2,
      child: MaterialButton(
       onPressed: isButtonEnabled?onPressed:null,
        disabledColor: App.billCardColor,
        enableFeedback: false,
        color: App.billCardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        height: MediaQuery.of(context).size.height*0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(bill, style: titleStyleBlack,textAlign: TextAlign.center,),
            Text('coming soon', style: sizeSixteenLightGrey)
          ],
        ),
      ),
    );
  }
}

