import '../model/Products.dart';
import '../model/ProductschildArgument.dart';
import '../utilities/constants.dart';
import 'package:flutter/material.dart';

class ProductListRow extends StatelessWidget {
  String name;
  double currentPrince;
  double orginalPrice;
  int discount;
  String imageUrl;
  Products prd;

  ProductListRow(
      {this.name,
      this.currentPrince,
      this.orginalPrice,
      this.discount,
      this.imageUrl,
      this.prd});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildProductItemCard(context)
      ],
    );
  }

  _buildProductItemCard(BuildContext context) {
    return InkWell(
      onTap: () {
  
        Navigator.of(context).pushNamed(Constants.ROUTE_PROUDCT_DETAIL,arguments:ProductschildArgument(this.prd));
      },
      child: Card(
        color: Colors.blueGrey[100],
        child: Column(
          
          children: <Widget>[
            Container(
              child: Image.network(this.imageUrl),
              height: 250,
              width: MediaQuery.of(context).size.width / 2.2,
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.name,
                    style: TextStyle(fontSize: 15.0, color: Colors.black87,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("\$$currentPrince",
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.black87,fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text("\$$orginalPrice",
                          style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.black54,
                              decoration: TextDecoration.lineThrough,fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("$discount\% indirim",
                          style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.black45,fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 5.0,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
