import 'package:cart_function/providers/cartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddToCartWidget extends StatelessWidget {
  AddToCartWidget({super.key, required this.item, required this.height});

  final dynamic item;
  double height;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (ctx, cartProvider, child) {
      print("object");
      bool isInCarts = cartProvider.isInCarts(item);
      return GestureDetector(
        onTap: () {
          if (isInCarts) {
            null;
          } else {
            Provider.of<CartProvider>(ctx, listen: false).AddToCart(item);
            // cartProvider.AddToCart(item);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(" ${item.name} added to cart!")),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: height,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: isInCarts ? const Color(0xff2A4BA0) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xff2A4BA0), width: 1.2),
              ),
              child: Center(
                child: Text(
                  isInCarts ? "Added" : "Add To Cart",
                  style: TextStyle(
                    fontSize: 18,
                    color: isInCarts ? Colors.white : const Color(0xff2A4BA0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
