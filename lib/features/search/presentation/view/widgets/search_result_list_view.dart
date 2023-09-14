import 'package:ebook_app/features/search/presentation/view/widgets/CategoriesGridView.dart';
import 'package:ebook_app/features/search/presentation/view_models/category_tools/categories.dart';
import 'package:ebook_app/features/search/presentation/view/widgets/book_search_list_view.dart';
import 'package:ebook_app/features/search/presentation/view/widgets/search_list_view_skeleton.dart';
import 'package:ebook_app/features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  SearchResultListView({super.key});

  final _categoriesConstructor = Categories();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<SearchCubit>(context),
      builder: (context, state) {
        if (state is SearchInitial) {
          return CategoriesGridView(
              categoriesConstructor: _categoriesConstructor);
        } else if (state is SearchLoading) {
          return const SearchListViewSkeleton();
        } else if (state is SearchSucess) {
          return BookSearchListView(
            books: state.books,
          );
        } else if (state is SearchFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is SearchCategorySucess) {
          return BookSearchListView(
            books: state.books,
          );
  

        } else {
          return  const SearchListViewSkeleton();
        }
      },
    );
  }
}


