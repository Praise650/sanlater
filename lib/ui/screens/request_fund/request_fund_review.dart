import 'package:flutter/material.dart';
import 'package:sanlater/ui/screens/get-started.dart';
import 'package:sanlater/util/assets.dart';

class RequestFund extends StatefulWidget {
  const RequestFund({Key? key}) : super(key: key);

  @override
  _RequestFundState createState() => _RequestFundState();
}

class _RequestFundState extends State<RequestFund> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            Image.asset(
              AssetsImages.paymentSuccess,
              height: 250,
              width: 350,
            ),
            Text('Your Request has been\n'
                'Received Successfully'),
            Text('You will receive a notification\n'
                'shortly concerning the status of\n'
                'your request. Please be patient.'),
            Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: CustomIconButton(
                    btnText: 'Proceed to Wallet', onPressed: () {}))
          ],
        ),
      ),
    );
  }
}
