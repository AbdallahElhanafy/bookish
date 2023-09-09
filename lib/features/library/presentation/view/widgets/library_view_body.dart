import 'package:ebook_app/core/utils/service_locator.dart';
import 'package:ebook_app/features/home/presentation/view_models/firebase_data/firebase_data_cubit.dart';
import 'package:ebook_app/features/library/data/repos/library_repo_impl.dart';
import 'package:ebook_app/features/library/presentation/view/widgets/Library_list_view.dart';
import 'package:ebook_app/features/library/presentation/view_models/library_cubit/library_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryViewBody extends StatefulWidget {
const  LibraryViewBody({super.key});

  @override
  State<LibraryViewBody> createState() => _LibraryViewBodyState();
}

class _LibraryViewBodyState extends State<LibraryViewBody> {
  List<String> isbn = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FirebaseDataCubit>(context).getLibraryDataFromDataBase();
    isbn = BlocProvider.of<FirebaseDataCubit>(context).libraryIsbn;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LibraryCubit(getIt.get<LibraryRepoImpl>(), isbn)
        ..fetchLibraryBooks(isbn: isbn),
      child: const SizedBox(
       
        height: 500,
        width: 500,
         child: LibraryListView(),
      ),
    );
  }
}
