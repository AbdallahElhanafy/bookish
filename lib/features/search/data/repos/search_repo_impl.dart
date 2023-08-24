import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ebook_app/core/errors/failures.dart';
import 'package:ebook_app/core/utils/api_service.dart';
import 'package:ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:ebook_app/features/search/data/repos/search_repo.dart';

class searchRepoImpl implements SearchRepo {
  final ApiService apiService;

  searchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> searchBooks({required String query}) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=$query'
      );
       
      List<BookModel> books = [];

      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }
      return Right(books);
    } on DioException catch (e) {
      return Left(ServerFaliure(e.response?.data!['error']['message'] ?? 'Unknown error occurred'));
    } catch (e) {
      return Left(ServerFaliure(e.toString()));
    }
  }
}

 