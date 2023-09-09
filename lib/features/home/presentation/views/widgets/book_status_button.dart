import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/widgets/custom_button.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/box_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookStatusButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const BookStatusButton({
    super.key,
    required this.widget,
    required this.onPressed,
    required this.text,
  });

  final BooksAction widget;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      text: text,
      textColor: Colors.white,
      backgroundColor: kSecondaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(10)).r,
    );
  }
}
