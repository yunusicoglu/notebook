import 'package:flutter/material.dart';
import 'package:notebook/note_content_sections/content_title.dart';
import 'package:notebook/note_content_sections/content_top_section.dart';
import './../services/firebase_services.dart';

class NoteContentScreen extends StatefulWidget {
  const NoteContentScreen({super.key});

  @override
  State<NoteContentScreen> createState() => _NoteContentState();
}

class _NoteContentState extends State<NoteContentScreen> {

  String _title = '';

  void updateTitle(String title) {
    setState(() {
      _title = title;
    });
  }


  void saveAndExit() async {
    print('verıtabanına eklenecek: $_title');
    Navigator.pop(context);

    FirebaseServices firebaseServices = FirebaseServices();
    await firebaseServices.addDocument(_title, 'Not icerigi ornek');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ContentTopSection(saveAndExit: saveAndExit),
          const SizedBox(height: 10),
          ContentTitle(updateTitle: updateTitle)
        ],
      ),
    );
  }
}
