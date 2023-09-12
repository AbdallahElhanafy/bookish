import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/app_router.dart';
import 'package:ebook_app/core/utils/functions/show_snack_bar.dart';
import 'package:ebook_app/features/authentication/presentation/view/widgets/register_view_body.dart';
import 'package:ebook_app/features/authentication/presentation/view_models/authentication_cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is registerSuccess) {
          GoRouter.of(context).go(AppRouter.kNavigation);
        } else if (state is registerFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return const Scaffold(
          backgroundColor: kSecondaryColor,
          body: RegisterViewBody(),
        );
      },
    );
  }
}
