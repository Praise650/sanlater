import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sanlater/component/text_field.dart';
import 'package:sanlater/util/colors.dart';
import 'package:sanlater/util/text_styles.dart';

class ProductDetailsList extends StatefulWidget {
  final String productDescription;
  const ProductDetailsList({Key? key,required this.productName,required this.productPrice, required this.productDescription});
  final String productName;
  final String productPrice;

  @override
  _ProductDetailsListState createState() => _ProductDetailsListState();
}

class _ProductDetailsListState extends State<ProductDetailsList>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
              padding: EdgeInsets.only(top: 45),
              child: Text(widget.productName,
                style: sizeTwentyFourBlack,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('4.6(32)'),
                  Text(widget.productPrice,style: sizeTwentyFourBlack)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Divider(
                color: Color(0xff777A8D),
                thickness: 2,
              ),
            ),
            TabBar(
              controller: controller,
              enableFeedback: true,
              isScrollable: true,
              indicatorColor: App.appPrimary,
              labelColor: App.appPrimary,
              unselectedLabelColor: App.appBlack,
              tabs: [
                Tab(text: 'Description'),
                Tab(text: 'Reviews'),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                controller: controller,
                children: [
                  Description(productDescription: widget.productDescription,),
                  Review(),
                ],
              ),
            ),
              ],
            ),
          ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  final String productDescription;

  const Description({Key? key,required this.productDescription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        productDescription
      ),
    );
  }
}

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) => ReviewTemplate(),
        ),
        Card(
          child: InputField(
            lines: 2,
            hintText: 'Leave a review...',
            showIcon: true,
            border: InputBorder.none,
            suffixIcon: Icon(Icons.send),
          ),
        ),
        Text('Rate this product'),
        Text('Let others know what you think about this product'),
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
      ],
    );
  }
}

class ReviewTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 26.5,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Micheal Jonathan'),
                  Text('30 days ago'),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Odio elit suscipit mattis massa ut pellentesque '
              'sed. Eu condimentum rutrum amet integer turpis dui. '
              'Porttitor blandit vitae erat habitant diam.',
            ),
          )
        ],
      ),
    );
  }
}
