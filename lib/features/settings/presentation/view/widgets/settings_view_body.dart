import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/features/authentication/presentation/view_models/authentication_cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Settings",
            style: Styles.text20.copyWith(fontWeight: FontWeight.bold),
          ),
          Divider(thickness: 3.r, color: kSecondaryColor),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 40.h,
            color: kSecondaryColor.withOpacity(0.1),
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Sign Out",
                  style: Styles.text18.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<AuthenticationCubit>(context).signOut();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.arrowRight,
                    color: kSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: 40.h,
            color: kSecondaryColor.withOpacity(0.1),
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Dark Mode",
                  style: Styles.text18.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Text('Coming Soon '),
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
              width: double.infinity,
              child: Lottie.asset('assets/images/settings.json'))
        ],
      ),
    );
  }
}
