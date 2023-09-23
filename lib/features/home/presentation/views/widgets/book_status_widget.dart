import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/home/presentation/view_models/book_status/book_status_cubit.dart';
import 'package:ebook_app/features/home/presentation/view_models/firebase_data/firebase_data_cubit.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'book_status_button.dart';


class BookStatusWidget extends StatefulWidget {
  final NewBookModel bookModel;
  final BuildContext context;


 const BookStatusWidget({
    Key? key,
    required this.bookModel,
    required this.context,
  }) : super(key: key);

  @override
  _BookStatusWidgetState createState() => _BookStatusWidgetState();
}

class _BookStatusWidgetState extends State<BookStatusWidget> {
  bool _isBookInLibrary = false;

  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookStatusCubit, BookStatusState>(
      builder: (context, state) {
        if (state is BookStatusInitial) {
          return const CircularProgressIndicator();
        } else if (state is BookStatusLoaded) {
          _isBookInLibrary = state.isBookInLibrary;
          return _isBookInLibrary
              ? Expanded(
                  child: BookStatusButton(
                    widget: BooksAction(
                      bookModel: widget.bookModel,
                    ),
                    icon: FontAwesomeIcons.solidHeart ,
                    onPressed: () async { 
                      BlocProvider.of<BookStatusCubit>(widget.context)
                          .removeBookFromLibrary(widget.bookModel.id!);
                      BlocProvider.of<FirebaseDataCubit>(widget.context)
                          .getLibraryDataFromDataBase();
                    },
                  ),
                )
              : Expanded(
                  child: BookStatusButton(
                    onPressed: () async {
                      BlocProvider.of<BookStatusCubit>(widget.context)
                          .addBookToLibrary(widget.bookModel.id!);

                      BlocProvider.of<FirebaseDataCubit>(widget.context)
                          .getLibraryDataFromDataBase();
                    },
                    icon: FontAwesomeIcons.heart,
                    widget: BooksAction(
                      bookModel: widget.bookModel,
                    ),
                  ),
                );
        } else {
          return const Text('Error');
        }
      },
    );
  }
}