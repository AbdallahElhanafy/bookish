import 'package:bloc/bloc.dart';
import 'package:ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:ebook_app/features/home/data/models/book_model_v2/book_model_v2.dart';
import 'package:ebook_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo, this.query) : super(SearchInitial());

  final SearchRepo searchRepo;

  String query;

  Future<void> searchBooks({required String query}) async {
    emit(SearchLoading());
    var result = await searchRepo.searchBooks(query: query);

    result.fold(
      (faliure) {
        emit(
          SearchFailure(faliure.errMessage),
        );
      },
      (books) {
        emit(
          SearchSucess(books),
        );
      },
    );
  }
}
