import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/app_router.dart';
import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/core/widgets/custom_button.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/bookImg.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/book_rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookSearchItem extends StatelessWidget {
  const BookSearchItem(
      {super.key,
      required this.imageUrl,
      required this.bookTitle,
      required this.bookAuthor,
      required this.rating,
      required this.count,
      required this.bookModel});

  final String imageUrl;
  final String bookTitle;
  final String bookAuthor;
  final num rating;
  final int count;

  final NewBookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0).r,
            child: BookImg(aspectRatioHeight: 190, imageUrl: imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150.w,
                  child: Text(
                    bookTitle,
                    maxLines: 2,
                    style: Styles.text16.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        bookAuthor,
                        maxLines: 1,
                        style: Styles.text14,
                      ),
                    ),
                    BookRating(rating: rating, count: count),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 50,
                  width: 150.w,
                  child: CustomButton(
                    backgroundColor: kSecondaryColor,
                    text: 'Book Details',
                    textColor: kPrimaryColor,
                    onPressed: () {
                      GoRouter.of(context)
                          .push(AppRouter.kBookDetailsView, extra: bookModel);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
