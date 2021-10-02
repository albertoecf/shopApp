
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // we want to fetch our data from the listener
    // Provider.of(context) - context is a channel of comunication 
    // Provider package allow us to set up a connection to one of provider's classes
    final productsData  = Provider.of<ProductsProvider>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      //what are we going to see in the screen
      itemBuilder: (ctx, i) => ChangeNotifierProvider(create: (c)=> products[i] ,child: ProductItem(
        // products[i].id,
        // products[i].title,
        // products[i].imageUrl,
      ),),
      
      // structure - how many columns?
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
