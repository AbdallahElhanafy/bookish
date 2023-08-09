import 'package:ebook_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ),
        SizedBox(
          width: 6.3.h,
        ),
        Text(
          '4.8',
          style: Styles.text16,
        ),
        SizedBox(
          width: 3.h,
        ),
        Text(
          '(254)',
          style: Styles.text14.copyWith(color: Colors.grey),
        )
      ],
    );
  }
}
