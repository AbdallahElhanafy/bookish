import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/widgets/custom_navigation_bar.dart';
import 'package:ebook_app/features/categories/presentation/view/categories_view.dart';
import 'package:ebook_app/features/home/presentation/views/home_view.dart';
import 'package:ebook_app/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final pages = [
    const HomeView(),
   const CategoriesView(),
    const SearchView(),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    return navigationBody();
  }

  Widget navigationBody() {
    return Scaffold(
      // extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: CustomNavBar(
        icons: const [
          FontAwesomeIcons.house,
          FontAwesomeIcons.heart,
          FontAwesomeIcons.magnifyingGlass,
          FontAwesomeIcons.user
        ],
        selectedIndex: _currentIndex,
        onTapIcon: changePage,
        selectedColor: Colors.black,
        unSelectedColor: kSecondaryColor,
      ),
    );
  }
}
