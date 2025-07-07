import 'package:cart_function/customclasses/appColor.dart';
import 'package:cart_function/customclasses/uihelper.dart';
import 'package:cart_function/widgets/addToCart.dart';
import 'package:cart_function/widgets/addToFav.dart';
import 'package:flutter/material.dart';

class productDetail extends StatelessWidget {
  const productDetail({
    super.key,
    required this.detail,
  });

  final dynamic detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Appcolor.lightgrey),
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, 1.5),
            child: Column(
              children: [
                Container(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                  child: Image.asset(
                    detail.image,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black, // Shadow color
                        spreadRadius: 2, // How much the shadow spreads
                        blurRadius: 10, // Softness of the shadow
                        offset: Offset(0, 4), // Horizontal & vertical offset
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: const Alignment(.9, -.9),
            child: FavoriteWidget(
              detail: detail,
            ),
          ),
          Align(
            alignment: const Alignment(-.8, .3),
            child: UiHelper.UiText(
                data: "\$ ${detail.rate.toString()}",
                textsize: 18,
                textweight: FontWeight.w600),
          ),
          Align(
              alignment: const Alignment(.0, .95),
              child: AddToCartWidget(
                item: detail,
                height: 35,
              )),
          Align(
            alignment: const Alignment(-.8, .5),
            child: Text(
              ("${detail.name}"),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
