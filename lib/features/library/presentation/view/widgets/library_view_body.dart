import 'package:ebook_app/features/library/presentation/view/widgets/Library_list_view.dart';
import 'package:ebook_app/features/library/presentation/view_models/cubit/shared_prefs_cubit.dart';
import 'package:ebook_app/features/library/presentation/view_models/library_cubit/library_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryViewBody extends StatefulWidget {
  const LibraryViewBody({Key? key}) : super(key: key);

  @override
  _LibraryViewBodyState createState() => _LibraryViewBodyState();
}

class _LibraryViewBodyState extends State<LibraryViewBody> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  List<String> isbn = [];
  bool _isUpdated = true;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SharedPrefsCubit>(context).getFavoriteBooks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedPrefsCubit, SharedPrefsState>(
      builder: (context, state) {
        if (state is SharedPrefsLoaded) {
          isbn = state.favoriteBooks;
          BlocProvider.of<LibraryCubit>(context)
              .fetchLibraryBooks(isbn: state.favoriteBooks);
          return RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async {
              _isUpdated = false;
              await BlocProvider.of<SharedPrefsCubit>(context)
                  .getFavoriteBooks();
              isbn = state.favoriteBooks;
              await BlocProvider.of<LibraryCubit>(context)
                  .fetchLibraryBooks(isbn: isbn);
              print(isbn);
              setState(() {
                _isUpdated = true;
              });
            },
            child: Column(
              children: [
                if (_isUpdated)
                  BlocBuilder<LibraryCubit, LibraryState>(
                    builder: (context, state) {
                      if (state is LibraryInitial) {
                        return const Center(
                          child: Text('lol'),
                        );
                      } else if (state is LibraryLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is LibrarySucess) {
                        return Expanded(child: LibraryListView());
                      } else if (state is LibraryFailure) {
                        return const Center(
                          child: Text('Error'),
                        );
                      } else {
                        return const Center(
                          child: Text('Unknown state'),
                        );
                      }
                    },
                  )
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
