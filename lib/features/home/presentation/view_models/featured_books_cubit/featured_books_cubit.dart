import 'package:bloc/bloc.dart';
import 'package:ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:ebook_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();

    result.fold(
      (faliure) {
        emit(
          FeaturedBooksFailure(faliure.errMessage),
        );
      },
      (books) {
        emit(
          FeaturedBooksSucess(books),
        );
      },
    );
  }
}