import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/features/home/data/models/book_image/book_image.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';

var apikey = '&key=AIzaSyAymbZgmUEwwRN-EPtIzxrvuZsB8o5Wz4U';
final imgUrl = '?fields=id,volumeInfo(title,imageLinks)';
final volume = 'https://www.googleapis.com/books/v1/volumes/';

class BookImageGetter {
  String bookImageUrl(BookImage bookImage) {
    if (bookImage.volumeInfo!.imageLinks!.extraLarge != null) {
      return bookImage.volumeInfo!.imageLinks!.extraLarge!;
    } else if (bookImage.volumeInfo!.imageLinks!.large != null) {
      return bookImage.volumeInfo!.imageLinks!.large!;
    } else if (bookImage.volumeInfo!.imageLinks!.medium != null) {
      return bookImage.volumeInfo!.imageLinks!.medium!;
    } else {
      return bookImage.volumeInfo!.imageLinks!.thumbnail!;
    }
  }
}
