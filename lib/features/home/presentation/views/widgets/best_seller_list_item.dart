import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/assets.dart';
import 'package:ebook_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 126,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                image: const DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(AssetsData.test),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 30.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Text('Harry Potter and the Goblet of Fire',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.text20.copyWith(fontFamily: kGtSectraFine)),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "J.K. Rowling",
                style: Styles.text14,
              ),
              Row(
                children: [
                  Text(
                    "19.99 \$",
                    style: Styles.text20.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
