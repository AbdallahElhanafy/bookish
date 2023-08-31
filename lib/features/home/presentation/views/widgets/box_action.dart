import 'package:ebook_app/core/utils/functions/launch_url.dart';
import 'package:ebook_app/core/widgets/custom_button.dart';
import 'package:ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Free',
              textColor: Colors.white,
              backgroundColor: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r)),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
               // launchCustomUrl(context, bookModel.volumeInfo.previewLink);
              // launchCustomUrl(context, bookModel.accessInfo!.epub!.downloadLink ?? '');
              launchCustomUrl(context, bookModel.accessInfo!.webReaderLink);
              },
              text: getText(bookModel),
              textColor: Colors.white,
              backgroundColor: Colors.orange,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r)),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
