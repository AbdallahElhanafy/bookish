import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/assets.dart';
import 'package:ebook_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Settings",
            style: Styles.text20.copyWith(fontWeight: FontWeight.bold),
          ),
          Divider(thickness: 3.r, color: kSecondaryColor),
          const SizedBox(
            height: 20,
          ),
          Divider(thickness: 3.r, color: Colors.grey[300]),
          SizedBox(
            height: 30.w,
          ),
          Row(
            children: [
              Text(
                "Dark Mode",
                style: Styles.text18.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                'Coming Soon ',
                style: Styles.text16,
              ),
            ],
          ),
          Divider(thickness: 3.r, color: Colors.grey[300]),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: Image.asset(AssetsData.homeImg),
          )
        ],
      ),
    );
  }
}
