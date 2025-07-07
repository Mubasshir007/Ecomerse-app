import 'package:cart_function/customclasses/appColor.dart';
import 'package:cart_function/customclasses/uihelper.dart';
import 'package:cart_function/data/detail.dart';
import 'package:cart_function/screens/itemdetail.dart';
import 'package:cart_function/widgets/subProductDetail.dart';
import 'package:cart_function/widgets/topbar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final recommendedItems = DataRepository.getRecommendedItems();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topbar(
            shoppingtype: "Recommendation",
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(16),
                    height: MediaQuery.of(context).size.height * .18,
                    decoration: BoxDecoration(
                        color: Appcolor.yellow,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/offer.png"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            UiHelper.UiText(
                                data: 'Get',
                                textsize: 20,
                                textweight: FontWeight.w300,
                                textcolor: Appcolor.White),
                            UiHelper.UiText(
                                data: '50% OFF',
                                textsize: 26,
                                textweight: FontWeight.w800,
                                textcolor: Appcolor.White),
                            UiHelper.UiText(
                                data: ' On first 03 offer',
                                textsize: 15,
                                textweight: FontWeight.w500,
                                textcolor: Appcolor.White)
                          ],
                        )
                      ],
                    ),
                  ),
                  UiHelper.UiText(
                      data: "  Recommended",
                      textsize: 30,
                      textweight: FontWeight.w400),
                  SizedBox(
                      height: 260,
                      child: gview(recommendedItems: recommendedItems)),
                  UiHelper.UiText(
                      data: "  Recommended",
                      textsize: 30,
                      textweight: FontWeight.w400),
                  SizedBox(
                      height: 260,
                      child: gview(recommendedItems: recommendedItems)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class gview extends StatelessWidget {
  const gview({
    super.key,
    required this.recommendedItems,
  });

  final List<Item> recommendedItems;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.1 / .6,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 1,
          ),
          itemCount: recommendedItems.length,
          itemBuilder: (context, index) {
            final detail = recommendedItems[index];
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
    ));
  }
}
