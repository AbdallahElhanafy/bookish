import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/search/presentation/view/widgets/book_search_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookSearchListView extends StatelessWidget {
  final List<NewBookModel> books;

  const BookSearchListView({
    super.key, required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0).r,
          child: BookSearchItem(
            bookModel: books[index],
            rating: books[index].volumeInfo.averageRating ?? 0,
            count: books[index].volumeInfo.ratingsCount ?? 0,
            bookAuthor: books[index].volumeInfo.authors?[0] ?? '',
            bookTitle: books[index].volumeInfo.title ?? '',
            imageUrl: books[index]
                    .volumeInfo
                    .imageLinks
                    ?.thumbnail
                    .replaceAll('zoom=1', 'zoom=10') ??
                '',
          ),
        );
      },
    );
  }
}
