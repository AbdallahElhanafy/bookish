import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ebook_app/core/errors/failures.dart';
import 'package:ebook_app/core/utils/api_service.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/search/data/repos/search_repo.dart';

class searchRepoImpl implements SearchRepo {
  final ApiService apiService;

  searchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<NewBookModel>>> searchBooks(
      {required String query}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?q=$query&download=epub&langRestrict=en');

      List<NewBookModel> books = [];

      for (var item in data['items']) {
        try {
          books.add(NewBookModel.fromJson(item));
        } catch (e) {
          books.add(NewBookModel.fromJson(item));
        }
      }
      return Right(books);
    } on DioException catch (e) {
      return Left(ServerFaliure(
          e.response?.data!['error']['message'] ?? 'Unknown error occurred'));
    } catch (e) {
      return Left(ServerFaliure(e.toString()));
    }
  }
}
