import 'package:cart_function/screens/itemdetail.dart';
import 'package:cart_function/widgets/customAppbar.dart';
import 'package:cart_function/widgets/subProductDetail.dart';
import 'package:flutter/material.dart';

class Subcategory extends StatelessWidget {
  final item;
  const Subcategory({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    print("data");
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            flex: 1,
            child: customAppbar(
              ScreenName: item.name,
            )),
        Expanded(
          flex: 9,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2),
                itemCount: item.items.length,
                itemBuilder: (context, index) {
                  final detail = item.items[index];
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => detailWidget(
                              item: detail,
                            ),
                          ),
                        );
                      },
                      child: productDetail(detail: detail));
                }),
          ),
        ),
      ],
    ));
  }
}
