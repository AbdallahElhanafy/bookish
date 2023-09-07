import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<List<String>> getDataFromDataBase() async {
  final QuerySnapshot result = await FirebaseFirestore.instance
      .collection(FirebaseAuth.instance.currentUser!.uid)
      .get();
  List<String> documentIds = [];
  for (var doc in result.docs) {
    documentIds.add(doc.id);
  }
  print(documentIds);
  return documentIds;
}
