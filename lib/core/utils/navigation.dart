import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/widgets/custom_navigation_bar.dart';
import 'package:ebook_app/features/home/presentation/views/home_view.dart';
import 'package:ebook_app/features/library/presentation/view/library_view.dart';
import 'package:ebook_app/features/search/presentation/view/search_view.dart';
import 'package:ebook_app/features/settings/presentation/view/settings_view.dart';
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

    Future<bool> _onWillPop() async {
    return false; 
  }

  final pages = [
    const HomeView(),
    const LibraryView(),
    const SearchView(),
    const SettingsView(),
  ];


  @override
  Widget build(BuildContext context) {
    return navigationBody();
  }

  Widget navigationBody() {
    return  WillPopScope(
    onWillPop: _onWillPop,
      child: Scaffold(
        // extendBody: true,
        body: pages[_currentIndex],
        bottomNavigationBar: CustomNavBar(
          icons: const [
            FontAwesomeIcons.house,
            FontAwesomeIcons.solidHeart,
            FontAwesomeIcons.magnifyingGlass,
            FontAwesomeIcons.gear
          ],
          selectedIndex: _currentIndex,
          onTapIcon: changePage,
          selectedColor: Colors.black,
          unSelectedColor: kSecondaryColor,
        ),
      ),
    );
  }
}
