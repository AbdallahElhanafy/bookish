import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:ebook_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget child = Container(
      color: Colors.black,
    );
    switch (_currentIndex) {
      case 0:
        child = const HomeView();
        break;

      case 1:
        break;
    }
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
          child: child,
        ),
        bottomNavigationBar: CustomNavigationBar(
          borderRadius: const Radius.circular(20).r,
          iconSize: 30.0.r,
          selectedColor: Colors.white,
          strokeColor: Colors.white,
          unSelectedColor: Color(0xff6c788a),
          backgroundColor: Color(0xff040307),
          items: [
            CustomNavigationBarItem(
              icon: Icon(Icons.home),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.lightbulb_outline),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.search),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.account_circle),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          isFloating: false,
        ));
  }
}
