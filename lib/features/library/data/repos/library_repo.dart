
import 'package:dartz/dartz.dart';
import 'package:ebook_app/core/errors/failures.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';

abstract class LibraryRepo {
  //fetch library books from a list that contains books that the user has added to their library
  Future<Either<Failure, List<NewBookModel>>> fetchLibraryBooks(
    {required List<String> isbn }
  );
  
}