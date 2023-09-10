import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/home/presentation/view_models/firebase_data/firebase_data_cubit.dart';
import 'package:ebook_app/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});

  final NewBookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  initState() {
    super.initState();

    BlocProvider.of<SimilarBooksCubit>(context).getImagePalette(
        CachedNetworkImageProvider(
            widget.bookModel.volumeInfo.imageLinks!.thumbnail));
    BlocProvider.of<FirebaseDataCubit>(context).isBookInLibrary(
        widget.bookModel.id!);

    BlocProvider.of<FirebaseDataCubit>(context).getLibraryDataFromDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BookDetailsViewBody(
        bookModel: widget.bookModel,
      )),
    );
  }
}
