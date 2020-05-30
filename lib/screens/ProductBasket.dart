import 'package:ecommerce/model/Orders.dart';
import 'package:ecommerce/model/OrdersChild.dart';
import 'package:ecommerce/widgets/orderspost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

List<OrdersChild> parsePosts(String responseBody) {
  return Orders.fromJson(convert.jsonDecode(responseBody)).lOrdersChild;
}

Future<List<OrdersChild>> fetchPosts(
    http.Client client, Future<SharedPreferences> _prefs) async {
 int d = await _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('orderID') ?? 0);
    });
  final response =
      await client.get('http://ecommerence.herokuapp.com/Orders/GetById?id='+ d.toString());

  return compute(parsePosts, response.body);
}
class ProductsBasket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40.0,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Sepet',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body:  
      FutureBuilder<List<OrdersChild>>(
        future: fetchPosts(http.Client(), _prefs),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ?OrdersViewPosts(posts: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}
