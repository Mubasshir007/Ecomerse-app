import 'package:cart_function/customclasses/uihelper.dart';
import 'package:cart_function/providers/cartModel.dart';
import 'package:cart_function/screens/itemdetail.dart';
import 'package:cart_function/widgets/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    print("cart page");
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 1, child: customAppbar(cartProvider: cartProvider)),
          Expanded(
            flex: 6,
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final itemcart = cartProvider.cartItems[index];

                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detailWidget(
                              item: itemcart.item,
// hm ne sirf item :itemcart islye ni kiya quke itemcart ki list empty hai jis pr add to cart krne se item ki detail
//or quantity gir rhi hai pr hamey yahan sirf
//item ki detail chahiye qk detail pg phle se bni huwi hai or hm sirf usse istemaal krrhe hain
                            ),
                          ),
                        );
                      },
                      contentPadding: const EdgeInsets.all(10),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          itemcart.item.image,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        itemcart.item.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      subtitle: Text(
                        '\$${itemcart.item.rate}',
                        style: const TextStyle(color: Colors.black54),
                      ),
                      trailing:
                          Consumer<CartProvider>(builder: (ctx, _, child) {
                        print("objectify");
                        // final updatedCartItem =
                        //     cartProvider.cartItems.firstWhere(
                        //   (item) => item.item.name == itemcart.item.name,
                        //   orElse: () => itemcart,
                        // );

                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    // Provider.of<CartProvider>(ctx,listen: false).Increament(itemcart.item); // alternamte
                                    cartProvider.Increament(itemcart.item);

                                    // setState(() {
                                    //   itemcart.quantity += 1;
                                    // });
                                  },
                                  child: const Text(
                                    "+",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                            Text(
                              // updatedCartItem.quantity.toString(),
                              itemcart.quantity.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    // if (itemcart.quantity == 1) {
                                    //   cartProvider.removeitem(itemcart.item);
                                    //   setState(() {});
                                    // } else {
                                    //   itemcart.quantity -= 1;
                                    //   setState(() {});
                                    // }
// is mei bhi kaam wohi hoga lakin if else dono mei set state ki wajah kr jitni dafa deceament hoga utni baar poori
//screen rebuild hogi
// //bad approach

                                    // cartProvider.Decreament(itemcart.item);
                                    // setState(() {});
                                    if (itemcart.quantity == 1) {
                                      cartProvider.removeitem(itemcart.item);
                                      setState(() {});
                                    } else {
                                      Provider.of<CartProvider>(ctx,
                                              listen: false)
                                          .Decreament(itemcart.item);
                                    }

// is mei decrement ka 1 function bna dya provider mei or iise use hm ne consumer mei kiya hai tw an jb bhi decreamnt
// call hogi tw sirf consumer rebuild hogi or if mei setstate lagaya tw ab jb kabhi if call hogi tbhi poori
// screen rebuild hogi wrna sirf consumer rebuild hoti raheigi
//good approach
                                  },
                                  child: const Text(
                                    "-",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          ],
                        );
                      })),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.grey[200]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UiHelper.UiText(
                                data: "Subtotall",
                                textsize: 18,
                                textweight: FontWeight.w500),
                            Consumer<CartProvider>(builder: (ctxx, _, child) {
                              return UiHelper.UiText(
                                  data:
                                      "\$${cartProvider.getTotalPrice().toStringAsFixed(2)}",
                                  textsize: 18,
                                  textweight: FontWeight.w500);
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UiHelper.UiText(
                                data: "Delivery",
                                textsize: 18,
                                textweight: FontWeight.w500),
                            UiHelper.UiText(
                                data: "\$2.00",
                                textsize: 18,
                                textweight: FontWeight.w500)
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UiHelper.UiText(
                                data: "Totall",
                                textsize: 20,
                                textweight: FontWeight.w500),
                            Consumer<CartProvider>(builder: (ctxx, _, child) {
                              return UiHelper.UiText(
                                  data:
                                      "\$${cartProvider.getTotalPrice() + 2.01}",
                                  textsize: 18,
                                  textweight: FontWeight.w500);
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  UiHelper.ElButton(
                      buttontext: "Proceed",
                      callback: () {},
                      buttoncolor: Colors.blue)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
