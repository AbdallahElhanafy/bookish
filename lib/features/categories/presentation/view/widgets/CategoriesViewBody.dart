import 'package:ebook_app/core/utils/functions/Categories.dart';
import 'package:ebook_app/core/widgets/loading_indecator.dart';
import 'package:ebook_app/features/categories/presentation/view/widgets/CategoriesGridView.dart';
import 'package:ebook_app/features/categories/presentation/view_models/category_cubit/categories_cubit.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/Book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesViewBody extends StatelessWidget {
  CategoriesViewBody({super.key});

  final _categoriesConstructor = Categories();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        
        if (state is CategoriesInitial) {
          return CategoriesGridView(categoriesConstructor: _categoriesConstructor);
        } else if (state is CategoriesLoading) {
          return CustomLoadingIndecator();
        }

        else if (state is CategoriesFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        }

        else if (state is CategoriesSuccess){
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
        }

        else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}




