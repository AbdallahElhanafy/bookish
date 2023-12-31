import 'package:ebook_app/core/utils/service_locator.dart';
import 'package:ebook_app/features/search/data/repos/search_repo_impl.dart';
import 'package:ebook_app/features/search/presentation/view/widgets/custom_search_field.dart';
import 'package:ebook_app/features/search/presentation/view/widgets/search_result_list_view.dart';
import 'package:ebook_app/features/search/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  final String query = '';
  final String category = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchCubit(getIt.get<searchRepoImpl>(), query, category),
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0, right: 25, left: 25).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchField(),
            SizedBox(
              height: 20.h,
            ),

            // Show books froms earch result

            Expanded(
              child: SearchResultListView(),
            )
          ],
        ),
      ),
    );
  }
}
