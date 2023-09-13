import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/app_router.dart';
import 'package:ebook_app/core/utils/functions/show_snack_bar.dart';
import 'package:ebook_app/features/authentication/presentation/view/widgets/auth_view_body.dart';
import 'package:ebook_app/features/authentication/presentation/view_models/authentication_cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is loginSuccess || state is registerSuccess) {
          GoRouter.of(context).push(AppRouter.kNavigation);
        } else if (state is loginFailure) {
          showSnackBar(context, state.errMessage);
        } else if (state is registerFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: AuthViewBody(),
      ),
    );
  }
}
