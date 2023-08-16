import 'package:ebook_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: '19.99\$',
              textColor: Colors.black,
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r)),
            ),
          ),
          Expanded(
            child: CustomButton(
              text: 'Free Preview',
              textColor: Colors.white,
              backgroundColor: Colors.orange,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r)),
            ),
          ),
        ],
      ),
    );
  }
}
