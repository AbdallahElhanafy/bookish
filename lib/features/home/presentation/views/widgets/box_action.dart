import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/functions/launch_url.dart';
import 'package:ebook_app/core/widgets/custom_button.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksAction extends StatelessWidget {
 const BooksAction({super.key, required this.bookModel});

  final NewBookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () async {
              // launchCustomUrl(context, bookModel.volumeInfo.previewLink);
              // launchCustomUrl(context, bookModel.accessInfo!.epub!.downloadLink ?? '');
              launchCustomUrl(context, bookModel.accessInfo!.webReaderLink);
            },
            text: getText(bookModel),
            textColor: Colors.white,
            backgroundColor: kSecondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)).r,
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
            backgroundColor: kSecondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)).r,
          ),
          
        ),
      ],
    );
  }

  String getText(NewBookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
