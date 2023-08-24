import 'package:ebook_app/core/utils/service_locator.dart';
import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/features/search/data/repos/search_repo_impl.dart';
import 'package:ebook_app/features/search/presentation/view/widgets/custom_search_field.dart';
import 'package:ebook_app/features/search/presentation/view/widgets/search_result_list_view.dart';
import 'package:ebook_app/features/search/presentation/view_models/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewBody extends StatelessWidget {
 const SearchViewBody({
    super.key,
  });

 final  String query = '';

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


