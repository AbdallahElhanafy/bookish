import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/newest_books_list.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // عشان اعمل سكرول للشاشة كلها مش الليست بس
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const FeaturedBooksListView(),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'Newest Books',
                  style: Styles.text18,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0).r,
            child: const NewestBooksListView(),
          ),
        ),
      ],
    );
  }
}
