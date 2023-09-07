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
  Future<Either<Failure, List<NewBookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?q=subject:fiction&orderBy=newest&langRestrict=en&download=epub');

      List<NewBookModel> books = [];

      for (var item in data['items']) {
        try {
          books.add(NewBookModel.fromJson(item));
        } catch (e) {
          books.add(NewBookModel.fromJson(item));
        }
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
          endPoint: 'volumes?q=subject:fiction&langRestrict=en&download=epub');

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
  Future<Either<Failure, List<NewBookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?q=subject:$category&orderBy=relevance&langRestrict=en&download=epub');

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
