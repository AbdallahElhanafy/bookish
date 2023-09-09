import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'firebase_data_state.dart';

class FirebaseDataCubit extends Cubit<FirebaseDataState> {
  FirebaseDataCubit() : super(FirebaseDataInitial());

  List<String> libraryIsbn = [];
  bool isBookInLibraryBool = false;

  Future<List<String>> getLibraryDataFromDataBase() async {
    emit(
      GetLibraryDataLoading(),
    );
    try {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection(FirebaseAuth.instance.currentUser!.uid)
          .get();
      List<String> documentIds = [];
      for (var doc in result.docs) {
        documentIds.add(doc.id);
      }
      emit(GetLibraryDataSucess());
      libraryIsbn = documentIds;
      
      return documentIds;
    } catch (e) {
      emit(
        GetLibraryDataFailure(
          e.toString(),
        ),
      );
      return [];
    }
  }

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
