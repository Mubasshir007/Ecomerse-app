import 'package:cart_function/customclasses/appColor.dart';
import 'package:cart_function/customclasses/uihelper.dart';
import 'package:cart_function/widgets/addToCart.dart';
import 'package:cart_function/widgets/addToFav.dart';
import 'package:cart_function/widgets/customAppbar.dart';
import 'package:flutter/material.dart';

class detailWidget extends StatelessWidget {
  final item;
  const detailWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    print("main");
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: customAppbar(
                ScreenName: item.name,
              )),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiHelper.UiText(
                      data: "Top Quality",
                      textsize: 50,
                      textweight: FontWeight.w100),
                  UiHelper.UiText(
                      data: item.name,
                      textsize: 50,
                      textweight: FontWeight.w600),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * .65,
                        // color: Colors.amberAccent,
                        child: Image.asset(
                          item.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.grey[200]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FavoriteWidget(
                                detail: item,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const Icon(
                                Icons.menu_rounded,
                                size: 30,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          )),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                  UiHelper.UiText(
                      data: "\$ ${item.rate.toString()}/kg",
                      textsize: 20,
                      textweight: FontWeight.w600,
                      textcolor: Appcolor.blue),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          UiHelper.UiText(
                              data: "Description",
                              textsize: 20,
                              textweight: FontWeight.w400),
                          UiHelper.UiText(
                              data: item.description,
                              textsize: 18,
                              textweight: FontWeight.w400,
                              textcolor: Appcolor.Grey),
                          const SizedBox(
                            height: 10,
                          ),
                          UiHelper.UiText(
                              data: "Fact",
                              textsize: 20,
                              textweight: FontWeight.w400),
                          UiHelper.UiText(
                              data: item.fact,
                              textsize: 18,
                              textweight: FontWeight.w400,
                              textcolor: Appcolor.Grey)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: AddToCartWidget(item: item, height: 125),
          ))
        ],
      ),
    );
  }
}
// Padding newMethod(BuildContext context, CartProvider cartProvider) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 300,
//               width: double.infinity,
//               child: Image.asset(
//                 item.image,
//                 fit: BoxFit.contain,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               item.name,
//               style: const TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Text(
//               "Description",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             Text(
//               item.description,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Price",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Text(
//                         "\$ ${item.rate.toString()} /kg",
//                         style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Consumer<CartProvider>(
//                     builder: (ctx, cartProvider, child) {
//                       print("object");
//                       bool isInCarts = cartProvider.isInCarts(item);
//                       // isInCart check krrha hai k item phle se cart mei tw ni hai
//                       //yahan jese he else prform hora hai wese he if wala factor true hojara hai
//                       return ElevatedButton(
//                         onPressed: () {
//                           if (isInCarts) {
//                             null;
//                           } else {
//                             Provider.of<CartProvider>(ctx, listen: false)
//                                 .AddToCart(item);
//                             // cartProvider.AddToCart(item);
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                   content:
//                                       Text(" ${item.name} added to cart!")),
//                             );
//                           }
//                         },
//                         child: Text(isInCarts ? "Added" : "Add to Cart"),
//                       );
//                     },
//                   ),
//                   // ElevatedButton(
//                   //     onPressed: () {

//                   //       if (cartProvider.isInCart(item)) {
//                   //         cartProvider.removeitem(item);
//                   //       } else {
//                   //         cartProvider.AddToCart(item);
//                   //         ScaffoldMessenger.of(context).showSnackBar(
//                   //           SnackBar(
//                   //               content: Text(" ${item.name} added to cart!")),
//                   //         );
//                   //       }
//                   //       ;
//                   //     },
//                   //     child: Text(
//                   //       cartProvider.isInCart(item)
//                   //           ? "Remoddve"
//                   //           : "add to cart",
//                   //       style: TextStyle(
//                   //           fontSize: 20, fontWeight: FontWeight.w600),
//                   //     )),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Add to Favourites",
//                     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       if (cartProvider.IsInFav(item)) {
//                         cartProvider.RemoveFromFav(item);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                               duration: const Duration(milliseconds: 1000),
//                               content:
//                                   Text(" ${item.name} remove from favorite!")),
//                         );
//                       } else {
//                         cartProvider.AddToFav(item);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                               duration: const Duration(milliseconds: 1000),
//                               content:
//                                   Text(" ${item.name} added to favorite!")),
//                         );
//                       }
//                     },
//                     icon: Icon(
//                       cartProvider.IsInFav(item)
//                           ? Icons.favorite
//                           : Icons.favorite_border_outlined,
//                       color: Colors.red,
//                     ),
//                     // icon: Icon(Icons.favorite_border_outlined
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
