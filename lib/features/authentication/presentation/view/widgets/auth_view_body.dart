import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/Text_field.dart';
import 'package:ebook_app/core/utils/assets.dart';
import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/core/widgets/custom_button.dart';
import 'package:ebook_app/features/authentication/presentation/view_models/authentication_cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthViewBody extends StatefulWidget {
  AuthViewBody({super.key});

  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    // dispose the controllers so they don't display values on the login screen after logging out
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/auth.gif'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.125,
            ),
            Text(
              'Welcome to',
              style: Styles.text30.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.sp),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              width: double.infinity,
              child: Image.asset(AssetsData.logoWhite),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.280,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                backgroundColor: Colors.white,
                text: "Login",
                textColor: kSecondaryColor,
                onPressed: () {
                  showLogin(context);
                },
              ),
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Divider(
                    color: kPrimaryColor,
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0).r,
                  child: Text(
                    "Or",
                    style: Styles.text16.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: kPrimaryColor,
                    thickness: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                backgroundColor: const Color(0xff9c54d5),
                text: "Create an account",
                textColor: kPrimaryColor,
                onPressed: () {
                  showSignUp(context);
                },
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Future<dynamic> showSignUp(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: kPrimaryColor,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            height: 360.h,
            child: Padding(
              padding: const EdgeInsets.all(25.0).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Please Enter your credentials',
                    style: Styles.text18.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  MyTextField(
                      keyboard: TextInputType.name,
                      controller: nameController,
                      hintText: "Full Name",
                      obscureText: false),
                  SizedBox(
                    height: 15.h,
                  ),
                  MyTextField(
                      keyboard: TextInputType.emailAddress,
                      controller: emailController,
                      hintText: "Email",
                      obscureText: false),
                  SizedBox(
                    height: 15.h,
                  ),
                  MyTextField(
                      keyboard: TextInputType.name,
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: true),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      backgroundColor: kSecondaryColor,
                      text: "Create Account",
                      textColor: kPrimaryColor,
                      onPressed: () {
                        BlocProvider.of<AuthenticationCubit>(context)
                            .registerUser(
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showLogin(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: kPrimaryColor,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            height: 320.h,
            child: Padding(
              padding: const EdgeInsets.all(25.0).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Please Enter your credentials',
                    style: Styles.text18.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  MyTextField(
                      keyboard: TextInputType.emailAddress,
                      controller: emailController,
                      hintText: "Email",
                      obscureText: false),
                  SizedBox(
                    height: 15.h,
                  ),
                  MyTextField(
                      keyboard: TextInputType.name,
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: true),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      backgroundColor: kSecondaryColor,
                      text: "Login",
                      textColor: kPrimaryColor,
                      onPressed: () {
                        BlocProvider.of<AuthenticationCubit>(context).loginUser(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
