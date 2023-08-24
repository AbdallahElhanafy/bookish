import 'package:ebook_app/features/home/presentation/views/widgets/Book_list_view_item.dart';
import 'package:ebook_app/features/search/presentation/view_models/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<SearchCubit>(context),
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchSucess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0).r,
                child: BookListViewItem(
                 bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchFailure) {
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