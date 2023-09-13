import 'package:ebook_app/core/widgets/custom_error_widget.dart';
import 'package:ebook_app/features/home/presentation/view_models/newest_books/newest_books_cubit.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/Book_list_view_item.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/home_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSucess) {
          return SizedBox(
            height: 300.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0).r,
                  child: BookListViewItem(
                    bookModel: state.books[index],
                  ),
                );
              },
            ),
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const HomeSkeleton(
            height: 300,
            aspectHeight: 260,
          );
        }
      },
    );
  }
}


