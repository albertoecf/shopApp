import 'package:flutter/material.dart';
import 'dart:math';
import '../providers/orders_provider.dart' as ordProv;

class OrderItem extends StatefulWidget {
  final ordProv.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('${widget.order.amount}'),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                _expanded = !_expanded;
              },
            ),
          ),
          // ignore: sdk_version_ui_as_code
          if (_expanded)
            Container(
              height: min(
                widget.order.products.length * 20.0 + 100.0,
                180.0,
              ),
              child: ListView(
                children: widget.order.products
                    .map(
                      (prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            prod.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('${prod.quantity}${prod.price}')
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
