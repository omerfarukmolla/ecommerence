
import 'package:flutter/material.dart';

import 'screens/ProductList.dart';
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
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => makeRoute(
                context: context,
                routeName: settings.name,
                arguments: settings.arguments,
              ),
          maintainState: true,
          fullscreenDialog: false,
        );
      },
    );
  }
}

