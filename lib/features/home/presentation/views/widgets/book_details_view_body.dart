import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_book_item.dart';
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
        ],
      ),
    );
  }
}
