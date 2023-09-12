import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ebook_app/core/errors/failures.dart';
import 'package:ebook_app/core/utils/api_service.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  List<String> RandomCategories = [
    'fiction',
    'travel',
    'Business',
    'history',
    'science',
    'drama',
    'fantasy',
    'horror',
  ];

  @override
  Future<Either<Failure, List<NewBookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?q=subject:${RandomCategories[Random().nextInt(RandomCategories.length)]}&orderBy=newest&langRestrict=en&download=epub&maxResults=20');

      List<NewBookModel> books = [];
 for (var item in data['items']) {
        books.add(NewBookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFaliure.fromDioExeption(e),
        );
      }
      return left(
        ServerFaliure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<NewBookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?q=subject:${RandomCategories[Random().nextInt(RandomCategories.length)]}&langRestrict=en&download=epub&maxResults=20');
      List<NewBookModel> books = [];

      for (var item in data['items']) {
              final bookModel = NewBookModel.fromJson(item);

        books.add(NewBookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFaliure.fromDioExeption(e),
        );
      }
      return left(
        ServerFaliure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<NewBookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?q=subject:$category&orderBy=relevance&langRestrict=en');

      List<NewBookModel> books = [];

      for (var item in data['items']) {
        books.add(NewBookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFaliure.fromDioExeption(e),
        );
      }
      return left(
        ServerFaliure(
          e.toString(),
        ),
      );
    }
  }
}
