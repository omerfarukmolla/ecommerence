import 'dart:async';
import 'package:flutter/foundation.dart';
import '../model/Orders.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/OrdersChild.dart';
import '../widgets/OrdersListRow.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Orders parsePosts(String responseBody) {
  return Orders.fromJson(convert.jsonDecode(responseBody));
}

class OrdersViewPosts extends StatefulWidget {
  OrdersViewPosts({Key key}) : super(key: key);
  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<OrdersViewPosts> {
  Orders ord = new Orders();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //this.ord = new Orders(lOrdersChild: new List<OrdersChild>());
    this.fetchPosts();
  }

  Future<Orders> fetchPosts() async {
    setState(() {
      this.ord =
          new Orders(ordamount: 0, lOrdersChild: new List<OrdersChild>());
    });

    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    int d = await _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('orderID') ?? 0);
    });
    final response = await http.Client().get(
        'http://ecommerence.herokuapp.com/Orders/GetById?id=' + d.toString());
    setState(() {
      this.ord = parsePosts(response.body);
    });
    return this.ord;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          height: screenSize.height - 100,
          width: screenSize.width,
          child: ListView.builder(
            itemCount: ord.lOrdersChild.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: new ObjectKey(ord.lOrdersChild[index]),
                child: _buildProductListRow(ord.lOrdersChild[index]),
                onDismissed: (direction) {
                  setState(() {
                    http.Client().delete(
                      'http://ecommerence.herokuapp.com/OrdersChild/DeleteById?id=' +
                          ord.lOrdersChild[index].ordchid.toString(),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                    );
                    ord.lOrdersChild.removeAt(index);
                    _showDialog("Ürüm Silindi.");
                    new Future.delayed(const Duration(seconds: 1))
                        .then((value) => fetchPosts());
                  });
                },
              );
            },
          ),
        ),
        _buildOrderAmount(),
      ],
    ));
  }

  void _showDialog(String msg) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Mesaj"),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
 
  _buildProductListRow(OrdersChild pr) {
    return OrdersListRow(
      name: pr.products.Proname,
      currentPrince: pr.products.Proprice,
      orginalPrice: pr.products.Proprice * 2,
      discount: 50,
      imageUrl: pr.products.LProductschild.length > 0
          ? pr.products.LProductschild[0].Prochmainimg
          : "",
      prd: pr.products,
      ordchid: pr.ordchid,
    );
  }

  _buildOrderAmount() {
    return Container(
      child: Text(
        "Sepet Tutarı = " + ord.ordamount.toString(),
      style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold))
    );
  }
}
