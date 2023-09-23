import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:flutter/foundation.dart';


class BookStatusAction extends BooksAction {
  final NewBookModel bookModel;

  const BookStatusAction({super.key, required this.bookModel}) : super(bookModel: bookModel);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookStatusAction{bookModel: $bookModel}';
  }
}