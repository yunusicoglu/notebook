// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';



class FirebaseServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> addNote(String title, String content) async {
    CollectionReference notesCollection = db.collection('notes');

    try {
      await notesCollection.add({
        'title': title,
        'content': content,
        'created_at': FieldValue.serverTimestamp(),
      });
      print('Not bilgileri basariyla eklendi.');
    } catch (e) {
      print('Not eklenirken hata olustu: $e');
    }
  }

  Future<void> updateNote(String docId, String title, String content) async {
    CollectionReference notesCollection = db.collection('notes');

    try {
      await notesCollection.doc(docId).update({
        'title':title,
        'content': content,
        'updated_at': FieldValue.serverTimestamp(),
      });
      print('Not bilgileri basariyla guncellendi.');
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