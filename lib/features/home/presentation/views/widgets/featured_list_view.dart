import 'package:ebook_app/core/utils/app_router.dart';
import 'package:ebook_app/core/widgets/custom_error_widget.dart';
import 'package:ebook_app/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/home_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSucess) {
          return SizedBox(
            height: 240.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return SizedBox(
                  width: 130.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kBookDetailsView,
                            extra: state.books[index]);
                      },
                      child: CustomBookImage(
                          aspectRatioHeight: 170.h,
                          bookAuthor:
                              state.books[index].volumeInfo.authors?[0] ?? '',
                          bookTitle:
                              state.books[index].volumeInfo.title ?? '',
                          imageUrl: state.books[index].volumeInfo.imageLinks
                                  ?.thumbnail
                                  .replaceAll('zoom=1', 'zoom=10') ??
                              ''),
                    ),
                  ),
                );
              }),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return HomeSkeleton(
            height: 240.h,
            aspectHeight: 200.h,
          );
        }
      },
    );
  }
}
