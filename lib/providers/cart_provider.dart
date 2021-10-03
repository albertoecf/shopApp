import 'package:flutter/foundation.dart';

// define a class of cart item of how should look like
class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

// CartItem.id != Product.Id

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  // para calcular el total del carrito - recorremos los productos del carrito
  // y sumamos sus precios
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total = total + (cartItem.price * cartItem.quantity);
    });
    return total; 
  }

  void addItem(String productId, double price, String title) {
    // si ya tenemos el producto en el carrito no tenemos que agregarlo. tenemos que sumar la
    // cantidad que hay
    if (_items.containsKey(productId)) {
      // change the quantity
      _items.update(
        productId,
        (existingCartItem) => CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            price: existingCartItem.price,
            quantity: existingCartItem.quantity + 1),
      );
    } else {
      // add the product
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}
