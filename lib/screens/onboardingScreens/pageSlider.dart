import 'package:cart_function/customclasses/uihelper.dart';
import 'package:cart_function/screens/bottonNav.dart';
import 'package:cart_function/screens/onboardingScreens/page1.dart';
import 'package:cart_function/screens/onboardingScreens/page2.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageSlider extends StatelessWidget {
  const PageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      backgroundColor: const Color(0xff2A4BA0),
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: const [FirstScreen(), SecondScreen()],
          ),
          Container(
            alignment: const Alignment(-0.8, -0.2),
            child: SmoothPageIndicator(
              controller: controller,
              count: 2,
              effect: const WormEffect(
                  dotHeight: 5,
                  dotWidth: 25,
                  type: WormType.normal,
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey),
            ),
          ),
          Container(
            alignment: const Alignment(0, .9),
            child: UiHelper.ElButton(
                buttontext: "Get Started",
                callback: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const bottomcheck()),
                  );
                },
                buttoncolor: Colors.white),
          ),
        ],
      ),
    );
  }
}
