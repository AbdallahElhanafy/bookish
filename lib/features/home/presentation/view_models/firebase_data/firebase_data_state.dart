part of 'firebase_data_cubit.dart';

sealed class FirebaseDataState extends Equatable {
  const FirebaseDataState();

  @override
  List<Object> get props => [];
}
final class FirebaseDataInitial extends FirebaseDataState {}

final class GetLibraryDataLoading extends FirebaseDataState {}
final class GetLibraryDataSucess extends FirebaseDataState {
  final List<String> libraryIsbn;

  const GetLibraryDataSucess({required this.libraryIsbn});

  @override
  List<Object> get props => [libraryIsbn];
}
final class GetLibraryDataFailure extends FirebaseDataState {
  final String errMessage;

  const GetLibraryDataFailure(this.errMessage);
}

final class AddBookToLibraryLoading extends FirebaseDataState {}
final class AddBookToLibrarySucess extends FirebaseDataState {}
final class AddBookToLibraryFaliure extends FirebaseDataState {
  final String errMessage;

  const AddBookToLibraryFaliure(this.errMessage);
}

final class RemoveBookFromLibraryLoading extends FirebaseDataState {}
final class RemoveBookFromLibrarySucess extends FirebaseDataState {}
final class RemoveBookFromLibraryFaliure extends FirebaseDataState {
  final String errMessage;

  const RemoveBookFromLibraryFaliure(this.errMessage);
}


final class IsBookInLibraryTrue extends FirebaseDataState {}
final class IsBookInLibraryFalse extends FirebaseDataState {}