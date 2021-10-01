import 'package:flutter/material.dart';
import './screens/products_overview_screen.dart';


import './screens/product_detail_screen.dart';

// we need to attach the listener to the root widget (product_overview is going to use this data, and my app is the parental widget)
import './providers/products_provider.dart';
// to user listener
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // We need to rap our materialApp with a provider
    return ChangeNotifierProvider(
      // we need to create an instance of the listener class - ProductsProvider()
      create: (ctx) => ProductsProvider(),
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          }),
    );
  }
}
