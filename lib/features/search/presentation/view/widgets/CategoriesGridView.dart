import 'package:ebook_app/features/search/presentation/view/widgets/CategoryItem.dart';
import 'package:ebook_app/features/search/presentation/view_models/category_tools/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({
    super.key,
    required Categories categoriesConstructor,
  }) : _categoriesConstructor = categoriesConstructor;

  final Categories _categoriesConstructor;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300.r,
        childAspectRatio: 0.8,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.w,
      ),
      itemCount: _categoriesConstructor.CategoriesList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: ((context, index) {
        return CategoryItem(
          category: _categoriesConstructor.CategoriesList[index].category,
          imgLink: _categoriesConstructor.CategoriesList[index].imageAsset,
        );
      }),
    );
  }
}
