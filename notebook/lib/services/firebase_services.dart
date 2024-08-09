// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> addNote() async {
    CollectionReference notesCollection = db.collection('notes');

    try {
      DocumentReference docRef = await notesCollection.add({
        'title': '',
        'content': '',
        'created_at': FieldValue.serverTimestamp(),
      });
      // return docRef.id;
      return {'id': docRef.id, 'title': '', 'content': ''};
    } catch (e) {
      print('Not eklenirken hata olustu: $e');
      return null;
    }
  }

  Future<bool> deleteNote(String id) async {
    CollectionReference notesCollection = db.collection('notes');

    try {
      await notesCollection.doc(id).delete();
      return true;
    } catch (e) {
      print('Not silinirken hata: $e');
      return false;
    }
  }

  Future<void> updateNote(String docId, String title, String content) async {
    CollectionReference notesCollection = db.collection('notes');

    try {
      await notesCollection.doc(docId).update({
        'title': title,
        'content': content,
        'updated_at': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Not guncellenirken bir hata olustu: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getNotes() async {
    CollectionReference notesCollection = db.collection('notes');

    try {
      QuerySnapshot querySnapshot = await notesCollection.get();
      List<Map<String, dynamic>> notes = querySnapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'title': doc['title'],
          'content': doc['content'],
          'created_at': doc['created_at'],
        };
      }).toList();
      return notes;
    } catch (e) {
      print('Notlar alinirken hata olustu: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>?> getNoteById(String id) async {
    DocumentReference noteDocument = db.collection('notes').doc(id);

    try {
      DocumentSnapshot documentSnapshot = await noteDocument.get();
      if (documentSnapshot.exists) {
        return {
          'id': documentSnapshot.id,
          'title': documentSnapshot['title'],
          'content': documentSnapshot['content'],
          'created_at': documentSnapshot['created_at'],
        };
      } else {
        print('Boyle bir dokuman mevcut degil');
        return null;
      }
    } catch (e) {
      print('Dokuman alinamadi: $e');
      return null;
    }
  }
}
