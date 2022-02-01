import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanlater/ui/screens/product-datails/product_details_list.dart';
import 'package:sanlater/ui/screens/product-datails/product_details_viewModel.dart';
import 'package:sanlater/util/colors.dart';
import 'package:sanlater/util/text_styles.dart';

class ProductDetails extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productDescription;
  final String productPrice;
  const ProductDetails(
      {required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.productImage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDetailsData(),
      child: Scaffold(
        backgroundColor: App.appSecondaryWhite,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        Center(child: Image(image: AssetImage(productImage), height: 400)),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Material(
                                  color: Colors.white,
                                  elevation: 10,
                                  shape: StadiumBorder(),
                                  child: Icon(
                                    Icons.keyboard_arrow_left,
                                    size: 30,
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 10,
                                child: Icon(
                                  Icons.favorite_rounded,
                                  size: 14,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: ProductDetailsList(
                  productName: productName,
                  productDescription: productDescription,
                  productPrice: productPrice,
                ))
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomAppBar(),
      ),
    );
  }
}

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailsData>(builder: (context, data, child) {
      return Material(
        color: App.bottomAppBarColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
          padding: EdgeInsets.only(left: 25, right: 25),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PriceBox(
                height: 40,
                width: 84,
                color: Color(0xff4B4B4B),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => data.decrement(),
                        child: Icon(Icons.remove_outlined, size: 18)),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(data.multiplier.toString(),
                            style: sizeEighteenWhite)),
                    GestureDetector(
                        onTap: () => data.increment(),
                        child: Icon(Icons.add, size: 18)),
                  ],
                ),
              ),
              PriceBox(
                height: 59,
                width: 117,
                color: App.appPrimary,
                child: GestureDetector(
                  onTap: () {
                    //TODO: implement buy now screen
                    Navigator.pop(context);
                  },
                  child: Text(
                    '₦8,000 | Buy Now',
                    // Provider.of<ProductDetailsData>(context)
                    //     .productDetailsVeiwModel
                    //     .price
                    //     .toString(),
                    textAlign: TextAlign.center,
                    style: sizeFourteenWhite,
                  ),
                ),
              ),
              Container(
                height: 41,
                width: 41,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: App.appPrimary),
                  color: Color(0xff4B4B4B),
                ),
                child: Icon(Icons.shopping_cart_outlined, color: App.appWhite),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class PriceBox extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Widget child;
  PriceBox({
    required this.height,
    required this.width,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        shape: BoxShape.rectangle,
      ),
      child: child,
    );
  }
}
