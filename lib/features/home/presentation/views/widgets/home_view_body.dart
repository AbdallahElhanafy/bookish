import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/assets.dart';
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
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  height: 100.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xff8E2DE2), Color(0xff4A00E0)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8.0, top: 8, bottom: 8)
                                .r,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome to ',
                              style: Styles.text18.copyWith(
                                  color: kPrimaryColor,
                                  fontSize: 23.sp,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Bookish!',
                              style: Styles.text30.copyWith(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0).r,
                        child: SizedBox(child: Image.asset(AssetsData.homeImg)),
                      ),
                    ],
                  ),
                ),
                const CustomAppBar(),
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10.h,
                ),
                const FeaturedBooksListView(),
                Text(
                  'Newest Books',
                  style: Styles.text18,
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10.h,
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
