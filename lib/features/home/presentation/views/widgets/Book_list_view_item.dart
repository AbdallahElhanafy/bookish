import 'package:ebook_app/core/utils/app_router.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/book_rating_widget.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final NewBookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 210.h,
        child: Stack(
          children: [
            CustomBookImage(
                aspectRatioHeight: 190.h,
                bookAuthor: bookModel.volumeInfo.authors?[0] ?? '',
                bookTitle: bookModel.volumeInfo.title ?? '',
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail.replaceAll('zoom=1', 'zoom=10') ?? ''),
            BookRating(
                rating: bookModel.volumeInfo.averageRating ?? 0,
                count: bookModel.volumeInfo.ratingsCount ?? 0),
          ],
        ),
      ),
    );
  }
}
