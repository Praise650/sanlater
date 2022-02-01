import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanlater/ui/screens/product-datails/product-details.dart';
import 'homepage-view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Consumer<HomepageViewModelData>(builder: (context, category, _) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    hintText: 'What are you looking for today?',
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                      ),
                      tooltip: 'Search',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Top Categories',
                        style: TextStyle(color: Colors.black),
                      ),
                      Container(
                        height: 60,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                              14,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: GestureDetector(
                                      onTap: () =>
                                          category.updateCategoryIndex(index),
                                      child: Container(
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: category
                                                        .productSelectedIndex ==
                                                    index
                                                ? Colors.red.withOpacity(0.8)
                                                : Colors.grey.withOpacity(0.3),
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Icon(Icons.ac_unit)),
                                    ),
                                  )),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return ItemsWidget(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                  productDescription: category.item[index].description.toString(),
                                  productImage: category.item[index].imageLink,
                                  productName: category.item[index].itemName,
                                  productPrice: category.item[index].price,
                                ))),
                        imageUrl: category.item[index].imageLink,
                        itemName: category.item[index].itemName,
                        itemPrice: category.item[index].price,
                      );
                    },
                    itemCount: category.taskCount,
                    shrinkWrap: true,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class ItemsWidget extends StatelessWidget {
  String itemName;
  String itemPrice;
  String imageUrl;
  Function() onTap;
  ItemsWidget(
      {required this.itemName,
      required this.itemPrice,
      required this.onTap,
      required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.4,
        // height: MediaQuery.of(context).size.height * 0.27,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image(image: AssetImage(imageUrl), height: 150),
                  Positioned(
                    left: 2,
                    right: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          tooltip: "Add to cart",
                          icon: Icon(Icons.add),
                          color: Colors.red,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 10,
                          child: Icon(
                            // tooltip: "Add to favourite",
                            Icons.favorite_rounded,
                            size: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  // )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    '$itemName',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$itemPrice',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



// ListView(
//                           shrinkWrap: true,
//                           children: List.generate(
//                               9,
//                               (index) => Column(
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: [
//                                           Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: ItemsWidget(
//                                             onTap: () {
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           ProductDetails()));
//                                             },
//                                             itemName: 'Scott Jacket',
//                                             itemPrice: '₦15,000.00',
//                                           ),
//                                         ),
//                                           SizedBox(
//                                             width: 12,
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: ItemsWidget(
//                                               onTap: () {},
//                                               itemName: 'Scott Jacket',
//                                               itemPrice: '₦15,000.00',
//                                             ),
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   )),
//                         )