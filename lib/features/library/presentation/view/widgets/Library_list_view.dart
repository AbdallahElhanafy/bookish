import 'package:ebook_app/features/library/presentation/view_models/library_cubit/library_cubit.dart';
import 'package:ebook_app/features/search/presentation/view/widgets/book_search_list_view.dart';
import 'package:ebook_app/features/search/presentation/view/widgets/search_list_view_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryListView extends StatelessWidget {
  const LibraryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryCubit, LibraryState>(
      builder: (context, state) {
        if (state is LibraryInitial) {
          return const Center();
        } else if (state is LibraryLoading) {
          return const Center(
            child:  SearchListViewSkeleton(),
          );
        } else if (state is LibrarySucess) {
          return BookSearchListView(
            books: state.books,
          );
        } else if (state is LibraryFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
