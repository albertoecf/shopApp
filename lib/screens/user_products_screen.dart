import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

import '../widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-products';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tus productos'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, i) => UserProductItem(
              productsData.items[i].title, productsData.items[i].imageUrl),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
