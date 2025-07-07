import 'package:cart_function/customclasses/appColor.dart';
import 'package:cart_function/customclasses/uihelper.dart';
import 'package:cart_function/widgets/cart_icon.dart';
import 'package:flutter/widgets.dart';

class topbar extends StatelessWidget {
  const topbar({super.key, required this.shoppingtype, this.topcolor});
  final String shoppingtype;
  final Color? topcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      decoration: BoxDecoration(
          color: topcolor ?? Appcolor.blue,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiHelper.UiText(
                    data: "Hey,Mubasshir",
                    textsize: 22,
                    textweight: FontWeight.w600,
                    textcolor: Appcolor.White),
                const CartIcon(
                  iconcolor: Appcolor.White,
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            UiHelper.UiText(
                data: "Shop by",
                textsize: 40,
                textweight: FontWeight.w300,
                textcolor: Appcolor.White),
            UiHelper.UiText(
                data: shoppingtype,
                textsize: 40,
                textweight: FontWeight.w600,
                textcolor: Appcolor.White),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
