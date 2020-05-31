import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../model/Products.dart';
import 'package:flutter/material.dart';

class OrdersListRow extends StatelessWidget {
  String name;
  double currentPrince;
  double orginalPrice;
  int discount;
  String imageUrl;
  int ordchid;
  Products prd;

  OrdersListRow(
      {this.name,
      this.currentPrince,
      this.orginalPrice,
      this.discount,
      this.imageUrl,
      this.ordchid,
      this.prd});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[_buildProductitemForBasket(context, screenSize)],
    );
  }

  _buildProductitemForBasket(BuildContext context, Size screenSize) {
    return Container(
      width: screenSize.width,
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              child: Image.network(this.imageUrl),
              height: 50,
              width: 150,
            ),
            SizedBox(height: 2.0),
            Padding(
              padding: EdgeInsets.only(left: 1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.name,
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("\$$currentPrince",
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.black)),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text("\$$orginalPrice",
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough)),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text("$discount\% indirim",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                          )),
                      SizedBox(
                        width: 20.0,
                      ),
                     
                      SizedBox(
                        width: 8.0,
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
