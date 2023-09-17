part of 'shared_prefs_cubit.dart';

abstract class SharedPrefsState extends Equatable {
  const SharedPrefsState();

  @override
  List<Object> get props => [];
}

class SharedPrefsInitial extends SharedPrefsState {}

class SharedPrefsLoaded extends SharedPrefsState {
  final List<String> favoriteBooks;

  const SharedPrefsLoaded(this.favoriteBooks);

  @override
  List<Object> get props => [favoriteBooks];
}

class SharedPrefsError extends SharedPrefsState {}