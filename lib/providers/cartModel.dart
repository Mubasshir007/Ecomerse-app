import 'package:cart_function/data/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final Item item;
  int quantity;
  CartItem({required this.item, required this.quantity});
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;

  void AddToCart(Item item) {
    bool itemExist = _cartItems.any((test) => test.item.name == item.name);
    if (itemExist) {
      for (var cartItem in _cartItems) {
        if (cartItem.item.name == item.name) {
          cartItem.quantity += 1;
        }
      }
    } else {
      _cartItems.add(CartItem(item: item, quantity: 1));
    }
    notifyListeners();
  }

  void removeitem(Item item) {
    _cartItems.removeWhere((test) => test.item.name == item.name);
    notifyListeners();
  }

  bool isInCarts(Item item) {
    return _cartItems.any((test) => test.item.name == item.name);
  }

  void Increament(Item item) {
    for (var cartItem in _cartItems) {
      if (cartItem.item.name == item.name) {
        cartItem.quantity += 1;
      }
    }
    notifyListeners();
    // return;
  }

  void Decreament(Item item) {
    for (var cartItem in _cartItems) {
      if (cartItem.item.name == item.name) {
        // if (cartItem.quantity == 1) {
        //   removeitem(item);
        // } else {
        cartItem.quantity -= 1;
        // }
      }
    }
    notifyListeners();
    return;
  }

  final List<Item> _fav = [];
  List<Item> get fav => _fav;

  void AddToFav(Item item) {
    _fav.add(item);
    notifyListeners();
  }

  void RemoveFromFav(Item item) {
    _fav.remove(item);
    notifyListeners();
  }

  bool IsInFav(Item item) {
    return _fav.contains(item);
  }

  double getTotalPrice() {
    return _cartItems.fold(0, (total, cartItem) {
      return total + (cartItem.quantity * cartItem.item.rate);
    });
  }
}
