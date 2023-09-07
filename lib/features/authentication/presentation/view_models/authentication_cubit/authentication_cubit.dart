import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(loginSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(loginFailure(errMessage: 'user not found'));
      } else if (ex.code == 'wrong-password') {
        emit(loginFailure(errMessage: 'wrong password'));
      }
    } catch (e) {
      emit(loginFailure(errMessage: 'something went wrong'));
   }
  }

  Future<void> registerUser(
      {required String email,
      required String password,
      required String name}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

          
      final User? _user = FirebaseAuth.instance.currentUser;
      final _uid = _user!.uid;
      FirebaseFirestore.instance.collection('users').doc(_uid).set({
        'uid':_uid,
        'name': name,
      });
      emit(registerSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(registerFailure(errMessage: 'Weak Password'));
      } else if (ex.code == 'email-already-in-use') {
        emit(registerFailure(errMessage: 'Email already in use'));
      }
    } on Exception catch (e) {
      emit(registerFailure(errMessage: "Something went wrong"));
    }




  }
}
