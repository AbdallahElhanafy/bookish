import 'package:ebook_app/core/widgets/custom_error_widget.dart';
import 'package:ebook_app/core/widgets/loading_indecator.dart';
import 'package:ebook_app/features/home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarBoxListView extends StatelessWidget {
  const SimilarBoxListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSucess) {
          return SizedBox(
            height: 110.h,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5).r,
                  child: const CustomBookImage(
                    imageUrl: '',
                  ),
                );
              }),
            ),
          );
        } else if (state is SimilarBooksFaliure) {
         return CustomErrorWidget(errMessage: state.errMessage);
        } else  {
         return const CustomLoadingIndecator();
        }
      },
    );
  }
}
