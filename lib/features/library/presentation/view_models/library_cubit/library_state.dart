part of 'library_cubit.dart';

sealed class LibraryState extends Equatable {
  const LibraryState();

  @override
  List<Object> get props => [];
}

final class LibraryInitial extends LibraryState {}

final class LibraryLoading extends LibraryState {}

final class LibrarySucess extends LibraryState {
  final List<NewBookModel> books;

  const LibrarySucess(this.books);
}

final class LibraryFailure extends LibraryState {
  final String errMessage;

  const LibraryFailure(this.errMessage);
}
