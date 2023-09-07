import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/Book_Img_section.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatefulWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final NewBookModel bookModel;

  @override
  State<BookDetailsViewBody> createState() => _BookDetailsViewBodyState();
}

class _BookDetailsViewBodyState extends State<BookDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            color: BlocProvider.of<SimilarBooksCubit>(context).backColor,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0).r,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomAppBarBookDetails(),
                        const SizedBox(
                          height: 20,
                        ),
                        BookImgSection(
                          bookModel: widget.bookModel,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: BookDetailsSection(
                    bookModel: widget.bookModel,
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
