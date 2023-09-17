import 'package:bloc/bloc.dart';
import 'package:ebook_app/features/library/presentation/view_models/library_cubit/library_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs_state.dart';

class SharedPrefsCubit extends Cubit<SharedPrefsState> {
  final SharedPreferences sharedPreferences;
  final LibraryCubit libraryCubit;

  SharedPrefsCubit(
      {required this.sharedPreferences, required this.libraryCubit})
      : super(SharedPrefsInitial()) {
    getFavoriteBooks();
  }

  Future<void> getFavoriteBooks() async {
    final favoriteBooks =
        sharedPreferences.getStringList('favorite_books') ?? [];
    emit(SharedPrefsLoaded(favoriteBooks));
  }

  Future<void> addFavoriteBook(String bookId) async {
    final favoriteBooks =
        sharedPreferences.getStringList('favorite_books') ?? [];
    favoriteBooks.add(bookId);
    await sharedPreferences.setStringList('favorite_books', favoriteBooks);
    emit(SharedPrefsLoaded(favoriteBooks));
    libraryCubit.fetchLibraryBooks(isbn: favoriteBooks);
  }

  Future<void> removeFavoriteBook(String bookId) async {
    final favoriteBooks =
        sharedPreferences.getStringList('favorite_books') ?? [];
    favoriteBooks.remove(bookId);
    await sharedPreferences.setStringList('favorite_books', favoriteBooks);
    emit(SharedPrefsLoaded(favoriteBooks));
    libraryCubit.fetchLibraryBooks(isbn: favoriteBooks);
  }
}
