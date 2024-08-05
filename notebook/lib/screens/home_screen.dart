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
    setState(() {
      _notes = notes;
    });
  }
    
  //Note Content Screen'den geri gelindiğinde son görüntülenen notun bilgileri alınır ve liste değişkeni güncellenir
  void _updateNotes(String id, String title, String content){
    setState(() {
      for (var note in _notes) {
        if (note['id'] == id) {
          note['title'] = title;
          note['content'] = content;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: const AppBarWidget(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            const Divider(thickness: 1,),
            const SizedBox(height: 30),
            _notes.isNotEmpty
              ? Column(
                  children: _notes.map((note){
                    return Column(
                      children: <Widget>[
                        NoteCover(noteId: note['id'], noteTitle: note['title'], noteContent: note['content'], updateNotes: _updateNotes,),
                        const SizedBox(height: 30),
                      ],
                    );
                  }).toList(),
                )
              : const Text('Not yok.')
          ],
        ),
      )
    );
  }
}



                // const Divider(thickness: 1,),
                // const SizedBox(height: 30),
                // Column(
                //   children: <Widget>[
                //     NoteCover(noteId: note['id'], noteTitle: note['title'], noteContent: note['content'],),
                //     const SizedBox(height: 30),