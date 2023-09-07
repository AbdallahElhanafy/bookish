import 'package:ebook_app/core/utils/Text_field.dart';
import 'package:ebook_app/core/utils/my_button.dart';
import 'package:ebook_app/features/authentication/presentation/view_models/authentication_cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
    
  

  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Enter your account credentials",
          style: TextStyle(
              fontSize: 15.sp,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w200,
              color: Colors.white),
        ),
        SizedBox(
          height: 30.h,
        ),
        MyTextField(
            keyboard: TextInputType.name,
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
        MyButton(
            FontSize: 25.sp,
            onTap: () {
              BlocProvider.of<AuthenticationCubit>(context).loginUser(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim());
            },
            Action_Button: "Login",
            BackColor: Colors.orange,
            Border_Width: 0,
            TextColor: Colors.white),
      ],
    );
  }
}
