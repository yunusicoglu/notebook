// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';



class FirebaseServices {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> addDocument(String title, String content) async {
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

  





  void addNote(String title, String content){
    db.collection('notes').add({
      'title': title,
      'content': content,
      'timestamp': FieldValue.serverTimestamp(),
    }).then((value) {
      print('not eklendi');
    }).catchError((error){
      print('not eklenemedi: $error');
    });
  }
}