import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/shared.dart';
import 'package:ebook_app/core/utils/app_router.dart';
import 'package:ebook_app/core/utils/service_locator.dart';
import 'package:ebook_app/features/authentication/presentation/view_models/authentication_cubit/authentication_cubit.dart';
import 'package:ebook_app/features/home/data/repos/home_repo_impl.dart';
import 'package:ebook_app/features/home/presentation/view_models/book_status/book_status_cubit.dart';
import 'package:ebook_app/core/utils/functions/firebase_data.dart';
import 'package:ebook_app/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:ebook_app/features/home/presentation/view_models/newest_books/newest_books_cubit.dart';
import 'package:ebook_app/features/library/data/repos/library_repo_impl.dart';
import 'package:ebook_app/features/library/presentation/view_models/cubit/shared_prefs_cubit.dart';
import 'package:ebook_app/features/library/presentation/view_models/library_cubit/library_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator(
    await SharedPreferences.getInstance(),
  
  );
  runApp(const BooksApp());
}

class BooksApp extends StatelessWidget {
  const BooksApp({super.key});

  final String id = '';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
              create: (context) => LibraryCubit(
                getIt.get<LibraryRepoImpl>(),
               []
              ),
            ),
            BlocProvider(
              create: (context) => BookStatusCubit(
                getIt.get<SharedPrefs>(),
              ),
            ),
            BlocProvider(
              create: (context) => SharedPrefsCubit(
                sharedPreferences: getIt.get<SharedPreferences>(),
                libraryCubit: BlocProvider.of<LibraryCubit>(context),
              ),
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
