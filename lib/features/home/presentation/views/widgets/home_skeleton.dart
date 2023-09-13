import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeSkeleton extends StatelessWidget {
  const HomeSkeleton({super.key, required this.height, required this.aspectHeight});
  final double height;
  final double aspectHeight;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      
      child: SizedBox(
        height: height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(
                    height: aspectHeight,
                    child: Skeletonizer(
                      child: AspectRatio(
                        aspectRatio: 2.5 / 4,
                        child: Image.asset('assets/images/book_skele.jpg'),
                      ),
                    ),
                  ),
                const  Text('assets/images/book'),
                const  Text('assets/images'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}