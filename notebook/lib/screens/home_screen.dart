import 'package:flutter/material.dart';
import 'package:notebook/home_sections/app_bar.dart';
import 'package:notebook/home_sections/note_cover.dart';
import 'package:notebook/services/firebase_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseServices _firebaseServices = FirebaseServices();
  List<Map<String, dynamic>> _notes = [];

  @override
  void initState() {
    super.initState();
    _getNotes();
  }

  void _getNotes() async {
    List<Map<String, dynamic>> notes = await _firebaseServices.getNotes();
    //notları olusturulma zamanına gore sırala
    notes.sort((a, b) => b['created_at'].compareTo(a['created_at']));
    setState(() {
      _notes = notes;
    });
  }

  //Not listesinin state'ini günceller
  //Note Content Screen'den geri gelindiğinde son görüntülenen notun bilgileri alınır ve liste güncellenir
  void _updateNotes(String id, String title, String content) {
    setState(() {
      for (var note in _notes) {
        if (note['id'] == id) {
          note['title'] = title;
          note['content'] = content;
        }
      }
    });
  }

  //silinen notu ana menudeki listeden de kaldirir
  void _deleteNote(id){
    setState(() {
      _notes.removeWhere((note) => note['id'] == id);
    });
  }

  //eklenen notu ana menudeki listeye de ekler
  void _addNote(String id, String title, String content) {
    setState(() {
      _notes.insert(0, {
        'id': id,
        'title': title,
        'content': content,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBarWidget(addNote: _addNote),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          const SizedBox(height: 10),
          _notes.isNotEmpty
              ? Column(
                  children: _notes.map((note) {
                    return Column(
                      children: <Widget>[
                        NoteCover(
                          noteId: note['id'],
                          noteTitle: note['title'],
                          noteContent: note['content'],
                          updateNotes: _updateNotes,
                          deleteNote: _deleteNote
                        ),
                        const SizedBox(height: 30),
                      ],
                    );
                  }).toList(),
                )
              : const Column(children: <Widget>[
                  SizedBox(
                    height: 300,
                  ),
                  Text(
                    'Not yok',
                    style: TextStyle(fontSize: 23),
                  ),
                ])
        ],
      ),
    );
  }
}
