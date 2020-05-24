import 'package:ecommerce/Screens/ProductDetail.dart';
import 'package:ecommerce/utilities/constants.dart';
import 'package:flutter/material.dart';

class Routes {
  static final routes = <String,WidgetBuilder>{
    Constants.ROUTE_PROUDCT_DETAIL: (BuildContext context ) => ProductDetail()
  };

}