import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ebook_app/core/errors/failures.dart';
import 'package:ebook_app/core/utils/api_service.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/library/data/repos/library_repo.dart';

class LibraryRepoImpl implements LibraryRepo {
  final ApiService apiService;

  LibraryRepoImpl(this.apiService);
  List<NewBookModel> books = [];

  var data;
  @override
  Future<Either<Failure, List<NewBookModel>>> fetchLibraryBooks(
      {required List<String> isbn}) async {
    try {
      List<NewBookModel> books = [];
      for (var v = 0; v < isbn.length; v++) {
        var data = await apiService.get(endPoint: 'volumes?q=isbn:${isbn[v]}');
        for (var item in data['items']) {
          try {
            books.add(
              NewBookModel.fromJson(item),
            );
          } catch (e) {
            books.add(
              NewBookModel.fromJson(item),
            );
          }
        }
      }
      return Right(books);
    } on DioException catch (e) {
      return Left(
        ServerFaliure(
            e.response?.data!['error']['message'] ?? 'Unknown error occurred'),
      );
    } catch (e) {
      return Left(
        ServerFaliure(
          e.toString(),
        ),
      );
    }
  }
}
