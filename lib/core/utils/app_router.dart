import 'package:ebook_app/core/utils/navigation.dart';
import 'package:ebook_app/core/utils/service_locator.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/home/data/repos/home_repo_impl.dart';
import 'package:ebook_app/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:ebook_app/features/home/presentation/views/book_details_view.dart';
import 'package:ebook_app/features/home/presentation/views/home_view.dart';
import 'package:ebook_app/features/library/presentation/view/library_view.dart';
import 'package:ebook_app/features/search/presentation/view/search_view.dart';
import 'package:ebook_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLibraryView = '/libraryView';
  static const kHomeView = '/homeView';
  static const kNavigation = '/navView';
  static const kSearchView = '/seachView';
  static const kBookDetailsView = '/bookDetailsView';
  static final router = GoRouter(
    routes: [

      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kNavigation,
        builder: (context, state) => const Navigation(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as NewBookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kLibraryView,
        builder: (context, state) => const LibraryView(),
      ),
    ],
  );
}
