import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/Text_field.dart';
import 'package:ebook_app/core/utils/app_router.dart';
import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/core/widgets/custom_button.dart';
import 'package:ebook_app/features/authentication/presentation/view_models/authentication_cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0).r,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.125,
            ),
            Image.asset('assets/images/logo_white.png'),
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
            SizedBox(height: 15.h),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                backgroundColor: Color(0xff9c54d5),
                text: "Create Account",
                textColor: kPrimaryColor,
                onPressed: () {
                  BlocProvider.of<AuthenticationCubit>(context).registerUser(
                    name: nameController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
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
                backgroundColor: kPrimaryColor,
                text: "Login",
                textColor: kSecondaryColor,
                onPressed: () {
                  GoRouter.of(context).go(AppRouter.kLoginView);
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.125,
            ),
          ],
        ),
      ),
    );
  }
}
