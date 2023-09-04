import 'package:dartz/dartz.dart';
import 'package:ebook_app/core/errors/failures.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<NewBookModel>>> getCategory({required String category});
}