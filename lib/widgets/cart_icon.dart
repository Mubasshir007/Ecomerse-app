import 'package:cart_function/providers/cartModel.dart';
import 'package:cart_function/screens/cartpage.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CartIcon extends StatelessWidget {
  final Color? iconcolor;
  const CartIcon({
    super.key,
    this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return badges.Badge(
      badgeStyle: const badges.BadgeStyle(badgeColor: Color(0xffF9B023)),
      badgeContent: Text(
        cartProvider.cartItems.length.toString(),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
      ),
      position: badges.BadgePosition.topEnd(top: 2, end: 6),
      child: IconButton(
        icon: SvgPicture.asset(
          "assets/images/bag.svg",
          color: iconcolor ?? Colors.black,
        ),
        // icon: Icon(
        //   Icons.shopping_cart,

        // ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Cartpage()),
          );
        },
      ),
    );
  }
}
