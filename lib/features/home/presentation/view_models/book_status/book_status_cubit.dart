import 'package:bloc/bloc.dart';
import 'package:ebook_app/core/shared.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:equatable/equatable.dart';

part 'book_status_state.dart';

class BookStatusCubit extends Cubit<BookStatusState> {
  final SharedPrefs _sharedPrefs;

  BookStatusCubit(this._sharedPrefs) : super(BookStatusInitial());

  Future<void> checkIfBookIsInLibrary(NewBookModel bookModel) async {
    try {
      final String isbn = bookModel.id!;
      final List<String> favoriteBooks = await SharedPrefs.getFavoriteBooks();
      final bool result = favoriteBooks.contains(isbn);
      emit(
        BookStatusLoaded(result),
      );
    } catch (e) {
      emit(
        BookStatusError(),
      );
    }
  }

  Future<void> addBookToLibrary(String isbn) async {
    try {
      final List<String> favoriteBooks = await SharedPrefs.getFavoriteBooks();
      if (!favoriteBooks.contains(isbn)) {
        favoriteBooks.add(isbn);
        await SharedPrefs.addBookToFavorites(isbn);
      }
      emit(const BookStatusLoaded(true));
    } catch (e) {
      emit(BookStatusError());
    }
  }

  Future<void> removeBookFromLibrary(String isbn) async {
    try {
      final List<String> favoriteBooks = await SharedPrefs.getFavoriteBooks();
      if (favoriteBooks.contains(isbn)) {
        favoriteBooks.remove(isbn);
        await SharedPrefs.deleteBookFromFavorites(isbn);
      }
      emit(const BookStatusLoaded(false));
    } catch (e) {
      emit(BookStatusError());
    }
  }
}
