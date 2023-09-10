import 'package:ebook_app/core/utils/service_locator.dart';
import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/features/home/presentation/view_models/firebase_data/firebase_data_cubit.dart';
import 'package:ebook_app/features/library/data/repos/library_repo_impl.dart';
import 'package:ebook_app/features/library/presentation/view/widgets/Library_list_view.dart';
import 'package:ebook_app/features/library/presentation/view_models/library_cubit/library_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryViewBody extends StatefulWidget {
  const LibraryViewBody({super.key});

  @override
  State<LibraryViewBody> createState() => _LibraryViewBodyState();
}

class _LibraryViewBodyState extends State<LibraryViewBody> {
  List<String> isbn = [];
  @override
  void initState() {
    super.initState();
    isbn = [];
    BlocProvider.of<FirebaseDataCubit>(context).getLibraryDataFromDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LibraryCubit(getIt.get<LibraryRepoImpl>(), isbn)
        ..fetchLibraryBooks(isbn: isbn),
      child: BlocBuilder<FirebaseDataCubit, FirebaseDataState>(
        builder: (context, state) {
          if (state is GetLibraryDataSucess) {
            isbn = state.libraryIsbn;
            return SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.all(30.0).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Favorite Books",
                      style: Styles.text18,
                    ),
                    const Divider(
                      thickness: 3,
                      color: Colors.grey,
                    ),
                    const Expanded(
                      child: LibraryListView(),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is GetLibraryDataFailure) {
            return const Center(
              child: Text('Error fetching library data'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}