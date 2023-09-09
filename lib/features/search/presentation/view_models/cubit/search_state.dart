part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSucess extends SearchState {
  final List<NewBookModel> books;

  const SearchSucess(this.books);
}

final class SearchCategorySucess extends SearchState{
   final List<NewBookModel> books;

  const SearchCategorySucess(this.books);
}

final class SearchFailure extends SearchState {
  final String errMessage;

  const SearchFailure(this.errMessage);
}
