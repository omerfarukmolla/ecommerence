import '../model/Products.dart';
import 'package:flutter/material.dart';

class OrdersListRow extends StatelessWidget {
  String name;
  double currentPrince;
  double orginalPrice;
  int discount;
  String imageUrl;
  Products prd;

  OrdersListRow(
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
        _buildProductitemForBasket(context)
      ],
    );
  }

  _buildProductitemForBasket(BuildContext context) {
    return InkWell(
      onTap: () {
  
        //Navigator.of(context).pushNamed("/",arguments:ProductschildArgument(this.prd));
      },
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              child: Image.network(this.imageUrl),
              height: 50,
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
                              color: Colors.grey,)),
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
