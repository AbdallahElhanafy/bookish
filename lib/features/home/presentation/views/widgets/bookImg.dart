import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookImg extends StatelessWidget {
  const BookImg({
    super.key,
    required this.aspectRatioHeight,
    required this.imageUrl,
  });

  final double aspectRatioHeight;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: aspectRatioHeight,
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13.r),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: imageUrl,
            placeholder: (context, url) => Skeletonizer(
              child: Image.asset('assets/images/book_skele.jpg'),
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.question_mark),
          ),
        ),
      ),
    );
  }
}
