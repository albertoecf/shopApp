import 'package:flutter/material.dart';
// to user listener
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
// we need to attach the listener to the root widget (product_overview is going to use this data, and my app is the parental widget)
import './providers/products_provider.dart';
import './providers/cart_provider.dart';
import './screens/cart_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // We need to rap our materialApp with a provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // if context info not necesary we can use .value - this is the rigth aproach for lists / grids..
          //value: ProductsProvider(),

          // we need to create an instance of the listener class - ProductsProvider()
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
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
            CartScreen.routeName : (ctx) => CartScreen(), 
          }),
    );
  }
}
