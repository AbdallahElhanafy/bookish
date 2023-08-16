import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/book_rating_widget.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/box_action.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/similar_box_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0).r,
      child: Column(
        children: [
          const CustomAppBarBookDetails(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 76.0).r,
            child: const CustomBookImage(),
          ),
          const SizedBox(
            height: 43,
          ),
          Text(
            'The Jungle Book',
            style: Styles.text30,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            'Rudyard Kipling',
            style: Styles.text18.copyWith(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 18,
          ),
          const BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(
            height: 37.h,
          ),
          const BooksAction(),
          SizedBox(
            height: 50.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You can also like:',
              style: Styles.text14.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
         const  SimilarBoxListView(),
        ],
      ),
    );
  }
}


