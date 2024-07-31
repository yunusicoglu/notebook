import 'package:flutter/material.dart';
import 'package:notebook/note_content_sections/content_title.dart';
import 'package:notebook/note_content_sections/content_top_section.dart';

class NoteContentScreen extends StatefulWidget {
  const NoteContentScreen({super.key});

  @override
  State<NoteContentScreen> createState() => _NoteContentState();
}

class _NoteContentState extends State<NoteContentScreen> {



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [ContentTopSection()]
          ),
          SizedBox(height: 10),
          ContentTitle()
        ],
      ),
    );
  }
}
