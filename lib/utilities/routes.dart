import 'package:ecommerce/Screens/ProductDetail.dart';
import 'package:ecommerce/model/ProductschildArgument.dart';
import 'package:ecommerce/screens/ProductList.dart';
import 'package:flutter/material.dart';

Widget makeRoute(
    {@required BuildContext context,
    @required String routeName,
    Object arguments}) {
  final Widget child =
      _buildRoute(context: context, routeName: routeName, arguments: arguments);
  return child;
}

Widget _buildRoute({
  @required BuildContext context,
  @required String routeName,
  Object arguments,
}) {
  switch (routeName) {
    case '/':
      return ProductList();
    case '/productDetail':
      ProductschildArgument article = arguments as ProductschildArgument;
      return ProductDetail(arguments:article);
    default:
      throw 'Route $routeName is not defined';
  }
}