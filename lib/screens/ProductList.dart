import 'dart:convert';

import '../model/Orders.dart';
import '../utilities/constants.dart';
import '../widgets/listpost.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../model/Products.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Products> parsePosts(String responseBody) {
  final parsed = convert.jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Products>((json) => Products.fromJson(json)).toList();
}

Orders parseOrders(String responseBody) {
  return Orders.fromJson(convert.jsonDecode(responseBody));
}

Future<List<Products>> fetchPosts(
    http.Client client, Future<SharedPreferences> _prefs) async {
  final response =
      await client.get('http://ecommerence.herokuapp.com/Products');
  var now = new DateTime.now();
  final SharedPreferences prefs = await _prefs;
  //prefs.clear();
  if (prefs.getInt("orderID") == null) {
    Orders order;
    final responseOrder = await client.post(
      'http://ecommerence.herokuapp.com/Orders/Insert',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "orddatetime": now.toIso8601String(),
        "ordamount": "0"
      }));
    await compute(parseOrders, responseOrder.body)
        .then((value) => order = value);
    prefs.setInt("orderID", order.ordid);
  }
  return compute(parsePosts, response.body);
}

class ProductList extends StatelessWidget {
  BuildContext context;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        
        title: Text(
          "Zehaşe BUTİK",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.of(context).pushNamed(Constants.ROUTE_PRODUCT_BASKET);
            },
          )
        ],
        backgroundColor: Colors.blueAccent[100],
        centerTitle: true,
      ),
      body: FutureBuilder<List<Products>>(
        future: fetchPosts(http.Client(), _prefs),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListViewPosts(posts: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
      
    );
  }
}
