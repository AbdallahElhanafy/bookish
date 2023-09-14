import 'package:ebook_app/constants.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/box_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookStatusButton extends StatelessWidget {
  final Function()? onPressed;

  final icon;

  const BookStatusButton({
    super.key,
    required this.widget,
    required this.onPressed,
    required this.icon,
  });

  final BooksAction widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.only(
            topRight: const Radius.circular(10).r,
            bottomRight: const Radius.circular(10).r),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 25.r,
          color: Colors.white,
        ),
      ),
    );
  }
}
