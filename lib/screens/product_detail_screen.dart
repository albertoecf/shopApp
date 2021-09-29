import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;

  // ProductDetailScreen(this.title);

  // in order to use route names 
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    // To extract info from routename 
    final productId = ModalRoute.of(context).settings.arguments as String;
    // with that productId i want to receive information regarding that product
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
