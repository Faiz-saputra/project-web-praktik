import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;

  Future<void> addData(String collection, Map<String, dynamic> data) async {
    await db.collection(collection).add(data);
  }

  Future<void> addDataWithDoc(String collection, String document, Map<String, dynamic> data) async {
    await db.collection(collection).doc(document).set(data);
  }

  Future<List<Map<String, dynamic>>> findAll(String collection) {
    return db.collection(collection).get().then((snapshot) {
      return snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          ...doc.data(),
        };
      }).toList();
    });
  }

  Future<String> getId(String collection, instance,) async {
    var docId = '';
    for (var doc in await findAll(collection)) {
      if (doc['email'] == instance.email) {
        docId = doc['id'];
        break;
      }
    }
      return docId;
  }

  Future<DocumentSnapshot> findByDoc(String collection, String id) {
    return db.collection(collection).doc(id).get();
  }

  Future<void> deleteData(String collection, String id) async {
    await db.collection(collection).doc(id).delete();
  }

  Future<void> updateData(String collection, String id, Map<String, dynamic> data) async {
    await db.collection(collection).doc(id).update(data);
  }
}
