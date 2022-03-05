import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanlater/component/cart_tiles.dart';
import 'package:sanlater/component/custom_button.dart';
import 'package:sanlater/ui/screens/payment_method/payment_method_three.dart';
import 'package:sanlater/util/colors.dart';
import 'package:sanlater/util/text_styles.dart';

import 'myCart_viewModel.dart';
class MyCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>MyCartViewModel(),
      child: Scaffold(
        // appBar: AppBar(
        // leading: IconButton(icon: Icon(Icons.arrow_back, color: App.appBlack,), onPressed: (){
        //   Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>MainScreen()));
        // },),
        //   title: Text('My Cart', style: titleStyleBlack,),
        //   centerTitle: true,
        //   elevation: 0,
        //   backgroundColor: App.transparent,
        // ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top:12.0,left: 12.0,right: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.67,
                  child: Consumer<MyCartViewModel>(
                    builder: (context, model, _) {
                      return ListView.builder(
                        itemCount: model.listLength,
                        itemBuilder: (context, index){
                          return CartTiles(
                            checkCallBack: (value)=>model.toggleCheckBox(value, index),
                              addOnTap:()=> model.increaseNumberOfItem(index),
                              minusOnTap:()=> model.decreaseNumberOfItem(index),
                              isChecked: model.cartList[index].isChecked,
                              desc:model.cartList[index].desc,
                              category: model.cartList[index].category,
                              price: model.cartList[index].price,
                            numberOfItem: model.cartList[index].numberOfItem,
                            onTapDelete:()=> model.deleteList(index),
                          );
                        },
                      );
                    }
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Amount', style: sizeEighteenLightBlack,),
                    Text('#3,500', style: totalAmountStyle,),
                  ],
                ),
              CustomButton(
                titleStyle: titleStyleWhite,
                  title: 'Buy Now',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>PaymentMethodThree()));
                },
                buttonColor: App.appPrimary,
                buttonShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
