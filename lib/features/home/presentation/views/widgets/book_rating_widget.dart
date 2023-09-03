import 'package:ebook_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rating,
      required this.count});

  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14.r,
          color: const Color(0xffFFDD4F),
        ),
        SizedBox(
          width: 6.3.h,
        ),
        Text(
          rating.toString(),
          style: Styles.text16,
        ),
        SizedBox(
          width: 3.h,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '($count)',
            style: Styles.text14.copyWith(),
          ),
        )
      ],
    );
  }
}
