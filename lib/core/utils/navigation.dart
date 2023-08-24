import 'package:ebook_app/core/widgets/custom_navigation_bar.dart';
import 'package:ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:ebook_app/features/home/presentation/views/home_view.dart';
import 'package:ebook_app/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  final pages = [const HomeView(), Container(), SearchView(), Container()];

  @override
  Widget build(BuildContext context) {
    Widget child = Container(
      color: Colors.black,
    );

    // double displayWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 30).r,
      child: Scaffold(
        extendBody: true,
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
          unSelectedColor: Colors.orange,
        ),
      ),
    );
  }
}
