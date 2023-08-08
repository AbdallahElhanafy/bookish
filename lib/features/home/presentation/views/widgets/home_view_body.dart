import 'package:ebook_app/core/utils/assets.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_listitem_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [CustomAppBar(), CustomListViewItem()],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40).r,
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: 18.h,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 24.r,
            ),
          )
        ],
      ),
    );
  }
}
