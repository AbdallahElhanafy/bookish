import 'package:ebook_app/core/utils/service_locator.dart';
import 'package:ebook_app/features/library/data/repos/library_repo_impl.dart';
import 'package:ebook_app/features/library/presentation/view/widgets/Library_list_view.dart';
import 'package:ebook_app/features/library/presentation/view_models/library_cubit/library_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryViewBody extends StatelessWidget {
  LibraryViewBody({super.key});

final List<String> isbn = ['9781405955096','9781405955096','9781405955096'];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LibraryCubit(getIt.get<LibraryRepoImpl>(), isbn)..fetchLibraryBooks(isbn: isbn),
      child: Container(child: LibraryListView(),
      height: 500,
      width: 500,
      ),
    );
  }
}
