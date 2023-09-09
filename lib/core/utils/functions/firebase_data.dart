import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseData {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final User? user = FirebaseAuth.instance.currentUser;
  Future<bool> isBookInLibrary(String isbn) async {
    

    final DocumentSnapshot documentSnapshot =
        await _firestore.collection(user!.uid).doc(isbn).get();
    return documentSnapshot.exists;
  }

  Future<void> addBookToLibrary({required String bookDocumentISBN}) async {

    await _firestore.collection(user!.uid).doc(bookDocumentISBN).set({});
  }

  Future<void> removeBookFromLibrary(
      {required String bookDocumentISBN}) async {

    await _firestore.collection(user!.uid).doc(bookDocumentISBN).delete();
  }
}