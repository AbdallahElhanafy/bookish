import 'package:ebook_app/core/utils/app_router.dart';
import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/bookImg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:html/parser.dart';

class BookSearchItem extends StatelessWidget {
  BookSearchItem(
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
    final document = parse(bookModel.volumeInfo.description ?? '');
    final descriptionPlainText = document.body?.text ?? '';
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              height: MediaQuery.of(context).size.height * 0.22,
              child: Padding(
                padding: const EdgeInsets.all(10.0).r,
                child: Row(
                  children: [
                    SizedBox(
                      width: 110.h,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  bookTitle,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: Styles.text16
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  bookAuthor,
                                  maxLines: 1,
                                  style: Styles.text14.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "Publish Date: ${bookModel.volumeInfo.publishedDate}",
                                  maxLines: 1,
                                  style: Styles.text13.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    descriptionPlainText,
                                    style: Styles.text14,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0).r,
              child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: BookImg(aspectRatioHeight: 150.h, imageUrl: imageUrl)),
            ),
          ),
        ]),
      ),
    );
  }
}
