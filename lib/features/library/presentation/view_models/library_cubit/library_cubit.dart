import 'package:bloc/bloc.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/library/data/repos/library_repo.dart';
import 'package:equatable/equatable.dart';

part 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit(this.libraryRepo, this.isbn) : super(LibraryInitial());

  final LibraryRepo libraryRepo;
final List<String> isbn;
  Future<void> fetchLibraryBooks({required List<String> isbn}) async {
    emit(LibraryLoading());
   var result = await libraryRepo.fetchLibraryBooks(isbn: isbn);

    result.fold(
      (faliure) {
        emit(
          LibraryFailure(faliure.errMessage),
        );
      },
      (books) {
        emit(
          LibrarySucess(books),
        );
      },
    );
  }
}
