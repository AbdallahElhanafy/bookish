import 'dart:io';

import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:intl/intl.dart';

var format = NumberFormat.simpleCurrency(locale: Platform.localeName);

String bookPrice(NewBookModel bookModel) {
  if (bookModel.saleInfo?.saleability == 'FOR_SALE') {
    return '${format.currencyName} ${bookModel.saleInfo!.listPrice!.amount}';
  } else if (bookModel.saleInfo?.saleability == 'NOT_FOR_SALE') {
    return 'N/A';
  } else if (bookModel.saleInfo?.saleability == 'FREE') {
    return 'Free';
  } else {
    return 'N/A';
  }
}
