import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:cart_function/customclasses/appColor.dart';
import 'package:cart_function/screens/fav.dart';
import 'package:cart_function/screens/category.dart';
import 'package:cart_function/screens/home.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const Home(),
    const Category(),
    const favScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        // Optional: Customize the appearance
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed, // For more than 3 items
      ),
    );
  }
}

// Example pages for the navigation
class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'category Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Text(
          'More option',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class bottomcheck extends StatefulWidget {
  const bottomcheck({super.key});

  @override
  State<bottomcheck> createState() => _bottomcheckState();
}

class _bottomcheckState extends State<bottomcheck> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const Category(),
    const favScreen(),
    const PageThree()
  ];

  // final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: _pages[_currentIndex],
        bottomNavigationBar: AnimatedNotchBottomBar(
          notchBottomBarController: _controller,
          bottomBarItems: const [
            BottomBarItem(
              inActiveItem: Icon(Icons.home_outlined),
              activeItem: Icon(
                Icons.home_filled,
                color: Appcolor.yellow,
              ),
            ),
            BottomBarItem(
                inActiveItem: Icon(Icons.category_outlined),
                activeItem: Icon(
                  Icons.category,
                  color: Appcolor.yellow,
                )),
            BottomBarItem(
                inActiveItem: Icon(Icons.favorite_border),
                activeItem: Icon(
                  Icons.favorite,
                  color: Appcolor.yellow,
                )),
            BottomBarItem(
                inActiveItem: Icon(Icons.more_horiz_outlined),
                activeItem: Icon(
                  Icons.more_horiz_rounded,
                  color: Appcolor.yellow,
                ))
          ],
          onTap: (index) {
            _currentIndex = index;
            setState(() {});
          },
          removeMargins: true,
          kIconSize: 20,
          kBottomRadius: 0,
          color: Appcolor.White,
          notchColor: Colors.black,
          shadowElevation: 0,
        ));
  }
}
