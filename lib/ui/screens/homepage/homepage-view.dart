import 'package:flutter/material.dart';

import '../profile.dart';
import '../wallet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            )),
        title: Image(
          image: AssetImage(
            'images/splash_logo.png',
          ),
          height: 40,
          width: 130,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>Profile()));
            },
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'images/splash_logo.png',
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
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
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: Container(
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: selectedIndex == index
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
              // GridView(gridDelegate: ,),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: List.generate(
                      9,
                      (index) => Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ItemsWidget(
                                      onTap: (){},
                                      itemName: 'Scott Jacket',
                                      itemPrice: '15,000.00',
                                    ),
                                  ),
                                  SizedBox(
                                    width:12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ItemsWidget(
                                      onTap: (){},
                                      itemName: 'Scott Jacket',
                                      itemPrice: '15,000.00',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemsWidget extends StatelessWidget {
  String itemName;
  String itemPrice;
  Function() onTap;
  ItemsWidget({required this.itemName, required this.itemPrice,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
          child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.27,
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
                children: [
                  Image(
                      image: AssetImage('images/first_onboarding.png'),
                      height: 150),
                  Padding(
                    padding: const EdgeInsets.only(
                      // left: 6.0,
                      right: 8.0,
                    ),
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
                  )
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
