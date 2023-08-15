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
        ],
      ),
    );
  }
}
