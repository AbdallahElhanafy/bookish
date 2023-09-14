import 'package:ebook_app/features/home/presentation/views/widgets/bookImg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchListViewSkeleton extends StatelessWidget {
  const SearchListViewSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0).r,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.grey[200],
                      ),
                      height: MediaQuery.of(context).size.height * 0.22,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0).r,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.35),
                                SizedBox(
                                  width: 150.w,
                                  child: const Text(
                                    'bookTitle',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                ),
                                SizedBox(
                                  width: 100.w,
                                  child: const Text(
                                    'bookAuthor',
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                ),
                                const Text(
                                  "Publish Date: ",
                                  maxLines: 1,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: const Text(
                                    'bookModel.volumeInfo.description!',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0).r,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.grey[300],
                        ),
                        child: BookImg(aspectRatioHeight: 150.h, imageUrl: ''),
                      ),
                    ),
                  ),
                ]),
              ));
        },
      ),
    );
  }
}
