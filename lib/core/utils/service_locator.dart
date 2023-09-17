import 'package:dio/dio.dart';
import 'package:ebook_app/core/shared.dart';
import 'package:ebook_app/core/utils/api_service.dart';
import 'package:ebook_app/features/search/data/repos/categories_repo_impl.dart';
import 'package:ebook_app/features/home/data/repos/home_repo_impl.dart';
import 'package:ebook_app/features/library/data/repos/library_repo_impl.dart';

import 'package:ebook_app/features/search/data/repos/search_repo_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;


void setupServiceLocator(sharedPreferences) async {
  final sharedPreferences =  await SharedPreferences.getInstance();

  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );


  getIt.registerSingleton<searchRepoImpl>(
    searchRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

   getIt.registerSingleton<SharedPreferences>(
    sharedPreferences,
  );
  getIt.registerSingleton<SharedPrefs>(
    SharedPrefs(),
  );

  getIt.registerSingleton<categoriesRepoImpl>(
    categoriesRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
 getIt.registerSingleton<LibraryRepoImpl>(
    LibraryRepoImpl(
      getIt.get<ApiService>(),
    ),
  );


}
