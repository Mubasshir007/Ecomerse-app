import 'package:cart_function/customclasses/appColor.dart';
import 'package:cart_function/providers/cartModel.dart';
import 'package:cart_function/screens/itemdetail.dart';
import 'package:cart_function/widgets/topbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class favScreen extends StatefulWidget {
  const favScreen({super.key});

  @override
  State<favScreen> createState() => _favScreenState();
}

class _favScreenState extends State<favScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          topbar(
            shoppingtype: "Favourites",
            topcolor: Appcolor.yellow,
          ),
          Expanded(
            child: cartProvider.fav.isEmpty
                ? const Center(child: Text("Nothing favourites no show"))
                : ListView.builder(
                    itemCount: cartProvider.fav.length,
                    itemBuilder: (context, index) {
                      final favlist = cartProvider.fav[index];
                      return Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailWidget(
                                        item: favlist,
                                      )),
                            );
                          },
                          title: Text(favlist.name),
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {});
                                cartProvider.RemoveFromFav(favlist);
                              },
                              icon: const Icon(Icons.delete)),
                        ),
                      );
                    }),
          ),
        ],
      ),
    );
  }
}
