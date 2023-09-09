import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/app_router.dart';
import 'package:ebook_app/core/utils/service_locator.dart';
import 'package:ebook_app/features/authentication/presentation/view_models/authentication_cubit/authentication_cubit.dart';
import 'package:ebook_app/features/home/data/repos/home_repo_impl.dart';
import 'package:ebook_app/features/home/presentation/view_models/book_status/book_status_cubit.dart';
import 'package:ebook_app/core/utils/functions/firebase_data.dart';
import 'package:ebook_app/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:ebook_app/features/home/presentation/view_models/firebase_data/firebase_data_cubit.dart';
import 'package:ebook_app/features/home/presentation/view_models/newest_books/newest_books_cubit.dart';
import 'package:ebook_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  setupServiceLocator();
  runApp(const BooksApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class BooksApp extends StatelessWidget {
  const BooksApp({super.key});

  final String id = '';

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FeaturedBooksCubit(
                getIt.get<HomeRepoImpl>(),
              )..fetchFeaturedBooks(),
            ),
            BlocProvider(
              create: (context) => NewestBooksCubit(
                getIt.get<HomeRepoImpl>(),
              )..fetchNewestBooks(),
            ),
            BlocProvider(
              create: (context) => AuthenticationCubit(),
            ),
            BlocProvider(
              create: (context) => FirebaseDataCubit(),
            ),
            BlocProvider(
              create: (context) => BookStatusCubit(FirebaseData()),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: kPrimaryColor,
              textTheme: GoogleFonts.jostTextTheme(ThemeData.light().textTheme),
            ),
          ),
        );
      },
    );
  }
}
