import 'package:cart_function/customclasses/uihelper.dart';
import 'package:cart_function/providers/cartModel.dart';
import 'package:cart_function/widgets/cart_icon.dart';
import 'package:flutter/material.dart';

class customAppbar extends StatelessWidget {
  const customAppbar({super.key, this.cartProvider, this.ScreenName});

  final CartProvider? cartProvider;
  final String? ScreenName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.blueGrey[200]),
          child: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
        ),
        Container(
          child: UiHelper.UiText(
              data: (cartProvider == null)
                  ? "$ScreenName"
                  : "Shopping Cart (${cartProvider?.cartItems.length})",
              textsize: 20,
              textweight: FontWeight.w500),
        ),
        const SizedBox(
          width: 20,
        ),
        const CartIcon(),
      ],
    );
  }
}
