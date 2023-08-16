import 'package:ebook_app/features/home/presentation/views/widgets/books_details_section.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0).r,
            child: Column(
              children: [
                const CustomAppBarBookDetails(),
                const BookDetailsSection(),
                SizedBox(
                  height: 50.h,
                ),
                const SimilarBookSection()
              ],
            ),
          ),
        )
      ],
    );
  }
}



