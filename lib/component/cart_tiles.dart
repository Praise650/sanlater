import 'package:flutter/material.dart';
import 'package:sanlater/util.dart/colors.dart';
import 'package:sanlater/util.dart/text_styles.dart';
class CartTiles extends StatelessWidget {
  final bool isChecked;
  final checkCallBack;
  final String desc;
  final String category;
  final String price;
  final Function()? minusOnTap;
  final int? numberOfItem;
  final Function()? addOnTap;
  final Function()? onTapDelete;
  CartTiles({
    required this.isChecked,
    this.checkCallBack,
    required this.desc,
    required this.category,
    required this.price,
    this.addOnTap,
    this.minusOnTap,
    this.numberOfItem,
    this.onTapDelete,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: checkCallBack,
                ),
                InkWell(
                    onTap: onTapDelete,
                    child: Icon(Icons.delete)),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: App.appGrey[400],
                borderRadius: BorderRadius.circular(10),
              ),
              height: 80,
                width: 80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(desc, style: sizeSixteenLightBlack,),
                Text(category, style: sizeSixteenLightGrey,),
                Text(price, style: sizeEighteenBoldPrimary,),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: minusOnTap,
                  child: Container(
                    height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color:App.appGrey[200]!),
                        color: App.transparent,
                      ),
                      child: Icon(Icons.minimize_sharp, size: 10, color: App.appBlack,)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(numberOfItem.toString()),
                ),
                InkWell(
                  onTap: addOnTap,
                  child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color:App.appGrey[200]!),
                        color: App.transparent,
                      ),
                      child: Icon(Icons.add, size: 10, color: App.appPrimary,)),
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
