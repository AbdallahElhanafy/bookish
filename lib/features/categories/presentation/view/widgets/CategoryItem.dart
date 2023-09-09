import 'package:ebook_app/features/search/presentation/view_models/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.imgLink,
  });

  final String category;
  final String imgLink;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<SearchCubit>(context)
            .getCategory(category: category);
      },
      child: Padding(
        padding: const EdgeInsets.all(10).r,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image:
                DecorationImage(image: AssetImage(imgLink), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
