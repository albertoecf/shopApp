import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String title;

  ProductDetailScreen(this.title);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
