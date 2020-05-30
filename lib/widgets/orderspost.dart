import 'package:ecommerce/model/OrdersChild.dart';
import 'package:ecommerce/model/Products.dart';
import 'package:ecommerce/widgets/OrdersListRow.dart';
import 'package:ecommerce/widgets/productListRow.dart';
import 'package:flutter/material.dart';

class OrdersViewPosts extends StatelessWidget {
  final List<OrdersChild> posts;
  OrdersViewPosts({Key key, this.posts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        child: Column(
      children: <Widget>[
        _buildFilterWidgets(screenSize),
          Container(
            height: screenSize.height-200,
            width: screenSize.width,
           child:  GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.6),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return _buildProductListRow(posts[index]);
            },
          ),
        ),
      ],
    ));
  }

  _buildFilterWidgets(Size screenSize) {
    return Container(
      width: screenSize.width,
      height: 50,
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildFilterButton("Sırala"),
              Container(
                color: Colors.black,
                width: 2.0,
                height: 24.0,
              ),
              _buildFilterButton("Filtrele"),
            ],
          ),
        ),
      ),
    );
  }

  _buildFilterButton(String title) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Row(
        children: <Widget>[
          Icon(Icons.arrow_drop_down, color: Colors.black),
          SizedBox(
            width: 2.0,
          ),
          Text(title)
        ],
      ),
    );
  }

  _buildProductListRow(OrdersChild pr) {
    return OrdersListRow(
        name: pr.products.Proname,
        currentPrince: pr.products.Proprice,
        orginalPrice: pr.products.Proprice * 2,
        discount: 50,
        imageUrl: pr.products.LProductschild.length>0?pr.products.LProductschild[0].Prochmainimg:"",
        prd:pr.products
        );
  }
}
