import 'package:ebook_app/features/home/presentation/view_models/book_status/book_status_cubit.dart';
import 'package:ebook_app/features/home/presentation/view_models/firebase_data/firebase_data_cubit.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/book_status_action.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/book_status_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookStatusWidget extends StatefulWidget {
  final BookStatusAction bookStatusAction;

  const BookStatusWidget({Key? key, required this.bookStatusAction})
      : super(key: key);

  @override
  _BookStatusWidgetState createState() => _BookStatusWidgetState();
}

class _BookStatusWidgetState extends State<BookStatusWidget> {
  late bool _isBookInLibrary;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookStatusCubit, BookStatusState>(
      builder: (context, state) {
        if (state is BookStatusInitial) {
          return const CircularProgressIndicator();
        } else if (state is BookStatusLoaded) {
          _isBookInLibrary = state.isBookInLibrary;
          return _isBookInLibrary
              ? BookStatusButton(
                  widget: BookStatusAction(
                    bookModel: widget.bookStatusAction.bookModel,
                  ),
                  text: 'remove from favs',
                  onPressed: () async {
                    BlocProvider.of<BookStatusCubit>(context)
                        .removeBookFromLibrary(widget.bookStatusAction.bookModel
                            .volumeInfo.industryIdentifiers![0].identifier!);
                    BlocProvider.of<FirebaseDataCubit>(context)
                        .getLibraryDataFromDataBase();
                  },
                )
              : BookStatusButton(
                  onPressed: () async {
                    BlocProvider.of<BookStatusCubit>(context).addBookToLibrary(
                        widget.bookStatusAction.bookModel.volumeInfo
                            .industryIdentifiers![0].identifier!);
                    BlocProvider.of<FirebaseDataCubit>(context)
                        .getLibraryDataFromDataBase();
                  },
                  text: 'add to favs',
                  widget: BookStatusAction(
                    bookModel: widget.bookStatusAction.bookModel,
                  ),
                );
        } else {
          return const Text('Error');
        }
      },
    );
  }
}
