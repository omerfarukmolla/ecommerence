import 'package:ecommerce/Screens/ProductList.dart';
import 'package:flutter/material.dart';

import 'utilities/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Ticaret',
      theme: ThemeData(
     
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductList(),
      routes: Routes.routes,
    );
  }
}

