import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'firebase_data_state.dart';

class FirebaseDataCubit extends Cubit<FirebaseDataState> {
  FirebaseDataCubit() : super(FirebaseDataInitial());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late List<String> _libraryIsbn;
  bool isBookInLibraryBool = false;

  Future<void> getLibraryDataFromDataBase() async {
    try {
      final String uid = FirebaseAuth.instance.currentUser!.uid;
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection(uid).get();
      final List<String> isbnList = querySnapshot.docs
          .map((DocumentSnapshot<Map<String, dynamic>> documentSnapshot) =>
              documentSnapshot.id)
          .toList();
      _libraryIsbn = isbnList;
      emit(GetLibraryDataSucess(libraryIsbn: _libraryIsbn));
    } catch (e) {
      emit(GetLibraryDataFailure( e.toString()));
    }
  }
   List<String> get libraryIsbn => _libraryIsbn;

  Future<bool> isBookInLibrary(String isbn) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .where(FieldPath.documentId, isEqualTo: isbn)
        .get();
    isBookInLibraryBool = result.docs.isNotEmpty;

    return result.docs.isNotEmpty;
  }

  Future<void> addBookToLibrary({required var bookDocumentISBN}) async {
    emit(
      AddBookToLibraryLoading(),
    );
    try {
      final User? user = FirebaseAuth.instance.currentUser;

      final _uid = user!.uid;
      FirebaseFirestore.instance.collection(_uid).doc(bookDocumentISBN).set({});
      emit(
        AddBookToLibrarySucess(),
      );
    } catch (e) {
      AddBookToLibraryFaliure(
        e.toString(),
      );
    }
  }

  Future<void> removeBookFromLibrary({required var bookDocumentISBN}) async {
    emit(
      RemoveBookFromLibraryLoading(),
    );
    try {
      final User? user = FirebaseAuth.instance.currentUser;

      final _uid = user!.uid;
      FirebaseFirestore.instance
          .collection(_uid)
          .doc(bookDocumentISBN)
          .delete();

      emit(
        RemoveBookFromLibrarySucess(),
      );
    } catch (e) {
      RemoveBookFromLibraryFaliure(
        e.toString(),
      );
    }
  }
}
