import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/similar_box_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarBookSection extends StatelessWidget {
  const SimilarBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'You can also like:',
            style: Styles.text14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        const SimilarBoxListView(),
      ],
    );
  }
}
