import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/bookImg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookImgSection extends StatelessWidget {
  const BookImgSection({super.key, required this.bookModel});

  final NewBookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookImg(
          aspectRatioHeight: 300.h,
          imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail
                  .replaceAll('zoom=1', 'zoom=10') ??
              '',
        ),
        const SizedBox(
          height: 43,
        ),
      ],
    );
  }
}
