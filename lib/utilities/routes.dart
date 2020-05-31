import '../Screens/ProductDetail.dart';
import '../model/ProductschildArgument.dart';
import '../screens/ProductBasket.dart';
import '../screens/ProductList.dart';
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
      return ProductDetail(arguments: article);
    case '/ProductsBasket':
      return ProductsBasket();
    default:
      throw 'Route $routeName is not defined';
  }
}
