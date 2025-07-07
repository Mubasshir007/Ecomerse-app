// ignore_for_file: must_be_immutable

import 'package:cart_function/providers/cartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteWidget extends StatelessWidget {
  FavoriteWidget({super.key, required this.detail, this.size});
  final dynamic detail;
  double? size;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return IconButton(
      onPressed: () {
        if (cartProvider.IsInFav(detail)) {
          cartProvider.RemoveFromFav(detail);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: const Duration(milliseconds: 1000),
                content: Text(" ${detail.name} remove from favorite!")),
          );
        } else {
          cartProvider.AddToFav(detail);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: const Duration(milliseconds: 1000),
                content: Text(" ${detail.name} added to favorite!")),
          );
        }
      },
      icon: Icon(
        size: size ?? 30,
        cartProvider.IsInFav(detail)
            ? Icons.favorite
            : Icons.favorite_border_outlined,
        color: Colors.red,
      ),
      // icon: Icon(Icons.favorite_border_outlined
    );
  }
}
