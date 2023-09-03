part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksFaliure extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksFaliure(this.errMessage);
}

final class SimilarBooksSucess extends SimilarBooksState {
  final List<NewBookModel> books;

  const SimilarBooksSucess(this.books);
}
