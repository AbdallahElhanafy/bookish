import 'package:ebook_app/core/utils/service_locator.dart';
import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/Book_list_view_item.dart';
import 'package:ebook_app/features/search/data/repos/search_repo_impl.dart';
import 'package:ebook_app/features/search/presentation/view/widgets/custom_search_field.dart';
import 'package:ebook_app/features/search/presentation/view_models/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewBody extends StatelessWidget {
  SearchViewBody({
    super.key,
  });

  String query = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<searchRepoImpl>(), query),
      child: Padding(
        padding: const EdgeInsets.all(30.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchField(),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Search Result: ',
              style: Styles.text18,
            ),
            // Show books froms earch result

            const Expanded(
              child: SearchResultListView(),
            )
          ],
        ),
      ),
    );
  }
}

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
          print (state.errMessage);
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
