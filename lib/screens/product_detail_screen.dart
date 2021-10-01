import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;

  // ProductDetailScreen(this.title);

  // in order to use route names
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    // To extract info from routename
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<ProductsProvider>(context, listen: false,).findById(productId);
    // with that productId i want to receive information regarding that product
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
