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

class LoginViewBody extends StatefulWidget {
  LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    // dispose the controllers so they don't display values on the login screen after logging out
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo_white.png'),
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
              backgroundColor: Colors.white,
              text: "Login",
              textColor: kSecondaryColor,
              onPressed: () {
                BlocProvider.of<AuthenticationCubit>(context).loginUser(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim());
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
              backgroundColor: Color(0xff9c54d5),
              text: "Create an account",
              textColor: kPrimaryColor,
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kRegisterView);
              },
            ),
          ),
        ],
      ),
    );
  }
}
