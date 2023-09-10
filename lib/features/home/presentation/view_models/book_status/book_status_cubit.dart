import 'package:bloc/bloc.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/core/utils/functions/firebase_data.dart';
import 'package:equatable/equatable.dart';


part 'book_status_state.dart';

class BookStatusCubit extends Cubit<BookStatusState> {
  final FirebaseData _firebaseData;

  BookStatusCubit(this._firebaseData) : super(BookStatusInitial());

  Future<void> checkIfBookIsInLibrary(NewBookModel bookModel) async {
    try {
      final String isbn = bookModel.id!;
      final bool result = await _firebaseData.isBookInLibrary(isbn);
      emit(BookStatusLoaded(result));
    } catch (e) {
      emit(BookStatusError());
    }
  }

  Future<void> addBookToLibrary(String isbn) async {
    try {
      await _firebaseData.addBookToLibrary(bookDocumentISBN: isbn);
      emit(const BookStatusLoaded(true));
    } catch (e) {
      emit(BookStatusError());
    }
  }

  Future<void> removeBookFromLibrary(String isbn) async {
    try {
      await _firebaseData.removeBookFromLibrary(bookDocumentISBN: isbn);
      emit(const BookStatusLoaded(false));
    } catch (e) {
      emit(BookStatusError());
    }
  }
}