import 'package:ebook_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ).r,
      child: Row(
        children: [
          Text(
            'Discover',
            style: Styles.text18.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
