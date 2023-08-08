import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/assets.dart';
import 'package:ebook_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';


class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
       SplashLogo(),
      ],
    );
  }
}

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.w,
      height: 400.h,
      child: AnimatedSplashScreen(
        splash: AssetsData.logo,
        nextScreen: const HomeView(),
        pageTransitionType: PageTransitionType.leftToRight,
        splashTransition: SplashTransition.slideTransition,
        duration: 3000,
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
