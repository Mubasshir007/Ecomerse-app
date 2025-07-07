import 'package:cart_function/customclasses/uihelper.dart';
import 'package:cart_function/data/detail.dart';

import 'package:cart_function/screens/subcategory.dart';
import 'package:cart_function/widgets/topbar.dart';
import 'package:flutter/material.dart';

// 1st page
class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _Jan22State();
}

class _Jan22State extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth < 350 ? 1 : 2;

    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.blue,
        //   title: Text("Hey,Halal"),
        //   actions: [CartIcon()],
        // ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            topbar(shoppingtype: "By Category"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8,
                        childAspectRatio: 1 / 1.2,
                        crossAxisCount: crossAxisCount,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Subcategory(
                                    item: category,
                                  ),
                                ),
                              );
                            },
                            child: productCart(
                              images: category.images,
                              names: category.name,
                            )
                            // Card(
                            //   child: Column(
                            //     children: [
                            //       Container(
                            //         child: Image.asset(
                            //           category.images,
                            //           fit: BoxFit.scaleDown,
                            //         ),
                            //       ),
                            //       Text(
                            //         category.name,
                            //         style: const TextStyle(
                            //             fontSize: 25,
                            //             fontWeight: FontWeight.w500),
                            //       )
                            //     ],
                            //   ),
                            // )
                            );
                      }),
                ),
              ),
            ),
          ],
        ));
  }
}

class productCart extends StatelessWidget {
  final String images;
  final String names;
  const productCart({
    super.key,
    required this.images,
    required this.names,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffE4DDCB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .15,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                    image: AssetImage(images), fit: BoxFit.fitHeight)),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 1,
            indent: 30,
            endIndent: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          UiHelper.UiText(
              data: names, textsize: 20, textweight: FontWeight.w500),
          UiHelper.UiText(
              data: "Organic",
              textsize: 18,
              textweight: FontWeight.w500,
              textcolor: Colors.grey)
        ],
      ),
    );
  }
}
