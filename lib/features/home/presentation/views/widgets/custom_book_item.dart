import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/bookImg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage(
      {super.key,
      required this.imageUrl,
      required this.bookTitle,
      required this.bookAuthor,
      required this.aspectRatioHeight});
  final String imageUrl;
  final String bookTitle;
  final String bookAuthor;
  final double aspectRatioHeight;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookImg(aspectRatioHeight: aspectRatioHeight, imageUrl: imageUrl),
          const SizedBox(height: 8),
          SizedBox(
            width: 140,
            child: Text(
              bookTitle,
              softWrap: true,
              style: Styles.text14.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            bookAuthor,
            style: Styles.text13.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

