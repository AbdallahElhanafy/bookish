import 'package:shared_preferences/shared_preferences.dart';

// To save a list of book IDs as favorite books
class SharedPrefs {
  static const _favoriteBooksKey = 'favorite_books';

    static Future<void> addBookToFavorites(String bookId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteBooks = prefs.getStringList(_favoriteBooksKey) ?? [];
    if (!favoriteBooks.contains(bookId)) {
      favoriteBooks.add(bookId);
      await prefs.setStringList(_favoriteBooksKey, favoriteBooks);
    }
  }

  static Future<void> deleteBookFromFavorites(String bookId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteBooks = prefs.getStringList(_favoriteBooksKey) ?? [];
    favoriteBooks.remove(bookId);
    await prefs.setStringList(_favoriteBooksKey, favoriteBooks);
  }

  static Future<List<String>> getFavoriteBooks() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoriteBooksKey) ?? [];
  }
}