part of 'book_status_cubit.dart';

abstract class BookStatusState extends Equatable {
  const BookStatusState();

  @override
  List<Object> get props => [];
}

class BookStatusInitial extends BookStatusState {}

class BookStatusLoaded extends BookStatusState {
  final bool isBookInLibrary;

  const BookStatusLoaded(this.isBookInLibrary);

  @override
  List<Object> get props => [isBookInLibrary];
}

class BookStatusError extends BookStatusState {}