import 'dart:async';
import '../model/Orders.dart';
import '../widgets/orderspost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

GlobalKey<dynamic> globalKey = GlobalKey();
class ProductsBasket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 
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
          backgroundColor: Colors.blueAccent[100],
        ),
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: OrdersViewPosts(key: globalKey)
   
        ));
  }

  Future<Orders> _onRefresh() {
    Completer<Orders> completer = new Completer<Orders>();
    Timer timer = new Timer(new Duration(seconds: 9), () {
      completer.complete();
    });
    return globalKey.currentState.fetchPosts();
    ///return completer.future;
  }
}
