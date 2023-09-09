  import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';

String getText(NewBookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }

