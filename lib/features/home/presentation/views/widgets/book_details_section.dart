import 'package:ebook_app/core/utils/functions/BookPrice.dart';
import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/data_box.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;

import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final NewBookModel bookModel;
  @override
  Widget build(BuildContext context) {
    final document = parse(bookModel.volumeInfo.description ?? '');
    final descriptionPlainText = document.body?.text ?? '';
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Text(
                bookModel.volumeInfo.authors?[0] ?? '',
                style: Styles.text18.copyWith(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.w300),
              ),
            ),
            Center(
              child: Text(
                bookModel.volumeInfo.title!,
                style: Styles.text20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DataBox(
                      data:
                          bookModel.volumeInfo.ratingsCount?.toString() ?? '0',
                      dataTitle: 'Rating Count',
                    ),
                  ),
                  Expanded(
                    child: DataBox(
                      data: bookModel.volumeInfo.publishedDate?.toString() ??
                          'N/A',
                      dataTitle: 'Publish Date',
                    ),
                  ),
                  Expanded(
                    child: DataBox(
                      data: bookModel.volumeInfo.pageCount?.toString() ?? 'N/A',
                      dataTitle: 'Pages',
                    ),
                  ),
                  Expanded(
                    child: DataBox(
                      data: bookPrice(bookModel),
                      dataTitle: 'Price',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BooksAction(bookModel: bookModel),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              thickness: 2,
              color: Colors.grey[300],
            ),
            Text(
              'Description',
              style: Styles.text18,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              descriptionPlainText,
              textAlign: TextAlign.justify,
              style: Styles.text16.copyWith(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
