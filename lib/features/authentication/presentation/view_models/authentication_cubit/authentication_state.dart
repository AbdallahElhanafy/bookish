part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class loginSuccess extends AuthenticationState {}

class loginFailure extends AuthenticationState {

 final String errMessage;
  loginFailure({required this.errMessage});
  
}

class registerSuccess extends AuthenticationState {}

class registerFailure extends AuthenticationState {

  final String errMessage;
  registerFailure({required this.errMessage});

}

