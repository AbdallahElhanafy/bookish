import 'package:ebook_app/core/utils/service_locator.dart';
import 'package:ebook_app/features/categories/data/repos/categories_repo_impl.dart';
import 'package:ebook_app/features/categories/presentation/view/widgets/CategoriesViewBody.dart';
import 'package:ebook_app/features/categories/presentation/view_models/category_cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  final String category = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesCubit(getIt.get<categoriesRepoImpl>(), category),
      child: CategoriesViewBody(),
    );
  }
}
