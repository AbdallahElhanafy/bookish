import 'package:ebook_app/core/utils/app_router.dart';
import 'package:ebook_app/features/authentication/presentation/view_models/authentication_cubit/authentication_cubit.dart';
import 'package:ebook_app/features/settings/presentation/view/widgets/settings_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
         if (state is logoutSuccess){
            GoRouter.of(context).push(AppRouter.kAuthView);
         }
         else if (state is logoutFailure){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
         }
        },
        child: const SettingsViewBody(),
      ),
    );
  }
}
