import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map> cart = [];

  void addToCart(Map item) {
    cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Map item) {
    cart.remove(item);
    notifyListeners();
  }
}
