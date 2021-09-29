// A provider need to be defined with the help of a class and you then
// you build a new provider based on the class definition 

// 'with' is like extends but allow you to mix/merge things from two classes

import 'package:flutter/material.dart';

import '../models/product.dart';

// Convert normal class in data container / listener



class Products_Provider with ChangeNotifier{
  List<Product> _items = [];
  
  List<Product> get items{
    // we don't want a pointer to _items, instead we want the items items with ...
    return [..._items];
  }

  void addProduct(){
    //_items.add(value);
    // to thel all the widgets which are interested in this info
    notifyListeners();
  }

}